import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/program/data/models/program_create/create_program_response_model.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';

import '../../../road/domain/entities/package_data_response_entity.dart';
import '../../domain/entities/program_entity.dart';
import '../../domain/entities/program_setting_entity.dart';
import '../../domain/entities/program_view/program_detail_entity.dart';
import '../../domain/entities/program_view/program_list_item_entity.dart';
import '../../domain/repositories/program_repository.dart';
import '../datasource/program_local_datasource.dart';
import '../datasource/program_remote_datasource.dart';
import '../models/program_setting_model.dart';
import '../models/submit_program_request_model.dart';

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
    try {
      await _localDataSource.clearCache();
      print('✅ Cleared all program caches');
      return const Right(null);
    } catch (e) {
      print('❌ Error clearing cache: $e');
      return Left(CacheFailure('Failed to clear cache: $e'));
    }
  }

  @override
  Future<Either<Failure, Program>> submitProgram({
    required String companyUID,
    required SubmitProgramRequestModel requestModel,
  }) async {
    print('📤 Repository: Submitting program...');

    // Call remote datasource (returns Either)
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

  @override
  Future<Either<Failure, List<ProgramListItem>>> getProgramList({
    required String companyUID,
    int page = 1,
    int limit = 0,
    bool forceRefresh = false,
  }) async {
    try {
      // Check local cache first
      if (!forceRefresh) {
        final localResult = await _localDataSource.getCachedProgramList(
          companyUID,
        );

        final hasLocalData = localResult.fold(
          (failure) => false,
          (programs) => programs.isNotEmpty,
        );

        if (hasLocalData) {
          print('✅ Returning cached program list');
          return localResult;
        }
      }

      // Fetch from remote
      print('🌐 Fetching program list from API...');
      final remoteResult = await _remoteDataSource.fetchProgramList(
        companyUID: companyUID,
        page: page,
        limit: limit,
      );

      return await remoteResult.fold(
        (failure) async {
          // Fallback to local if available
          print('⚠️ Remote fetch failed, falling back to cache');
          return await _localDataSource.getCachedProgramList(companyUID);
        },
        (models) async {
          // Convert models to entities
          final entities = models.map((m) => m.toEntity()).toList();

          // Cache the data
          await _localDataSource.cacheProgramList(entities);

          print('✅ Program list cached successfully');
          return Right(entities);
        },
      );
    } catch (e) {
      print('❌ Error in getProgramList: $e');
      return Left(CacheFailure('Failed to get program list: $e'));
    }
  }

  @override
  Future<Either<Failure, ProgramDetail>> getProgramDetail({
    required String companyUID,
    required String programUID,
    bool forceRefresh = false,
  }) async {
    try {
      // Check local cache first
      if (!forceRefresh) {
        final localResult = await _localDataSource.getCachedProgramDetail(
          programUID,
        );

        final hasLocalData = localResult.fold(
          (failure) => false,
          (program) => true,
        );

        if (hasLocalData) {
          print('✅ Returning cached program detail');
          return localResult;
        }
      }

      // Fetch from remote
      print('🌐 Fetching program detail from API...');
      final remoteResult = await _remoteDataSource.fetchProgramDetail(
        companyUID: companyUID,
        programUID: programUID,
      );

      return await remoteResult.fold(
        (failure) async {
          // Fallback to local if available
          print('⚠️ Remote fetch failed, falling back to cache');
          return await _localDataSource.getCachedProgramDetail(programUID);
        },
        (model) async {
          // Convert model to entity
          final entity = model.toEntity();

          // Cache the data
          await _localDataSource.cacheProgramDetail(entity);

          print('✅ Program detail cached successfully');
          return Right(entity);
        },
      );
    } catch (e) {
      print('❌ Error in getProgramDetail: $e');
      return Left(CacheFailure('Failed to get program detail: $e'));
    }
  }
}
