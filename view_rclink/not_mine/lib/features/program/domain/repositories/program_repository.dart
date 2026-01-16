import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../road/domain/entities/package_data_response_entity.dart';
import '../../data/models/submit_program_request_model.dart';
import '../entities/program_entity.dart';
import '../entities/program_setting_entity.dart';
import '../entities/program_view/program_detail_entity.dart';
import '../entities/program_view/program_list_item_entity.dart';

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

  // Program View
  Future<Either<Failure, List<ProgramListItem>>> getProgramList({
    required String companyUID,
    int page = 1,
    int limit = 0,
    bool forceRefresh = false,
  });

  // Program View
  Future<Either<Failure, ProgramDetail>> getProgramDetail({
    required String companyUID,
    required String programUID,
    bool forceRefresh = false,
  });
}
