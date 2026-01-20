import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/program/data/models/program_create/create_program_response_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';

import '../../../road/domain/entities/package_data_response_entity.dart';
import '../../domain/entities/program_entity.dart';
import '../../domain/entities/program_settings/program_setting_entity.dart';
import '../../domain/repositories/program_repository.dart';
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

  ProgramRepositoryImpl(this._localDataSource, this._remoteDataSource);

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
      (programModel) {
        print('✅ Repository: Program received from API');

        // TODO: Store to local database if needed
        // await _localDataSource.saveProgram(programModel);

        final entity = programModel.toEntity();
        return Right(entity);
      },
    );
  }
}
