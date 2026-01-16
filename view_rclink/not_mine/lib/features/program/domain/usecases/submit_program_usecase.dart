import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/program_create/submit_program_request_model.dart';
import '../entities/program_entity.dart';
import '../repositories/program_repository.dart';

@lazySingleton
class SubmitProgramUseCase implements UseCase<Program, SubmitProgramParams> {
  final ProgramRepository repository;

  SubmitProgramUseCase(this.repository);

  @override
  Future<Either<Failure, Program>> call(SubmitProgramParams params) async {
    return await repository.submitProgram(
      companyUID: params.companyUID,
      requestModel: params.requestModel,
    );
  }
}

class SubmitProgramParams {
  final String companyUID;
  final SubmitProgramRequestModel requestModel;

  SubmitProgramParams({required this.companyUID, required this.requestModel});
}
