import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/transaction_board_data.dart';

abstract class TransactionBoardRepository {
  Future<Either<Failure, TransactionBoardData>> getUserTransactions();
  Future<Either<Failure, void>> clearCache();
}
