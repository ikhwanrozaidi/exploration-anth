import 'package:dartz/dartz.dart';
import 'package:rclink_app/features/contractor_relation/domain/entities/contractor_relation_entity.dart';
import '../../../../core/constants/api_query_params.dart';
import '../../../../core/errors/failures.dart';

abstract class ContractorRelationRepository {
  Future<Either<Failure, List<ContractorRelation>>> getContractorRelation({
    ApiQueryParams? queryParams,

    String? companyUID,

    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });

  Future<Either<Failure, void>> clearCache();
}
