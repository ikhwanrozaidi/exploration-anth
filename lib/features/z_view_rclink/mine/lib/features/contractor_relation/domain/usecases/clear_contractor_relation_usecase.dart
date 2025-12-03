import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/contractor_relation_repository.dart';

@injectable
class ClearContractorRelationCacheUseCase implements UseCaseNoParams<void> {
  final ContractorRelationRepository _repository;

  ClearContractorRelationCacheUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await _repository.clearCache();
  }
}
