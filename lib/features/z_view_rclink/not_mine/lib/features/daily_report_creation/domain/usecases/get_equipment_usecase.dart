import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/scope_of_work/work_equipment.dart';
import '../repository/equipment_repository.dart';

@injectable
class GetEquipmentParams {
  final bool forceRefresh;
  final String companyUID;
  final String workScopeUID;

  GetEquipmentParams({
    this.forceRefresh = false,
    required this.companyUID,
    required this.workScopeUID,
  });
}

@injectable
class GetEquipmentUseCase
    implements UseCase<List<WorkEquipment>, GetEquipmentParams> {
  final EquipmentRepository _repository;

  GetEquipmentUseCase(this._repository);

  @override
  Future<Either<Failure, List<WorkEquipment>>> call(
    GetEquipmentParams params,
  ) async {
    return await _repository.getEquipments(
      forceRefresh: params.forceRefresh,
      companyUID: params.companyUID,
      workScopeUID: params.workScopeUID,
    );
  }
}
