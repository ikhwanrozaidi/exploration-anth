import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/models/api_response.dart';
import '../models/contractor_relation_model.dart';

part 'contractor_relation_api_service.g.dart';

@injectable
@RestApi()
abstract class ContractorRelationApiService {
  @factoryMethod
  factory ContractorRelationApiService(Dio dio) = _ContractorRelationApiService;

  @GET('/companies/{companyUID}/contractors/related')
  Future<ApiResponse<List<ContractorRelationModel>>> getContractorsRelated({
    @Queries() Map<String, dynamic>? baseParams,

    @Path('companyUID') required String companyUID,
  });
}
