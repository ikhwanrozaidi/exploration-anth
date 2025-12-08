import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../dashboard/data/models/user_detail_model.dart';
import '../../../dashboard/data/models/onhold_transaction_model.dart';
import '../../../dashboard/data/models/onhold_balance_model.dart';
import '../models/request_transaction_model.dart';

abstract class TransactionBoardLocalDataSource {
  Future<Either<Failure, void>> cacheUserDetail(UserDetailModel userDetail);
  Future<Either<Failure, UserDetailModel?>> getCachedUserDetail();
  
  Future<Either<Failure, void>> cacheOnholdTransactions(List<OnholdTransactionModel> transactions, {bool onhold = true});
  Future<Either<Failure, List<OnholdTransactionModel>>> getCachedOnholdTransactions({bool onhold = true});
  
  Future<Either<Failure, void>> cacheOnholdBalance(OnholdBalanceModel balance);
  Future<Either<Failure, OnholdBalanceModel?>> getCachedOnholdBalance();
  
  Future<Either<Failure, void>> cacheRequestTransactions(List<RequestTransactionModel> transactions);
  Future<Either<Failure, List<RequestTransactionModel>>> getCachedRequestTransactions();
  
  Future<Either<Failure, void>> clearTransactionBoardCache();
}

@LazySingleton(as: TransactionBoardLocalDataSource)
class TransactionBoardLocalDataSourceImpl implements TransactionBoardLocalDataSource {

  TransactionBoardLocalDataSourceImpl();

  @override
  Future<Either<Failure, void>> cacheUserDetail(UserDetailModel userDetail) async {
    try {
      // TODO: Implement local storage for user detail
      // For now, storing in memory or you can add to your database schema
      print('📱 Using local data: Caching user detail locally for transaction board');
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to cache user detail: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserDetailModel?>> getCachedUserDetail() async {
    try {
      // TODO: Implement retrieval from local storage
      print('📱 Using local data: Getting cached user detail for transaction board');
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to get cached user detail: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> cacheOnholdTransactions(
    List<OnholdTransactionModel> transactions, {
    bool onhold = true,
  }) async {
    try {
      // TODO: Implement local storage for transactions with onhold parameter
      print('📱 Using local data: Caching ${transactions.length} onhold transactions (onhold=$onhold) locally');
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to cache onhold transactions: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<OnholdTransactionModel>>> getCachedOnholdTransactions({
    bool onhold = true,
  }) async {
    try {
      // TODO: Implement retrieval from local storage with onhold parameter
      print('📱 Using local data: Getting cached onhold transactions (onhold=$onhold)');
      return const Right([]);
    } catch (e) {
      return Left(CacheFailure('Failed to get cached onhold transactions: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> cacheOnholdBalance(OnholdBalanceModel balance) async {
    try {
      // TODO: Implement local storage for balance
      print('📱 Using local data: Caching onhold balance locally');
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to cache onhold balance: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, OnholdBalanceModel?>> getCachedOnholdBalance() async {
    try {
      // TODO: Implement retrieval from local storage
      print('📱 Using local data: Getting cached onhold balance');
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to get cached onhold balance: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> cacheRequestTransactions(List<RequestTransactionModel> transactions) async {
    try {
      // TODO: Implement local storage for request transactions
      print('📱 Using local data: Caching ${transactions.length} request transactions locally');
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to cache request transactions: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<RequestTransactionModel>>> getCachedRequestTransactions() async {
    try {
      // TODO: Implement retrieval from local storage
      print('📱 Using local data: Getting cached request transactions');
      return const Right([]);
    } catch (e) {
      return Left(CacheFailure('Failed to get cached request transactions: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> clearTransactionBoardCache() async {
    try {
      // TODO: Implement cache clearing
      print('📱 Using local data: Clearing transaction board cache');
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear transaction board cache: ${e.toString()}'));
    }
  }
}