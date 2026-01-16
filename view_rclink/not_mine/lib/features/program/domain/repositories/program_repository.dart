import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../road/domain/entities/package_data_response_entity.dart';
import '../../data/models/program_create/submit_program_request_model.dart';
import '../entities/program_entity.dart';
import '../entities/program_settings/program_setting_entity.dart';

abstract class ProgramRepository {
  Future<Either<Failure, List<ProgramSetting>>> getProgramSettings({
    bool forceRefresh = false,
  });

  Future<Either<Failure, PackageDataResponse>> getContractorRoads({
    required String contractorRelationUID,
  });

  Future<Either<Failure, void>> clearCache();

  Future<Either<Failure, Program>> submitProgram({
    required String companyUID,
    required SubmitProgramRequestModel requestModel,
  });
}
