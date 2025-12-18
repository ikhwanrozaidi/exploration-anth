// lib/features/warnings/data/repositories/warning_repository_impl.dart

import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../../../core/sync/datasources/image_local_datasource.dart';
import '../../../../core/sync/sync_constants.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../domain/entities/warning.dart';
import '../../domain/repositories/warning_repository.dart';
import '../datasources/warning_image_remote_datasource.dart';
import '../datasources/warnings_local_datasource.dart';
import '../datasources/warnings_remote_datasource.dart';
import '../models/create_report_warning_model.dart';
import '../models/create_warning_model.dart';
import '../models/warning_model.dart';

@LazySingleton(as: WarningRepository)
class WarningRepositoryImpl
    extends BaseOfflineSyncRepository<List<Warning>, List<WarningModel>>
    implements WarningRepository {
  final WarningsRemoteDataSource _remoteDataSource;
  final WarningsLocalDataSource _localDataSource;
  final CompanyBloc _companyBloc;
  final ImageLocalDataSource _imageLocalDataSource;
  final WarningImageRemoteDataSource _imageRemoteDataSource;

  WarningRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._companyBloc,
    DatabaseService databaseService,
    this._imageLocalDataSource,
    this._imageRemoteDataSource,
  ) : super(
        databaseService: databaseService,
        imageLocalDataSource: _imageLocalDataSource,
      );

  @override
  Future<Either<Failure, List<Warning>>> getWarnings({
    required String companyUID,
    int page = 1,
    int limit = 50,
    String sortOrder = 'desc',
    List<String>? warningType,
    String? roadUID,
    String? workScopeUID,
    String? contractRelationUID,
    String? dailyReportUID,
    bool? isResolved,
    bool? requiresAction,
  }) async {
    final remoteResult = await _remoteDataSource.getWarnings(
      companyUID: companyUID,
      page: page,
      limit: limit,
      sortOrder: sortOrder,
      warningType: warningType,
      roadUID: roadUID,
      workScopeUID: workScopeUID,
      contractRelationUID: contractRelationUID,
      dailyReportUID: dailyReportUID,
      isResolved: isResolved,
      requiresAction: requiresAction,
    );

    return remoteResult.fold(
      (failure) async {
        final localWarnings = await _localDataSource.getCachedWarnings(
          companyUID,
        );

        if (localWarnings != null && localWarnings.isNotEmpty) {
          return Right(localWarnings.map((model) => model.toEntity()).toList());
        }

        return Left(failure);
      },
      (models) async {
        unawaited(_localDataSource.cacheWarnings(models));

        return Right(models.map((model) => model.toEntity()).toList());
      },
    );
  }

  @override
  Future<Either<Failure, Warning>> getWarningById({
    required String companyUID,
    required String uid,
    bool forceRefresh = false,
  }) async {
    try {
      if (!forceRefresh) {
        final cachedWarning = await _localDataSource.getCachedWarningByUid(uid);
        if (cachedWarning != null) {
          return Right(cachedWarning.toEntity());
        }
      }

      final remoteResult = await _remoteDataSource.getWarningById(
        companyUID: companyUID,
        uid: uid,
      );

      return remoteResult.fold(
        (failure) async {
          final cachedWarning = await _localDataSource.getCachedWarningByUid(
            uid,
          );
          if (cachedWarning != null) {
            return Right(cachedWarning.toEntity());
          }
          return Left(failure);
        },
        (model) async {
          await _localDataSource.cacheSingleWarning(model);
          return Right(model.toEntity());
        },
      );
    } catch (e) {
      return Left(CacheFailure('Failed to get warning: $e'));
    }
  }

  @override
  Future<Either<Failure, Warning>> resolveWarningItem({
    required String companyUID,
    required String warningUID,
    required String itemUID,
    String? notes,
  }) async {
    print('🟢 [WarningRepository] resolveWarningItem called');
    print('   companyUID: $companyUID');
    print('   warningUID: $warningUID');
    print('   itemUID: $itemUID');

    try {
      // Use base class executeOptimistic with automatic SyncQueue fallback
      return await executeOptimistic<Warning, WarningModel>(
        local: () async {
          print('🟢 [WarningRepository] Executing local update...');

          // Get the cached warning first
          final cachedWarning = await _localDataSource.getCachedWarningByUid(
            warningUID,
          );

          if (cachedWarning == null) {
            print('❌ [WarningRepository] Warning not found in cache');
            throw Exception('Warning not found locally');
          }

          print(
            '🟢 [WarningRepository] Found cached warning, updating item...',
          );

          final updatedWarningItems = cachedWarning.warningItems.map((item) {
            if (item.uid == itemUID) {
              return item.copyWith(
                isCompleted: true,
                completedAt: DateTime.now(),
                notes: notes ?? item.notes,
              );
            }
            return item;
          }).toList();

          final allItemsCompleted = updatedWarningItems.every(
            (item) => item.isCompleted,
          );

          // Update the warning with resolved items and isResolved flag
          final updatedWarning = cachedWarning.copyWith(
            warningItems: updatedWarningItems,
            isResolved: allItemsCompleted,
          );

          // Cache the updated warning
          await _localDataSource.cacheSingleWarning(updatedWarning);

          print(
            '🟢 [WarningRepository] Local update complete, returning entity',
          );
          return updatedWarning.toEntity();
        },
        remote: () {
          print('🟢 [WarningRepository] Executing remote call...');
          return _remoteDataSource.resolveWarningItem(
            companyUID: companyUID,
            warningUID: warningUID,
            itemUID: itemUID,
            notes: notes,
          );
        },
        onSyncSuccess: (serverModel, tempUID) async {
          print('✅ [WarningRepository] Remote sync successful, updating cache');
          // Update local DB with server data
          await _localDataSource.cacheSingleWarning(serverModel);
        },
        entityType: SyncEntityType.warningItem,
        action: SyncAction.update,
        payload: {
          'companyUID': companyUID,
          'warningUID': warningUID,
          'itemUID': itemUID,
          if (notes != null) 'notes': notes,
        },
        priority: 8, // High priority - user-triggered action
      );
    } catch (e) {
      print('❌ [WarningRepository] Exception: $e');
      return Left(CacheFailure('Failed to resolve warning item: $e'));
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      await _localDataSource.clearCache();
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear cache: $e'));
    }
  }

  @override
  Future<Either<Failure, List<Warning>?>> getDraftWarnings(
    String companyUID,
  ) async {
    try {
      final drafts = await _localDataSource.getDraftWarnings(companyUID);

      if (drafts == null) {
        return const Right(null);
      }

      return Right(drafts.map((model) => model.toEntity()).toList());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Warning>> createSiteWarning({
    required CreateWarningModel data,
    required String companyUID,
    Map<ImageContextField, List<String>>? images,
    String? adminUID,
  }) async {
    try {
      // Use base class executeOptimistic with automatic SyncQueue fallback
      return await executeOptimistic<Warning, WarningModel>(
        local: () async {
          // Step 1: Create locally with temp UID
          final localWarning = await _localDataSource.createSiteWarningLocal(
            data,
            companyUID,
          );

          // Step 2: Save images to sync queue if provided
          print(
            '💾 Checking image save conditions: images=${images != null ? "not null (${images.length} fields)" : "null"}, adminUID=${adminUID ?? "null"}',
          );

          if (images != null && images.isNotEmpty && adminUID != null) {
            print(
              '📸 Saving ${images.length} image context field(s) for warning ${localWarning.uid}',
            );

            await saveImagesForEntity(
              entityType: SyncEntityType.warning,
              entityUID: localWarning.uid,
              companyUID: companyUID,
              uploadedByUID: adminUID,
              imagesByContextField: images,
            );

            print(
              '✅ Images saved to sync queue with status: pendingEntitySync',
            );
          } else {
            print('ℹ️ No images to save (or adminUID missing)');
          }

          print('✅ Local site warning created: ${localWarning.uid}');
          return localWarning.toEntity();
        },
        remote: () => _remoteDataSource.createSiteWarning(
          data: data,
          companyUID: companyUID,
        ),
        onSyncSuccess: (serverModel, tempUID) async {
          print('✅ Site warning synced successfully, updating local DB');

          await _localDataSource.cacheSingleWarning(serverModel);

          if (tempUID != serverModel.uid) {
            await _localDataSource.deleteWarningByUID(tempUID);
          }

          // Step 3: Activate images for upload
          if (images != null && images.isNotEmpty) {
            print(
              '🔄 Activating images for upload: $tempUID → ${serverModel.uid}',
            );

            await activateImageUpload(
              SyncEntityType.warning,
              tempUID,
              serverModel.uid,
            );

            print('✅ Images activated for upload');

            // Step 4: Fire-and-forget immediate upload
            _uploadImagesImmediately(companyUID, serverModel.uid);
          }
        },
        entityType: SyncEntityType.warning,
        action: SyncAction.create,
        payload: {...data.toJson(), 'companyUID': companyUID},
        priority: 10,
      );
    } catch (e) {
      return Left(CacheFailure('Failed to create site warning: $e'));
    }
  }

  /// Attempt immediate image upload in the background
  Future<void> _uploadImagesImmediately(
    String companyUID,
    String warningUID,
  ) async {
    try {
      final images = await _imageLocalDataSource.getImagesByEntity(
        entityType: SyncEntityType.warning,
        entityUID: warningUID,
      );

      if (images.isEmpty) {
        print('ℹ️ No images to upload for warning $warningUID');
        return;
      }

      print('📤 Uploading ${images.length} images immediately...');

      final result = await _imageRemoteDataSource.uploadImagesForWarning(
        companyUID: companyUID,
        warningUID: warningUID,
        images: images,
      );

      await result.fold(
        (failure) async {
          print('⚠️ Immediate image upload failed: ${failure.message}');
          print('   Images will retry via periodic sync');

          await _imageLocalDataSource.incrementRetryCount(
            SyncEntityType.warning,
            warningUID,
            failure.message,
          );
        },
        (uploadedFiles) async {
          print(
            '✅ Immediate upload successful! ${uploadedFiles.length} images uploaded',
          );

          await _imageLocalDataSource.markImagesAsSynced(
            SyncEntityType.warning,
            warningUID,
            uploadedFiles,
          );
        },
      );
    } catch (e) {
      print('❌ Error in immediate image upload: $e');
      print('   Images will retry via periodic sync');

      await _imageLocalDataSource.incrementRetryCount(
        SyncEntityType.warning,
        warningUID,
        e.toString(),
      );
    }
  }
}
