import 'package:dartz/dartz.dart';
import '../errors/failures.dart';

/// Base repository class that implements offline-first pattern
/// T: Entity type
/// M: Model type (from API)
abstract class BaseOfflineRepository<T, M> {
  /// Executes an offline-first operation with automatic fallback
  /// 
  /// Parameters:
  /// - [getLocal]: Function to retrieve data from local storage
  /// - [getRemote]: Function to fetch data from remote API
  /// - [saveLocal]: Function to save data to local storage
  /// - [toEntity]: Function to convert model to entity
  /// - [forceRefresh]: Force fetch from remote even if cache is valid
  /// - [cacheTimeout]: Duration for cache validity
  /// - [isValidCache]: Optional custom cache validation logic
  Future<Either<Failure, T>> executeOfflineFirst({
    required Future<T?> Function() getLocal,
    required Future<Either<Failure, M>> Function() getRemote,
    required Future<void> Function(T entity) saveLocal,
    required T Function(M model) toEntity,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
    bool Function(T local)? isValidCache,
  }) async {
    try {
      // Step 1: Check local cache first
      final localData = await getLocal();
      
      // If we have local data and not forcing refresh
      if (localData != null && !forceRefresh) {
        // Use custom validation or default time-based validation
        final isValid = isValidCache?.call(localData) ?? 
            _isDefaultCacheValid(localData, cacheTimeout);
            
        if (isValid) {
          return Right(localData);
        }
      }
      
      // Step 2: Try to fetch from remote
      try {
        final remoteResult = await getRemote();
        
        return await remoteResult.fold(
          (failure) async {
            // Remote failed but we have local data
            if (localData != null) {
              return Right(localData);
            }
            return Left(failure);
          },
          (model) async {
            // Convert and save
            final entity = toEntity(model);
            await saveLocal(entity);
            return Right(entity);
          },
        );
      } catch (e) {
        // Network error - fall back to local if available
        if (localData != null) {
          return Right(localData);
        }
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (e) {
      return Left(CacheFailure('Failed to access local data: ${e.toString()}'));
    }
  }

  /// Executes an offline-first list operation
  Future<Either<Failure, List<T>>> executeOfflineFirstList({
    required Future<List<T>> Function() getLocal,
    required Future<Either<Failure, List<M>>> Function() getRemote,
    required Future<void> Function(List<T> entities) saveLocal,
    required T Function(M model) toEntity,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
    bool Function(List<T> local)? isValidCache,
  }) async {
    try {
      // Step 1: Check local cache first
      final localData = await getLocal();
      
      // If we have local data and not forcing refresh
      if (localData.isNotEmpty && !forceRefresh) {
        // Use custom validation or default time-based validation
        final isValid = isValidCache?.call(localData) ?? 
            (cacheTimeout != null && localData.isNotEmpty);
            
        if (isValid) {
          return Right(localData);
        }
      }
      
      // Step 2: Try to fetch from remote
      try {
        final remoteResult = await getRemote();
        
        return await remoteResult.fold(
          (failure) async {
            // Remote failed but we have local data
            if (localData.isNotEmpty) {
              return Right(localData);
            }
            return Left(failure);
          },
          (models) async {
            // Convert and save
            final entities = models.map(toEntity).toList();
            await saveLocal(entities);
            return Right(entities);
          },
        );
      } catch (e) {
        // Network error - fall back to local if available
        if (localData.isNotEmpty) {
          return Right(localData);
        }
        return Left(NetworkFailure('No internet connection'));
      }
    } catch (e) {
      return Left(CacheFailure('Failed to access local data: ${e.toString()}'));
    }
  }

  /// Default cache validation based on updatedAt timestamp
  bool _isDefaultCacheValid(T entity, Duration? cacheTimeout) {
    if (cacheTimeout == null) return true;
    
    // Try to get updatedAt via reflection or dynamic access
    try {
      final dynamic dynamicEntity = entity;
      if (dynamicEntity.updatedAt is DateTime) {
        final cacheAge = DateTime.now().difference(dynamicEntity.updatedAt as DateTime);
        return cacheAge < cacheTimeout;
      }
    } catch (_) {
      // If entity doesn't have updatedAt, consider cache always valid
      // unless forceRefresh is used
    }
    
    return true;
  }
}

/// Mixin for repositories that need offline-first behavior
mixin OfflineFirstMixin<T, M> {
  final _baseRepository = _OfflineFirstHelper<T, M>();
  
  Future<Either<Failure, T>> executeOfflineFirst({
    required Future<T?> Function() getLocal,
    required Future<Either<Failure, M>> Function() getRemote,
    required Future<void> Function(T entity) saveLocal,
    required T Function(M model) toEntity,
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
    bool Function(T local)? isValidCache,
  }) {
    return _baseRepository.executeOfflineFirst(
      getLocal: getLocal,
      getRemote: getRemote,
      saveLocal: saveLocal,
      toEntity: toEntity,
      forceRefresh: forceRefresh,
      cacheTimeout: cacheTimeout,
      isValidCache: isValidCache,
    );
  }
}

// Helper class to use the base repository functionality
class _OfflineFirstHelper<T, M> extends BaseOfflineRepository<T, M> {}