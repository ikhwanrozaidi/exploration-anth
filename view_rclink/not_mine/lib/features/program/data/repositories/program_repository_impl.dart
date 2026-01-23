import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/program/data/models/program_create/create_program_response_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';

import '../../../../core/sync/datasources/image_local_datasource.dart';
import '../../../../core/sync/sync_constants.dart';
import '../../../road/domain/entities/package_data_response_entity.dart';
import '../../domain/entities/program_entity.dart';
import '../../domain/entities/program_settings/program_setting_entity.dart';
import '../../domain/repositories/program_repository.dart';
import '../datasource/program_image_remote_datasource.dart';
import '../datasource/program_settings_local_datasource.dart';
import '../datasource/program_remote_datasource.dart';
import '../models/program_settings/program_setting_model.dart';
import '../models/program_create/submit_program_request_model.dart';

@LazySingleton(as: ProgramRepository)
class ProgramRepositoryImpl
    extends
        BaseOfflineSyncRepository<
          List<ProgramSetting>,
          List<ProgramSettingModel>
        >
    implements ProgramRepository {
  final ProgramSettingsLocalDataSource _localDataSource;
  final ProgramRemoteDataSource _remoteDataSource;
  final ImageLocalDataSource _imageLocalDataSource;
  final ProgramImageRemoteDataSource _imageRemoteDataSource;

  ProgramRepositoryImpl(
    this._localDataSource,
    this._remoteDataSource,
    this._imageLocalDataSource,
    this._imageRemoteDataSource,
  );

  @override
  Future<Either<Failure, List<ProgramSetting>>> getProgramSettings({
    bool forceRefresh = false,
  }) async {
    return getOfflineFirst(
      forceRefresh: forceRefresh,
      getLocal: () async {
        final result = await _localDataSource.getLocal();
        return result.fold(
          (failure) => null,
          (settings) =>
              settings.map((e) => ProgramSettingModelX.fromEntity(e)).toList(),
        );
      },
      getRemote: () async {
        final result = await _remoteDataSource.getProgramSettings();
        return result.fold(
          (failure) => Left(failure),
          (settings) => Right(
            settings.map((e) => ProgramSettingModelX.fromEntity(e)).toList(),
          ),
        );
      },
      saveLocal: (models, {bool markForSync = false}) async {
        final entities = models.map((m) => m.toEntity()).toList();
        await _localDataSource.saveLocal(entities);
      },
      toEntity: (models) => models.map((m) => m.toEntity()).toList(),
      cacheTimeout: const Duration(hours: 24),
    );
  }

  @override
  Future<Either<Failure, PackageDataResponse>> getContractorRoads({
    required String contractorRelationUID,
  }) async {
    // For contractor roads, we always fetch fresh data from API
    // No caching needed as this is contractor-specific and changes frequently
    return await _remoteDataSource.getContractorRoads(
      contractorRelationUID: contractorRelationUID,
    );
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    return await _localDataSource.clearCache();
  }

  @override
  Future<Either<Failure, Program>> submitProgram({
    required String companyUID,
    required SubmitProgramRequestModel requestModel,
  }) async {
    print('📤 Repository: Submitting program...');

    final result = await _remoteDataSource.submitProgram(
      companyUID: companyUID,
      requestModel: requestModel,
    );

    return result.fold(
      (failure) {
        print('❌ Repository: Failed - ${failure.message}');
        return Left(failure);
      },
      (programModel) async {
        print('✅ Repository: Program received from API');

        // TODO: Store to local database if needed
        // await _localDataSource.saveProgram(programModel);

        final entity = programModel.toEntity();

        // Upload images immediately after successful submission (R02 ONLY)
        await _uploadProgramImagesImmediately(
          companyUID: companyUID,
          programUID: entity.uid ?? '',
        );

        return Right(entity);
      },
    );
  }

  /// Upload images for program immediately after submission
  /// This is called from the repository after successful program creation
  /// ONLY FOR R02 PROGRAMS - Non-R02 programs don't have images
  Future<void> _uploadProgramImagesImmediately({
    required String companyUID,
    required String programUID,
  }) async {
    try {
      print('🔍 DEBUG: _uploadProgramImagesImmediately called');
      print('   companyUID: $companyUID');
      print('   programUID: $programUID');

      // Get activated images for this program
      final images = await _imageLocalDataSource.getImagesByEntity(
        entityType: SyncEntityType.program,
        entityUID: programUID,
      );
      print('✅ DEBUG: getImagesByEntity completed');
      print('   Found ${images.length} images');

      if (images.isEmpty) {
        print('ℹ️ No images to upload for program $programUID');
        return;
      }

      // Debug each image record
      for (int i = 0; i < images.length; i++) {
        final img = images[i];
        print('🔍 DEBUG: Image $i:');
        print('   - id: ${img.id}');
        print('   - entityType: ${img.entityType}');
        print('   - entityUID: ${img.entityUID}');
        print('   - contextField: ${img.contextField}');
        print('   - sequence: ${img.sequence}');
        print('   - localFilePath: ${img.localFilePath}');
        print('   - fileName: ${img.fileName}');
        print('   - mimeType: ${img.mimeType}');
        print('   - fileSize: ${img.fileSize}');
        print('   - companyUID: ${img.companyUID}');
        print('   - uploadedByUID: ${img.uploadedByUID}');
        print('   - syncStatus: ${img.syncStatus}');
        print('   - retryCount: ${img.retryCount}');
      }

      print('📤 Uploading ${images.length} images immediately...');
      print('🔍 DEBUG: Calling uploadImagesForProgram...');

      final result = await _imageRemoteDataSource.uploadImagesForProgram(
        companyUID: companyUID,
        programUID: programUID,
        images: images,
      );

      print('✅ DEBUG: uploadImagesForProgram completed');

      await result.fold(
        (failure) async {
          print('⚠️ Immediate image upload failed: ${failure.message}');
          print('   Images will retry via periodic sync');

          await _imageLocalDataSource.incrementRetryCount(
            SyncEntityType.program,
            programUID,
            failure.message,
          );
        },
        (uploadedFiles) async {
          print(
            '✅ Immediate upload successful! ${uploadedFiles.length} images uploaded',
          );

          await _imageLocalDataSource.markImagesAsSynced(
            SyncEntityType.program,
            programUID,
            uploadedFiles,
          );
        },
      );
    } catch (e, stackTrace) {
      print('❌ Error in immediate image upload: $e');
      print('📍 Stack trace:');
      print(stackTrace);
      print('   Images will retry via periodic sync');

      try {
        await _imageLocalDataSource.incrementRetryCount(
          SyncEntityType.program,
          programUID,
          e.toString(),
        );
      } catch (incrementError) {
        print('❌ Error incrementing retry count: $incrementError');
      }
    }
  }
}
