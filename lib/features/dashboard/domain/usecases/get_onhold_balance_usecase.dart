import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../entities/onhold_balance.dart';
import '../repositories/dashboard_repository.dart';

@injectable
class GetOnholdBalanceUseCase {
  final DashboardRepository repository;

  GetOnholdBalanceUseCase(this.repository);

  Future<Either<Failure, OnholdBalance>> call() async {
    return await repository.getOnholdBalance();
  }
}