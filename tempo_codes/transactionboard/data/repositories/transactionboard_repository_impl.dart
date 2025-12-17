import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../dashboard/domain/entities/user_detail.dart';
import '../../../dashboard/domain/entities/onhold_transaction.dart';
import '../../../dashboard/domain/entities/onhold_balance.dart';
import '../../domain/entities/request_transaction.dart';
import '../../domain/repositories/transactionboard_repository.dart';
import '../datasources/transactionboard_remote_datasource.dart';
import '../datasources/transactionboard_local_datasource.dart';

@LazySingleton(as: TransactionBoardRepository)
class TransactionBoardRepositoryImpl implements TransactionBoardRepository {
  final TransactionBoardRemoteDataSource _remoteDataSource;
  final TransactionBoardLocalDataSource _localDataSource;

  TransactionBoardRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
  );

  @override
  Future<Either<Failure, UserDetail>> getUserDetail() async {
    final result = await _remoteDataSource.getUserDetail();
    return result.fold(
      (failure) async {
        // If remote fails, try local data
        final localResult = await _localDataSource.getCachedUserDetail();
        return localResult.fold(
          (localFailure) => Left(failure), // Return original remote failure
          (cachedData) => cachedData != null 
              ? Right(cachedData.toEntity())
              : Left(failure),
        );
      },
      (userDetail) async {
        // Cache the successful result
        await _localDataSource.cacheUserDetail(userDetail);
        return Right(userDetail.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, OnholdBalance>> getOnholdBalance() async {
    final result = await _remoteDataSource.getOnholdBalance();
    return result.fold(
      (failure) async {
        // If remote fails, try local data
        final localResult = await _localDataSource.getCachedOnholdBalance();
        return localResult.fold(
          (localFailure) => Left(failure), // Return original remote failure
          (cachedData) => cachedData != null 
              ? Right(cachedData.toEntity())
              : Left(failure),
        );
      },
      (balance) async {
        // Cache the successful result
        await _localDataSource.cacheOnholdBalance(balance);
        return Right(balance.toEntity());
      },
    );
  }

  @override
  Future<Either<Failure, List<OnholdTransaction>>> getOnholdTransactions({
    bool onhold = true,
    int page = 1,
    int size = 20,
  }) async {
    final result = await _remoteDataSource.getOnholdTransactions(
      onhold: onhold,
      page: page,
      size: size,
    );
    return result.fold(
      (failure) async {
        // If remote fails, try local data
        final localResult = await _localDataSource.getCachedOnholdTransactions(onhold: onhold);
        return localResult.fold(
          (localFailure) => Left(failure), // Return original remote failure
          (cachedData) => Right(cachedData.map((model) => model.toEntity()).toList()),
        );
      },
      (transactions) async {
        // Cache the successful result
        await _localDataSource.cacheOnholdTransactions(transactions, onhold: onhold);
        return Right(transactions.map((model) => model.toEntity()).toList());
      },
    );
  }

  @override
  Future<Either<Failure, List<RequestTransaction>>> getRequestTransactions() async {
    final result = await _remoteDataSource.getRequestTransactions();
    return result.fold(
      (failure) async {
        // If remote fails, try local data
        final localResult = await _localDataSource.getCachedRequestTransactions();
        return localResult.fold(
          (localFailure) => Left(failure), // Return original remote failure
          (cachedData) => Right(cachedData.map((model) => model.toEntity()).toList()),
        );
      },
      (transactions) async {
        // Cache the successful result
        await _localDataSource.cacheRequestTransactions(transactions);
        return Right(transactions.map((model) => model.toEntity()).toList());
      },
    );
  }
}