import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/program_view/program_list_item_entity.dart';
import '../repositories/program_repository.dart';

@lazySingleton
class GetProgramListUseCase
    implements UseCase<List<ProgramListItem>, GetProgramListParams> {
  final ProgramRepository repository;

  GetProgramListUseCase(this.repository);

  @override
  Future<Either<Failure, List<ProgramListItem>>> call(
    GetProgramListParams params,
  ) async {
    return await repository.getProgramList(
      companyUID: params.companyUID,
      page: params.page,
      limit: params.limit,
      forceRefresh: params.forceRefresh,
    );
  }
}

class GetProgramListParams {
  final String companyUID;
  final int page;
  final int limit;
  final bool forceRefresh;

  GetProgramListParams({
    required this.companyUID,
    this.page = 1,
    this.limit = 0,
    this.forceRefresh = false,
  });
}
