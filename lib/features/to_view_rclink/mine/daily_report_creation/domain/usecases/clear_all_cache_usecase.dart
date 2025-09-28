import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/daily_report_creation/domain/entities/province/province_entity.dart';
import 'package:rclink_app/features/daily_report_creation/domain/repository/province_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/district_repository.dart';
import '../repository/road_repository.dart';
import '../repository/workscopes_repository.dart';
import '../repository/quantity_repository.dart';
import '../repository/equipment_repository.dart';

@injectable
class ClearAllCacheUseCase implements UseCaseNoParams<void> {
  final WorkScopesRepository _workScopesRepository;
  final ProvinceRepository _statesRepository;
  final DistrictRepository _districtsRepository;
  final RoadRepository _roadsRepository;
  final QuantityRepository _quantityRepository;
  final EquipmentRepository _equipmentRepository;

  ClearAllCacheUseCase(
    this._workScopesRepository,
    this._statesRepository,
    this._districtsRepository,
    this._roadsRepository,
    this._quantityRepository,
    this._equipmentRepository,
  );

  @override
  Future<Either<Failure, void>> call() async {
    try {
      await Future.wait([
        _clearRepositoryCache(_workScopesRepository.clearCache()),
        _clearRepositoryCache(_statesRepository.clearProvinceCache()),
        _clearRepositoryCache(_districtsRepository.clearDistrictCache()),
        _clearRepositoryCache(_roadsRepository.clearRoadCache()),
        _clearRepositoryCache(_quantityRepository.clearQuantityCache()),
        _clearRepositoryCache(_equipmentRepository.clearEquipmentCache()),
      ]);

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to clear all caches: ${e.toString()}'));
    }
  }

  Future<void> _clearRepositoryCache(
    Future<Either<Failure, void>> clearOperation,
  ) async {
    final result = await clearOperation;
    result.fold((failure) => throw Exception(failure.message), (_) => {});
  }
}
