import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/program_entity.dart';
import '../repositories/program_list_repository.dart';

@lazySingleton
class GetProgramsUseCase implements UseCase<List<Program>, GetProgramsParams> {
  final ProgramListRepository _repository;

  GetProgramsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Program>>> call(GetProgramsParams params) async {
    return _repository.getPrograms(
      companyUID: params.companyUID,
      page: params.page,
      limit: params.limit,
      forceRefresh: params.forceRefresh,
    );
  }
}

class GetProgramsParams {
  final String companyUID;
  final int page;
  final int limit;
  final bool forceRefresh;

  GetProgramsParams({
    required this.companyUID,
    this.page = 1,
    this.limit = 10,
    this.forceRefresh = false,
  });
}
