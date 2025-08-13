import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/database/app_database.dart';
import '../../../../core/errors/failures.dart';
import '../models/user_detail_model.dart';
import '../models/onhold_transaction_model.dart';
import '../models/onhold_balance_model.dart';

abstract class DashboardLocalDataSource {
  Future<Either<Failure, void>> cacheUserDetail(UserDetailModel userDetail);
  Future<Either<Failure, UserDetailModel?>> getCachedUserDetail();
  
  Future<Either<Failure, void>> cacheOnholdTransactions(List<OnholdTransactionModel> transactions);
  Future<Either<Failure, List<OnholdTransactionModel>>> getCachedOnholdTransactions();
  
  Future<Either<Failure, void>> cacheOnholdBalance(OnholdBalanceModel balance);
  Future<Either<Failure, OnholdBalanceModel?>> getCachedOnholdBalance();
  
  Future<Either<Failure, void>> clearDashboardCache();
}

@LazySingleton(as: DashboardLocalDataSource)
class DashboardLocalDataSourceImpl implements DashboardLocalDataSource {
  final DatabaseService _databaseService;

  DashboardLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<Either<Failure, void>> cacheUserDetail(UserDetailModel userDetail) async {
    try {
      // TODO: Implement local storage for user detail
      // For now, storing in memory or you can add to your database schema
      print('📱 Using local data: Caching user detail locally');
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to cache user detail: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, UserDetailModel?>> getCachedUserDetail() async {
    try {
      // TODO: Implement retrieval from local storage
      print('📱 Using local data: Getting cached user detail');
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to get cached user detail: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> cacheOnholdTransactions(List<OnholdTransactionModel> transactions) async {
    try {
      // TODO: Implement local storage for transactions
      print('📱 Using local data: Caching ${transactions.length} onhold transactions locally');
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to cache onhold transactions: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<OnholdTransactionModel>>> getCachedOnholdTransactions() async {
    try {
      // TODO: Implement retrieval from local storage
      print('📱 Using local data: Getting cached onhold transactions');
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
  Future<Either<Failure, void>> clearDashboardCache() async {
    try {
      // TODO: Implement cache clearing
      print('📱 Using local data: Clearing dashboard cache');
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear dashboard cache: ${e.toString()}'));
    }
  }
}