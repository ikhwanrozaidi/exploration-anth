import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../models/user_detail_model.dart';
import '../models/onhold_transaction_model.dart';
import '../models/onhold_balance_model.dart';

abstract class DashboardRemoteDataSource {
  Future<Either<Failure, UserDetailModel>> getUserDetail();
  Future<Either<Failure, List<OnholdTransactionModel>>> getOnholdTransactions();
  Future<Either<Failure, OnholdBalanceModel>> getOnholdBalance();
}

@LazySingleton(as: DashboardRemoteDataSource)
class DashboardRemoteDataSourceImpl implements DashboardRemoteDataSource {
  final Dio _dio;
  final NetworkInfo _networkInfo;

  DashboardRemoteDataSourceImpl(this._dio, this._networkInfo);

  @override
  Future<Either<Failure, UserDetailModel>> getUserDetail() async {
    if (!await _networkInfo.isConnected) {
      return Left(NetworkFailure('No internet connection'));
    }

    try {
      final response = await _dio.get('/client/user-detail');

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['status'] == 200 && data['data'] != null) {
          return Right(UserDetailModel.fromJson(data['data']));
        } else {
          return Left(ServerFailure(data['message'] ?? 'Unknown error'));
        }
      } else {
        return Left(ServerFailure('Server error: ${response.statusCode}'));
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
      final response = await _dio.get('/client/onhold-transaction');

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['status'] == 200 && data['data'] != null) {
          final List<dynamic> transactionList = data['data'];
          final transactions = transactionList
              .map((json) => OnholdTransactionModel.fromJson(json))
              .toList();
          return Right(transactions);
        } else {
          return Left(ServerFailure(data['message'] ?? 'Unknown error'));
        }
      } else {
        return Left(ServerFailure('Server error: ${response.statusCode}'));
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
      final response = await _dio.get('/client/onhold-transaction-balance');

      if (response.statusCode == 200) {
        final data = response.data;
        if (data['status'] == 200 && data['data'] != null) {
          return Right(OnholdBalanceModel.fromJson(data['data']));
        } else {
          return Left(ServerFailure(data['message'] ?? 'Unknown error'));
        }
      } else {
        return Left(ServerFailure('Server error: ${response.statusCode}'));
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
        return 'Bad response: ${e.response?.statusCode}';
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.connectionError:
        return 'Connection error';
      default:
        return 'Network error: ${e.message}';
    }
  }
}