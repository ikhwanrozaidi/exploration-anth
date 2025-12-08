import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../dashboard/data/models/user_detail_model.dart';
import '../../../dashboard/data/models/onhold_transaction_model.dart';
import '../../../dashboard/data/models/onhold_balance_model.dart';
import '../models/request_transaction_model.dart';
import 'transactionboard_api_service.dart';

abstract class TransactionBoardRemoteDataSource {
  Future<Either<Failure, UserDetailModel>> getUserDetail();
  Future<Either<Failure, OnholdBalanceModel>> getOnholdBalance();
  Future<Either<Failure, List<OnholdTransactionModel>>> getOnholdTransactions({bool onhold = true, int page = 1, int size = 20});
  Future<Either<Failure, List<RequestTransactionModel>>> getRequestTransactions();
}

@LazySingleton(as: TransactionBoardRemoteDataSource)
class TransactionBoardRemoteDataSourceImpl implements TransactionBoardRemoteDataSource {
  final TransactionBoardApiService _apiService;

  TransactionBoardRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, UserDetailModel>> getUserDetail() async {
    try {
      final response = await _apiService.getUserDetail();

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Failed to get user detail: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, OnholdBalanceModel>> getOnholdBalance() async {
    try {
      final response = await _apiService.getOnholdBalance();

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Failed to get onhold balance: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<OnholdTransactionModel>>> getOnholdTransactions({
    bool onhold = true,
    int page = 1,
    int size = 20,
  }) async {
    try {
      final response = await _apiService.getOnholdTransactions(
        onhold: onhold.toString(),
        page: page.toString(),
        size: size.toString(),
      );

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Failed to get onhold transactions: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<RequestTransactionModel>>> getRequestTransactions() async {
    try {
      final response = await _apiService.getRequestTransactions();

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Failed to get request transactions: ${e.toString()}'));
    }
  }
}