import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/escrowpay_repository.dart';

@lazySingleton
class ClearEscrowpayCacheUseCase implements UseCaseNoParams {
  final EscrowpayRepository _repository;

  ClearEscrowpayCacheUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call() {
    return _repository.clearCache();
  }
}
