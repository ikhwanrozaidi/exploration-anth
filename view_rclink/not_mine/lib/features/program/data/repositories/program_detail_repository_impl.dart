import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/repositories/base_sync_repository.dart';
import '../../domain/entities/program_entity.dart';
import '../../domain/repositories/program_detail_repository.dart';
import '../datasource/program_local_datasource.dart';
import '../datasource/program_remote_datasource.dart';
import '../models/program_view/program_model.dart';

@LazySingleton(as: ProgramDetailRepository)
class ProgramDetailRepositoryImpl
    extends BaseOfflineSyncRepository<Program, ProgramModel>
    implements ProgramDetailRepository {
  final ProgramLocalDataSource _localDataSource;
  final ProgramRemoteDataSource _remoteDataSource;

  ProgramDetailRepositoryImpl(this._localDataSource, this._remoteDataSource);

  @override
  Future<Either<Failure, Program>> getProgramDetail({
    required String companyUID,
    required String programUID,
    bool forceRefresh = false,
  }) async {
    return getOfflineFirst(
      forceRefresh: forceRefresh,
      getLocal: () async {
        final result = await _localDataSource.getProgramByUid(programUID);
        return result.fold(
          (failure) => null,
          (program) =>
              program != null ? ProgramModelX.fromEntity(program) : null,
        );
      },
      getRemote: () async {
        final result = await _remoteDataSource.getProgramDetail(
          companyUID: companyUID,
          programUID: programUID,
        );
        return result.fold(
          (failure) => Left(failure),
          (program) => Right(ProgramModelX.fromEntity(program)),
        );
      },
      saveLocal: (model, {bool markForSync = false}) async {
        await _localDataSource.saveProgram(model.toEntity());
      },
      toEntity: (model) => model.toEntity(),
      cacheTimeout: const Duration(minutes: 30),
    );
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    return _localDataSource.clearCache();
  }
}
