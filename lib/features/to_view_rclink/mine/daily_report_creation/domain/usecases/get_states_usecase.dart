import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/daily_report_creation/domain/repository/province_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/province/province_entity.dart';

@injectable
class GetStatesParams {
  final bool forceRefresh;
  final int? page;
  final int? limit;
  final String? sortOrder;
  final String? sortBy;
  final int? countryID;
  final String? search;

  GetStatesParams({
    this.forceRefresh = false,
    this.page = 1,
    this.limit = 0,
    this.sortOrder = 'asc',
    this.sortBy = 'name',
    this.countryID,
    this.search,
  });
}

@injectable
class GetStatesUseCase implements UseCase<List<Province>, GetStatesParams> {
  final ProvinceRepository _repository;

  GetStatesUseCase(this._repository);

  @override
  Future<Either<Failure, List<Province>>> call(GetStatesParams params) async {
    print(
      '🔍 USECASE: GetStatesUseCase called with forceRefresh: ${params.forceRefresh}',
    );

    final result = await _repository.getStates(
      forceRefresh: params.forceRefresh,
      page: params.page,
      limit: params.limit,
      sortOrder: params.sortOrder,
      sortBy: params.sortBy,
      countryID: params.countryID,
      search: params.search,
    );

    result.fold(
      (failure) =>
          print('❌ USECASE: Repository returned failure: ${failure.message}'),
      (states) =>
          print('✅ USECASE: Repository returned ${states.length} states'),
    );

    return result;
  }
}
