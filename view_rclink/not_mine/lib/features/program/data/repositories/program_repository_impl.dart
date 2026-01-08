import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';

import '../../../road/domain/entities/package_data_response_entity.dart';
import '../../domain/entities/program_setting_entity.dart';
import '../../domain/repositories/program_repository.dart';
import '../datasource/program_local_datasource.dart';
import '../datasource/program_remote_datasource.dart';
import '../models/program_setting_model.dart';

@LazySingleton(as: ProgramRepository)
class ProgramRepositoryImpl
    extends
        BaseOfflineSyncRepository<
          List<ProgramSetting>,
          List<ProgramSettingModel>
        >
    implements ProgramRepository {
  final ProgramLocalDataSource _localDataSource;
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
}
