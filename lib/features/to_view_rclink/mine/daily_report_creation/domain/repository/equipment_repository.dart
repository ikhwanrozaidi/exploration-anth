import 'package:dartz/dartz.dart';
import 'package:rclink_app/features/daily_report_creation/domain/entities/scope_of_work/work_equipment.dart';
import '../../../../core/errors/failures.dart';

abstract class EquipmentRepository {
  Future<Either<Failure, List<WorkEquipment>>> getEquipments({
    bool forceRefresh = false,
    required String companyUID,
    required String workScopeUID,
  });

  Future<Either<Failure, void>> clearEquipmentCache();
}
