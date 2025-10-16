import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../shared/models/api_response.dart';
import '../models/company_model.dart';

part 'company_api_service.g.dart';

@injectable
@RestApi()
abstract class CompanyApiService {
  @factoryMethod
  factory CompanyApiService(Dio dio) = _CompanyApiService;

  @GET('/companies/me')
  Future<ApiResponse<List<CompanyModel>>> getMyCompanies();

  @PUT('/companies/{uid}')
  Future<ApiResponse> updateCompanyField({
    @Path('uid') required String companyUid,
    @Body() required Map<String, dynamic> updateData,
  });
}
