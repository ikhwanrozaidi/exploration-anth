import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/scope_of_work/work_quantity_type.dart';
import '../repository/quantity_repository.dart';

@injectable
class GetQuantityParams {
  final bool forceRefresh;
  final String companyUID;
  final String workScopeUID;

  GetQuantityParams({
    this.forceRefresh = false,
    required this.companyUID,
    required this.workScopeUID,
  });
}

@injectable
class GetQuantityUseCase
    implements UseCase<List<WorkQuantityType>, GetQuantityParams> {
  final QuantityRepository _repository;

  GetQuantityUseCase(this._repository);

  @override
  Future<Either<Failure, List<WorkQuantityType>>> call(
    GetQuantityParams params,
  ) async {
    return await _repository.getQuantities(
      forceRefresh: params.forceRefresh,
      companyUID: params.companyUID,
      workScopeUID: params.workScopeUID,
    );
  }
}
