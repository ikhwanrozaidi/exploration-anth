import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/program_entity.dart';
import '../repositories/program_detail_repository.dart';

@lazySingleton
class GetProgramDetailUseCase
    implements UseCase<Program, GetProgramDetailParams> {
  final ProgramDetailRepository _repository;

  GetProgramDetailUseCase(this._repository);

  @override
  Future<Either<Failure, Program>> call(GetProgramDetailParams params) async {
    return _repository.getProgramDetail(
      companyUID: params.companyUID,
      programUID: params.programUID,
      forceRefresh: params.forceRefresh,
    );
  }
}

class GetProgramDetailParams {
  final String companyUID;
  final String programUID;
  final bool forceRefresh;

  GetProgramDetailParams({
    required this.companyUID,
    required this.programUID,
    this.forceRefresh = false,
  });
}
