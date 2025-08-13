import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/user_detail.dart';
import '../../domain/entities/onhold_transaction.dart';
import '../../domain/entities/onhold_balance.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_datasource.dart';
import '../datasources/dashboard_local_datasource.dart';

@LazySingleton(as: DashboardRepository)
class DashboardRepositoryImpl implements DashboardRepository {
  final DashboardRemoteDataSource _remoteDataSource;
  final DashboardLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  DashboardRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, UserDetail>> getUserDetail() async {
    if (await _networkInfo.isConnected) {
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
    } else {
      // No internet, use local data
      final localResult = await _localDataSource.getCachedUserDetail();
      return localResult.fold(
        (failure) => Left(NetworkFailure('No internet connection and no cached data')),
        (cachedData) => cachedData != null 
            ? Right(cachedData.toEntity())
            : Left(NetworkFailure('No internet connection and no cached data')),
      );
    }
  }

  @override
  Future<Either<Failure, List<OnholdTransaction>>> getOnholdTransactions() async {
    if (await _networkInfo.isConnected) {
      final result = await _remoteDataSource.getOnholdTransactions();
      return result.fold(
        (failure) async {
          // If remote fails, try local data
          final localResult = await _localDataSource.getCachedOnholdTransactions();
          return localResult.fold(
            (localFailure) => Left(failure), // Return original remote failure
            (cachedData) => Right(cachedData.map((model) => model.toEntity()).toList()),
          );
        },
        (transactions) async {
          // Cache the successful result
          await _localDataSource.cacheOnholdTransactions(transactions);
          return Right(transactions.map((model) => model.toEntity()).toList());
        },
      );
    } else {
      // No internet, use local data
      final localResult = await _localDataSource.getCachedOnholdTransactions();
      return localResult.fold(
        (failure) => Left(NetworkFailure('No internet connection and no cached data')),
        (cachedData) => Right(cachedData.map((model) => model.toEntity()).toList()),
      );
    }
  }

  @override
  Future<Either<Failure, OnholdBalance>> getOnholdBalance() async {
    if (await _networkInfo.isConnected) {
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
    } else {
      // No internet, use local data
      final localResult = await _localDataSource.getCachedOnholdBalance();
      return localResult.fold(
        (failure) => Left(NetworkFailure('No internet connection and no cached data')),
        (cachedData) => cachedData != null 
            ? Right(cachedData.toEntity())
            : Left(NetworkFailure('No internet connection and no cached data')),
      );
    }
  }
}