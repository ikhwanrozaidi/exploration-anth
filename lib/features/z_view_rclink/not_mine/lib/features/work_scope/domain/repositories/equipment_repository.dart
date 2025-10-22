import 'package:dartz/dartz.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_equipment.dart';
import '../../../../core/errors/failures.dart';

abstract class EquipmentRepository {
  Future<Either<Failure, List<WorkEquipment>>> getEquipments({
    bool forceRefresh = false,
    required String companyUID,
    required String workScopeUID,
  });

  Future<Either<Failure, void>> clearEquipmentCache();
}
