// lib/features/dashboard/data/datasources/dashboard_remote_datasource.dart
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
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
      
      if (response.statusCode == 200 && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(response.message ?? 'Unknown error'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(_handleDioError(e)));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, List<OnholdTransactionModel>>> getOnholdTransactions() async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure('No internet connection'));
    }

    try {
      final response = await _apiService.getOnholdTransactions();
      
      if (response.statusCode == 200 && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(response.message ?? 'Unknown error'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(_handleDioError(e)));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  @override
  Future<Either<Failure, OnholdBalanceModel>> getOnholdBalance() async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure('No internet connection'));
    }

    try {
      final response = await _apiService.getOnholdBalance();
      
      if (response.statusCode == 200 && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(response.message ?? 'Unknown error'));
      }
    } on DioException catch (e) {
      return Left(ServerFailure(_handleDioError(e)));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }

  String _handleDioError(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout';
      case DioExceptionType.sendTimeout:
        return 'Send timeout';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout';
      case DioExceptionType.badResponse:
        return 'Server error: ${e.response?.statusCode}';
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.connectionError:
        return 'Connection error';
      default:
        return 'Network error: ${e.message}';
    }
  }
}