import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/program_entity.dart';

abstract class ProgramListRepository {
  Future<Either<Failure, List<Program>>> getPrograms({
    required String companyUID,
    int page = 1,
    int limit = 10,
    bool forceRefresh = false,
  });

  Future<Either<Failure, void>> clearCache();
}
