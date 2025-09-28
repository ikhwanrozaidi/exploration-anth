import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/daily_report_creation/domain/repository/road_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/province/road_entity.dart';

@injectable
class GetRoadsParams {
  final bool forceRefresh;
  final int? districtID;
  final int? page;
  final int? limit;
  final String? sortOrder;
  final String? sortBy;
  final int? mainCategoryID;
  final int? secondaryCategoryID;
  final String? search;
  final double? sectionStartMin;
  final double? sectionFinishMax;

  GetRoadsParams({
    this.forceRefresh = false,
    this.districtID,
    this.page = 1,
    this.limit = 0,
    this.sortOrder = 'asc',
    this.sortBy = 'name',
    this.mainCategoryID,
    this.secondaryCategoryID,
    this.search,
    this.sectionStartMin,
    this.sectionFinishMax,
  });
}

@injectable
class GetRoadsUseCase implements UseCase<List<Road>, GetRoadsParams> {
  final RoadRepository _repository;

  GetRoadsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Road>>> call(GetRoadsParams params) async {
    return await _repository.getRoads(
      forceRefresh: params.forceRefresh,
      districtID: params.districtID,
      page: params.page,
      limit: params.limit,
      sortOrder: params.sortOrder,
      sortBy: params.sortBy,
      mainCategoryID: params.mainCategoryID,
      secondaryCategoryID: params.secondaryCategoryID,
      search: params.search,
      sectionStartMin: params.sectionStartMin,
      sectionFinishMax: params.sectionFinishMax,
    );
  }
}
