import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/warning.dart';
import '../repositories/warning_repository.dart';

@injectable
class GetWarningByUidUseCase
    implements UseCase<Warning, GetWarningByUidParams> {
  final WarningRepository _repository;

  GetWarningByUidUseCase(this._repository);

  @override
  Future<Either<Failure, Warning>> call(GetWarningByUidParams params) async {
    return await _repository.getWarningById(
      companyUID: params.companyUID,
      uid: params.uid,
      forceRefresh: params.forceRefresh,
    );
  }
}

class GetWarningByUidParams {
  final String companyUID;
  final String uid;
  final bool forceRefresh;

  GetWarningByUidParams({
    required this.companyUID,
    required this.uid,
    this.forceRefresh = false,
  });
}
