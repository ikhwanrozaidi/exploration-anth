import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/program_view/program_detail_entity.dart' show ProgramDetail;
import '../repositories/program_repository.dart';

@lazySingleton
class GetProgramDetailUseCase
    implements UseCase<ProgramDetail, GetProgramDetailParams> {
  final ProgramRepository repository;

  GetProgramDetailUseCase(this.repository);

  @override
  Future<Either<Failure, ProgramDetail>> call(
    GetProgramDetailParams params,
  ) async {
    return await repository.getProgramDetail(
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
