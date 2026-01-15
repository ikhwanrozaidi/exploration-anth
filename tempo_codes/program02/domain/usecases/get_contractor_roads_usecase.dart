import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../road/domain/entities/package_data_response_entity.dart';
import '../repositories/program_repository.dart';

class GetContractorRoadsParams {
  final String contractorRelationUID;

  const GetContractorRoadsParams({required this.contractorRelationUID});
}

@lazySingleton
class GetContractorRoadsUseCase
    implements UseCase<PackageDataResponse, GetContractorRoadsParams> {
  final ProgramRepository _repository;

  GetContractorRoadsUseCase(this._repository);

  @override
  Future<Either<Failure, PackageDataResponse>> call(
    GetContractorRoadsParams params,
  ) async {
    return await _repository.getContractorRoads(
      contractorRelationUID: params.contractorRelationUID,
    );
  }
}
