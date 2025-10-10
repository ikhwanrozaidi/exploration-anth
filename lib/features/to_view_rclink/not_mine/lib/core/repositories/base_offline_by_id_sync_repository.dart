import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

/// Query metadata for cache validation
class QueryMetadata {
  final Map<String, dynamic> params;
  final DateTime cachedAt;
  final String queryKey;

  QueryMetadata({
    required this.params,
    required this.cachedAt,
    required this.queryKey,
  });

  /// Generate unique query key from parameters
  static String generateKey(Map<String, dynamic> params) {
    final sortedKeys = params.keys.toList()..sort();
    final keyParts = sortedKeys
        .where((key) => params[key] != null)
        .map((key) => '$key:${params[key]}')
        .join('|');
    return keyParts.isEmpty ? 'default' : keyParts;
  }

  bool isCacheValid(Duration? timeout) {
    if (timeout == null) return true;
    final age = DateTime.now().difference(cachedAt);
    return age < timeout;
  }
}

/// Smart repository for GET operations with:
/// - Cache per unique query parameters
/// - Intelligent data merging (UPSERT by UID)
/// - Pagination accumulation
/// - Single entity vs List detection
/// - Relationship-aware caching via parent IDs
abstract class BaseOfflineByIdSyncRepository<T, M> {
  /// For LIST operations with intelligent caching
  ///
  /// Features:
  /// - Caches each unique query separately (e.g., districtId=1 vs districtId=2)
  /// - Accumulates paginated results into one list
  /// - UPSERT by UID (no duplicates, updates existing items)
  /// - Works offline with cached data
  Future<Either<Failure, List<T>>> getListOfflineFirst({
    required Future<List<T>> Function() getLocal,
    required Future<Either<Failure, List<M>>> Function() getRemote,
    required Future<void> Function(
      List<T> entities, {
      required bool clearBefore,
    })
    saveLocal,
    required T Function(M model) toEntity,
    required Map<String, dynamic> queryParams,
    required Future<QueryMetadata?> Function(String queryKey) getCacheMetadata,
    required Future<void> Function(QueryMetadata metadata) saveCacheMetadata,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
    bool accumulatePagination = false,
  }) async {
    try {
      final queryKey = QueryMetadata.generateKey(queryParams);
      final cacheMetadata = await getCacheMetadata(queryKey);

      // Check if we should use cache
      bool useCache = false;
      if (!forceRefresh && cacheMetadata != null) {
        if (cacheMetadata.isCacheValid(cacheTimeout)) {
          useCache = true;
        }
      }

      // Return cached data if valid
      if (useCache) {
        final localData = await getLocal();
        if (localData.isNotEmpty) {
          return Right(localData);
        }
      }

      // Fetch from remote
      try {
        final remoteResult = await getRemote();

        return await remoteResult.fold(
          (failure) async {
            // Fallback to local data if remote fails
            final localData = await getLocal();
            if (localData.isNotEmpty) {
              return Right(localData);
            }
            return Left(failure);
          },
          (models) async {
            final remoteEntities = models.map(toEntity).toList();

            // Merge strategy: UPSERT by UID
            final localData = await getLocal();
            final mergedData = _mergeListData(
              local: localData,
              remote: remoteEntities,
              accumulatePagination: accumulatePagination,
              currentPage: queryParams['page'] as int? ?? 1,
            );

            // Determine if we should clear before saving
            final shouldClearBefore =
                !accumulatePagination ||
                (queryParams['page'] as int? ?? 1) == 1;

            // Save merged data
            await saveLocal(mergedData, clearBefore: shouldClearBefore);

            // Save cache metadata
            await saveCacheMetadata(
              QueryMetadata(
                params: queryParams,
                cachedAt: DateTime.now(),
                queryKey: queryKey,
              ),
            );

            return Right(mergedData);
          },
        );
      } catch (e) {
        // Network error - return local data if available
        final localData = await getLocal();
        if (localData.isNotEmpty) {
          return Right(localData);
        }
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (e) {
      return Left(CacheFailure('Failed to access local data: ${e.toString()}'));
    }
  }

  /// For SINGLE ENTITY operations
  ///
  /// Features:
  /// - Caches by unique identifier (UID)
  /// - Simple cache validation
  /// - Works offline
  Future<Either<Failure, T>> getSingleOfflineFirst({
    required Future<T?> Function() getLocal,
    required Future<Either<Failure, M>> Function() getRemote,
    required Future<void> Function(T entity) saveLocal,
    required T Function(M model) toEntity,
    required String entityId,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  }) async {
    try {
      // Check local first
      final localData = await getLocal();

      if (localData != null && !forceRefresh) {
        if (_isCacheValid(localData, cacheTimeout)) {
          return Right(localData);
        }
      }

      // Try remote
      try {
        final remoteResult = await getRemote();

        return await remoteResult.fold(
          (failure) async {
            if (localData != null) return Right(localData);
            return Left(failure);
          },
          (model) async {
            final entity = toEntity(model);
            await saveLocal(entity);
            return Right(entity);
          },
        );
      } catch (e) {
        if (localData != null) return Right(localData);
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (e) {
      return Left(CacheFailure('Failed to access local data: ${e.toString()}'));
    }
  }

  /// Intelligent merge for list data (GET operations only)
  ///
  /// Strategy:
  /// 1. For pagination: accumulate or replace based on flag
  /// 2. Use UID to prevent duplicates (UPSERT logic)
  /// 3. Remote data always overwrites local data with same UID
  List<T> _mergeListData({
    required List<T> local,
    required List<T> remote,
    required bool accumulatePagination,
    required int currentPage,
  }) {
    if (accumulatePagination && currentPage > 1) {
      // ACCUMULATE MODE: Keep existing + add new (for pagination)

      // Get all UIDs from local data
      final localUids = local
          .map((item) => _extractUid(item))
          .where((uid) => uid != null)
          .toSet();

      // Get all UIDs from remote data
      final remoteUids = remote
          .map((item) => _extractUid(item))
          .where((uid) => uid != null)
          .toSet();

      // Update existing items with remote versions (remote overwrites)
      final updatedLocal = local.map((localItem) {
        final uid = _extractUid(localItem);
        if (uid != null && remoteUids.contains(uid)) {
          // Find matching remote item and use it
          return remote.firstWhere(
            (remoteItem) => _extractUid(remoteItem) == uid,
            orElse: () => localItem,
          );
        }
        return localItem;
      }).toList();

      // Add new items from remote that don't exist locally
      final newRemoteItems = remote.where((item) {
        final uid = _extractUid(item);
        return uid != null && !localUids.contains(uid);
      }).toList();

      return [...updatedLocal, ...newRemoteItems];
    } else {
      // REPLACE MODE: Use remote data (for first page or non-pagination)
      return remote;
    }
  }

  /// Extract UID from entity (assumes entity has 'uid' property)
  String? _extractUid(T entity) {
    try {
      final dynamic e = entity;
      if (e.uid is String) return e.uid as String;
      if (e.uid is int) return e.uid.toString();
    } catch (_) {}
    return null;
  }

  /// Check if cache is valid based on updatedAt timestamp
  bool _isCacheValid(T entity, Duration? cacheTimeout) {
    if (cacheTimeout == null) return true;

    try {
      final dynamic e = entity;
      if (e.updatedAt is DateTime) {
        final age = DateTime.now().difference(e.updatedAt as DateTime);
        return age < cacheTimeout;
      }
    } catch (_) {}

    return true;
  }
}
