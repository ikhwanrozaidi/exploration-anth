import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/road_edit_entity.dart';
import '../repository/road_edit_repository.dart';

class GetRoadsForEditParams {
  final String districtName;
  final bool forceRefresh;

  GetRoadsForEditParams({
    required this.districtName,
    this.forceRefresh = false,
  });
}

@lazySingleton
class GetRoadsForEditUseCase
    implements UseCase<List<RoadEdit>, GetRoadsForEditParams> {
  final RoadEditRepository _repository;

  GetRoadsForEditUseCase(this._repository);

  @override
  Future<Either<Failure, List<RoadEdit>>> call(
    GetRoadsForEditParams params,
  ) async {
    return await _repository.getRoadsByDistrictName(
      districtName: params.districtName,
      forceRefresh: params.forceRefresh,
    );
  }
}
