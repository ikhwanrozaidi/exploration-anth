import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/mailbox_entity.dart';
import '../../domain/entities/marketing_entity.dart';
import '../../domain/repositories/inbox_repository.dart';
import '../datasources/inbox_remote_datasource.dart';
import '../datasources/inbox_local_datasource.dart';

@LazySingleton(as: InboxRepository)
class InboxRepositoryImpl implements InboxRepository {
  final InboxRemoteDataSource _remoteDataSource;
  final InboxLocalDataSource _localDataSource;

  InboxRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

@override
  Future<Either<Failure, List<Marketing>>> getMarketing() async {
    final result = await _remoteDataSource.getMarketing();
    return result.fold(
      (failure) async {
        // If remote fails, try local data
        final localResult = await _localDataSource.getCachedMarketing();
        return localResult.fold(
          (localFailure) => Left(failure), // Return original remote failure
          (cachedData) => Right(cachedData.map((model) => model.toEntity()).toList()),
        );
      },
      (marketing) async {
        // Cache the successful result
        await _localDataSource.cacheMarketing(marketing);
        return Right(marketing.map((model) => model.toEntity()).toList());
      },
    );
  }

@override
  Future<Either<Failure, List<Mailbox>>> getMailbox() async {
    final result = await _remoteDataSource.getMailbox();
    return result.fold(
      (failure) async {
        // If remote fails, try local data
        final localResult = await _localDataSource.getCachedMailbox();
        return localResult.fold(
          (localFailure) => Left(failure), // Return original remote failure
          (cachedData) => Right(cachedData.map((model) => model.toEntity()).toList()),
        );
      },
      (mailbox) async {
        // Cache the successful result
        await _localDataSource.cacheMailbox(mailbox);
        return Right(mailbox.map((model) => model.toEntity()).toList());
      },
    );
  }
}