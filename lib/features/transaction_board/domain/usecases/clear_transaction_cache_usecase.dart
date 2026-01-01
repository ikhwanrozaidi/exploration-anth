import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/transaction_board_repository.dart';

@lazySingleton
class ClearTransactionCacheUseCase implements UseCaseNoParams<void> {
  final TransactionBoardRepository repository;

  ClearTransactionCacheUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await repository.clearCache();
  }
}
