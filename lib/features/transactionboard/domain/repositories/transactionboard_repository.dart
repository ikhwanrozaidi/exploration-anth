import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../dashboard/domain/entities/onhold_balance.dart';
import '../../../dashboard/domain/entities/onhold_transaction.dart';
import '../../../dashboard/domain/entities/user_detail.dart';
import '../entities/request_transaction.dart';

abstract class TransactionBoardRepository {
  // Reuse existing APIs from dashboard
  Future<Either<Failure, UserDetail>> getUserDetail();
  Future<Either<Failure, OnholdBalance>> getOnholdBalance();
  
  // Transaction board specific APIs
  Future<Either<Failure, List<OnholdTransaction>>> getOnholdTransactions({bool onhold = true, int page = 1, int size = 20});
  Future<Either<Failure, List<RequestTransaction>>> getRequestTransactions();
}