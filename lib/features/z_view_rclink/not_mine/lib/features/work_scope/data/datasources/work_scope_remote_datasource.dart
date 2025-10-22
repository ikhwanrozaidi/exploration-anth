import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../models/work_scope_model.dart';
import '../models/work_equipment_model.dart';
import '../models/work_quantity_type_model.dart';
import 'work_scope_api_service.dart';

abstract class WorkScopeRemoteDataSource {
  Future<Either<Failure, List<WorkScopeModel>>> getWorkScopes(
    String companyUID,
  );

  Future<Either<Failure, List<WorkQuantityTypeModel>>> getQuantities(
    String companyUID,
    String workScopeUID,
  );

  Future<Either<Failure, List<WorkEquipmentModel>>> getEquipments(
    String companyUID,
    String workScopeUID,
  );
}

@LazySingleton(as: WorkScopeRemoteDataSource)
class WorkScopeRemoteDataSourceImpl implements WorkScopeRemoteDataSource {
  final WorkScopeApiService _apiService;

  WorkScopeRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<WorkScopeModel>>> getWorkScopes(
    String companyUID,
  ) async {
    try {
      final response = await _apiService.getWorkScopes(
        companyUID: companyUID,
        limit: 0,
      );

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<WorkQuantityTypeModel>>> getQuantities(
    String companyUID,
    String workScopeUID,
  ) async {
    try {
      final response = await _apiService.getQuantityTypes(
        companyUID: companyUID,
        workScopeUID: workScopeUID,
      );

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<WorkEquipmentModel>>> getEquipments(
    String companyUID,
    String workScopeUID,
  ) async {
    try {
      final response = await _apiService.getEquipments(
        companyUID: companyUID,
        workScopeUID: workScopeUID,
      );

      if (response.isSuccess && response.data != null) {
        final equipments = response.data!
            .map((junction) => junction.workEquipment)
            .toList();
        return Right(equipments);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
