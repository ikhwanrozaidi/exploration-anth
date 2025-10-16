import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/daily_report_creation/domain/repository/district_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/province/district_entity.dart';

@injectable
class GetDistrictsParams {
  final bool forceRefresh;
  final int? stateID;
  final int? page;
  final int? limit;
  final String? sortOrder;
  final String? sortBy;
  final String? search;

  GetDistrictsParams({
    this.forceRefresh = false,
    this.stateID,
    this.page = 1,
    this.limit = 0,
    this.sortOrder = 'asc',
    this.sortBy = 'name',
    this.search,
  });
}

@injectable
class GetDistrictsUseCase
    implements UseCase<List<District>, GetDistrictsParams> {
  final DistrictRepository _repository;

  GetDistrictsUseCase(this._repository);

  @override
  Future<Either<Failure, List<District>>> call(
    GetDistrictsParams params,
  ) async {
    return await _repository.getDistricts(
      forceRefresh: params.forceRefresh,
      stateID: params.stateID,
      page: params.page,
      limit: params.limit,
      sortOrder: params.sortOrder,
      sortBy: params.sortBy,
      search: params.search,
    );
  }
}
