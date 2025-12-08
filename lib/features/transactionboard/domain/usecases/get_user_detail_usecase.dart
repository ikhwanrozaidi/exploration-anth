import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../dashboard/domain/entities/user_detail.dart';
import '../repositories/transactionboard_repository.dart';

@injectable
class GetUserDetailTransactionBoardUseCase {
  final TransactionBoardRepository repository;

  GetUserDetailTransactionBoardUseCase(this.repository);

  Future<Either<Failure, UserDetail>> call() async {
    return await repository.getUserDetail();
  }
}