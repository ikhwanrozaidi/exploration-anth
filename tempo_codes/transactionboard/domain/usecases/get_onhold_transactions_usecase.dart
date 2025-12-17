import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../dashboard/domain/entities/onhold_transaction.dart';
import '../repositories/transactionboard_repository.dart';

@injectable
class GetOnholdTransactionsWithParamsUseCase {
  final TransactionBoardRepository repository;

  GetOnholdTransactionsWithParamsUseCase(this.repository);

  Future<Either<Failure, List<OnholdTransaction>>> call({
    bool onhold = true,
    int page = 1,
    int size = 20,
  }) async {
    return await repository.getOnholdTransactions(
      onhold: onhold,
      page: page,
      size: size,
    );
  }
}