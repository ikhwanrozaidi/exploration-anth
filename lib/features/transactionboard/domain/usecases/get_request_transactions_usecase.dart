import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../entities/request_transaction.dart';
import '../repositories/transactionboard_repository.dart';

@injectable
class GetRequestTransactionsUseCase {
  final TransactionBoardRepository repository;

  GetRequestTransactionsUseCase(this.repository);

  Future<Either<Failure, List<RequestTransaction>>> call() async {
    return await repository.getRequestTransactions();
  }
}