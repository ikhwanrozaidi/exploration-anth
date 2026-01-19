import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../domain/entities/program_entity.dart';
import '../../domain/repositories/program_list_repository.dart';
import '../datasource/program_local_datasource.dart';
import '../datasource/program_remote_datasource.dart';
import '../models/program_view/program_model.dart';

@LazySingleton(as: ProgramListRepository)
class ProgramListRepositoryImpl
    extends BaseOfflineSyncRepository<List<Program>, List<ProgramModel>>
    implements ProgramListRepository {
  final ProgramLocalDataSource _localDataSource;
  final ProgramRemoteDataSource _remoteDataSource;

  ProgramListRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<Either<Failure, List<Program>>> getPrograms({
    required String companyUID,
    int page = 1,
    int limit = 10,
    bool forceRefresh = false,
  }) async {
    return getOfflineFirst(
      forceRefresh: forceRefresh,
      getLocal: () async {
        final result = await _localDataSource.getPrograms();
        return result.fold(
          (failure) => null,
          (programs) =>
              programs.map((e) => ProgramModelX.fromEntity(e)).toList(),
        );
      },
      getRemote: () async {
        final result = await _remoteDataSource.getPrograms(
          companyUID: companyUID,
          page: page,
          limit: limit,
        );
        return result.fold(
          (failure) => Left(failure),
          (programs) =>
              Right(programs.map((e) => ProgramModelX.fromEntity(e)).toList()),
        );
      },
      saveLocal: (models, {bool markForSync = false}) async {
        final entities = models.map((m) => m.toEntity()).toList();
        await _localDataSource.savePrograms(entities);
      },
      toEntity: (models) => models.map((m) => m.toEntity()).toList(),
      cacheTimeout: const Duration(minutes: 30),
    );
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    return _localDataSource.clearCache();
  }
}
