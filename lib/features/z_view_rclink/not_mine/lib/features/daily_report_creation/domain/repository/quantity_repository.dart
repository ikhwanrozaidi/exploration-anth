import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/scope_of_work/work_quantity_type.dart';

abstract class QuantityRepository {
  Future<Either<Failure, List<WorkQuantityType>>> getQuantities({
    bool forceRefresh = false,
    required String companyUID,
    required String workScopeUID,
  });

  Future<Either<Failure, void>> clearQuantityCache();
}
