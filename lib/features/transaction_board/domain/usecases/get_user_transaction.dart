import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/transaction_board_data.dart';
import '../repositories/transaction_board_repository.dart';

@lazySingleton
class GetUserTransactionsUseCase
    implements UseCaseNoParams<TransactionBoardData> {
  final TransactionBoardRepository repository;

  GetUserTransactionsUseCase(this.repository);

  @override
  Future<Either<Failure, TransactionBoardData>> call() async {
    return await repository.getUserTransactions();
  }
}
