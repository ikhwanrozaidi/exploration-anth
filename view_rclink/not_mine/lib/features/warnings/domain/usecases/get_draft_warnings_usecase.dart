import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/warning.dart';
import '../repositories/warning_repository.dart';

@lazySingleton
class GetDraftWarningsUseCase implements UseCase<List<Warning>?, String> {
  final WarningRepository repository;

  GetDraftWarningsUseCase(this.repository);

  @override
  Future<Either<Failure, List<Warning>?>> call(String companyUID) async {
    return await repository.getDraftWarnings(companyUID);
  }
}
