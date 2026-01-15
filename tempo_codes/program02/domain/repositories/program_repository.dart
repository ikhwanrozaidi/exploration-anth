import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../road/domain/entities/package_data_response_entity.dart';
import '../entities/program_setting_entity.dart';

abstract class ProgramRepository {
  Future<Either<Failure, List<ProgramSetting>>> getProgramSettings({
    bool forceRefresh = false,
  });

  Future<Either<Failure, PackageDataResponse>> getContractorRoads({
    required String contractorRelationUID,
  });

  Future<Either<Failure, void>> clearCache();
}
