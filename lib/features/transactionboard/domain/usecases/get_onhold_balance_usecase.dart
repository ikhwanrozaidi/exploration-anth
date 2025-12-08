import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../dashboard/domain/entities/onhold_balance.dart';
import '../repositories/transactionboard_repository.dart';

@injectable
class GetOnholdBalanceTransactionBoardUseCase {
  final TransactionBoardRepository repository;

  GetOnholdBalanceTransactionBoardUseCase(this.repository);

  Future<Either<Failure, OnholdBalance>> call() async {
    return await repository.getOnholdBalance();
  }
}