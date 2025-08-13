import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user_detail.dart';
import '../entities/onhold_transaction.dart';
import '../entities/onhold_balance.dart';

abstract class DashboardRepository {
  Future<Either<Failure, UserDetail>> getUserDetail();
  Future<Either<Failure, List<OnholdTransaction>>> getOnholdTransactions();
  Future<Either<Failure, OnholdBalance>> getOnholdBalance();
}