// import 'package:dartz/dartz.dart';
// import 'package:injectable/injectable.dart';

// import '../../../../core/errors/failures.dart';
// import '../../../../core/usecases/usecase.dart';
// import '../entities/program_draft_data_entity.dart';
// import '../repositories/program_draft_repository.dart';

// @lazySingleton
// class GetProgramDraftListUseCase
//     implements UseCase<List<ProgramDraftData>, GetProgramDraftListParams> {
//   final ProgramDraftRepository repository;

//   GetProgramDraftListUseCase(this.repository);

//   @override
//   Future<Either<Failure, List<ProgramDraftData>>> call(
//     GetProgramDraftListParams params,
//   ) async {
//     return await repository.getDraftList(companyUID: params.companyUID);
//   }
// }

// class GetProgramDraftListParams {
//   final String companyUID;

//   GetProgramDraftListParams({required this.companyUID});
// }
