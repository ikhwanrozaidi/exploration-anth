import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/program_entity.dart';

abstract class ProgramDetailRepository {
  Future<Either<Failure, Program>> getProgramDetail({
    required String companyUID,
    required String programUID,
    bool forceRefresh = false,
  });

  Future<Either<Failure, void>> clearCache();
}
