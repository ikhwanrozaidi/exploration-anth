import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../models/user_detail_model.dart';
import '../models/onhold_transaction_model.dart';
import '../models/onhold_balance_model.dart';
import 'dashboard_api_service.dart';

abstract class DashboardRemoteDataSource {
  Future<Either<Failure, UserDetailModel>> getUserDetail();
  Future<Either<Failure, List<OnholdTransactionModel>>> getOnholdTransactions();
  Future<Either<Failure, OnholdBalanceModel>> getOnholdBalance();
}

@LazySingleton(as: DashboardRemoteDataSource)
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final DashboardApiService _apiService;
  final NetworkInfo _networkInfo;

  DashboardRemoteDataSourceImpl(this._apiService, this._networkInfo);

  @override
  Future<Either<Failure, UserDetailModel>> getUserDetail() async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure('No internet connection'));
    }

    try {
      final response = await _apiService.getUserDetail();

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(response.message, statusCode: response.statusCode));
      }
    } catch (e) {
      return Left(ServerFailure('Get user detail failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<OnholdTransactionModel>>> getOnholdTransactions() async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure('No internet connection'));
    }

    try {
      final response = await _apiService.getOnholdTransactions();

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(response.message, statusCode: response.statusCode));
      }
    } catch (e) {
      return Left(ServerFailure('Get onhold transactions failed: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, OnholdBalanceModel>> getOnholdBalance() async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure('No internet connection'));
    }

    try {
      final response = await _apiService.getOnholdBalance();

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(response.message, statusCode: response.statusCode));
      }
    } catch (e) {
      return Left(ServerFailure('Get onhold balance failed: ${e.toString()}'));
    }
  }
}