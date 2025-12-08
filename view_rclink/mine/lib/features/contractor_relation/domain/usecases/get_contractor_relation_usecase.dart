import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/contractor_relation_entity.dart';
import '../repository/contractor_relation_repository.dart';

@injectable
class GetContractorRelationParams {
  final bool forceRefresh;
  final Duration? cacheTimeout;

  GetContractorRelationParams({
    this.forceRefresh = false,
    this.cacheTimeout = const Duration(hours: 1),
  });
}

@injectable
class GetContractorRelationUseCase
    implements UseCase<List<ContractorRelation>, GetContractorRelationParams> {
  final ContractorRelationRepository _repository;

  GetContractorRelationUseCase(this._repository);

  @override
  Future<Either<Failure, List<ContractorRelation>>> call(
    GetContractorRelationParams params,
  ) async {
    return _repository.getContractorRelation(
      forceRefresh: params.forceRefresh,
      cacheTimeout: params.cacheTimeout,
    );
  }
}
