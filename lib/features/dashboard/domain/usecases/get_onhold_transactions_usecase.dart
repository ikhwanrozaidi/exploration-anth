import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../entities/onhold_transaction.dart';
import '../repositories/dashboard_repository.dart';

@injectable
class GetOnholdTransactionsUseCase {
  final DashboardRepository repository;

  GetOnholdTransactionsUseCase(this.repository);

  Future<Either<Failure, List<OnholdTransaction>>> call() async {
    return await repository.getOnholdTransactions();
  }
}