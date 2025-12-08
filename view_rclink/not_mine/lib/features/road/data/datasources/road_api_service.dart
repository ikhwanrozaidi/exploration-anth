import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../shared/models/api_response.dart';
import '../models/district_model.dart';
import '../models/package_data_response_model.dart';
import '../models/province_model.dart';
import '../models/road_model.dart';

part 'road_api_service.g.dart';

@injectable
@RestApi()
abstract class RoadApiService {
  @factoryMethod
  factory RoadApiService(Dio dio) = _RoadApiService;

  // @GET('/states')
  // Future<ApiResponse<List<ProvinceModel>>> getStates({
  //   @Query('page') int? page = 1,
  //   @Query('limit') int? limit = 0,
  //   @Query('sortOrder') String? sortOrder = 'asc',
  //   @Query('sortBy') String? sortBy = 'name',
  //   @Query('countryID') int? countryID,
  //   @Query('search') String? search,
  // });

  // @GET('/districts')
  // Future<ApiResponse<List<DistrictModel>>> getDistricts({
  //   @Query('page') int? page = 1,
  //   @Query('limit') int? limit = 0, // 0 = all items
  //   @Query('sortOrder') String? sortOrder = 'asc',
  //   @Query('sortBy') String? sortBy = 'name',
  //   @Query('stateID') int? stateID, // Match API parameter name
  //   @Query('search') String? search,
  // });

  // @GET('/roads')
  // Future<ApiResponse<List<RoadModel>>> getRoads({
  //   @Query('page') int? page = 1,
  //   @Query('limit') int? limit = 0, // 0 = all items
  //   @Query('sortOrder') String? sortOrder = 'asc',
  //   @Query('sortBy') String? sortBy = 'name',
  //   @Query('districtID') int? districtID,
  //   @Query('mainCategoryID') int? mainCategoryID,
  //   @Query('secondaryCategoryID') int? secondaryCategoryID,
  //   @Query('search') String? search,
  //   @Query('sectionStartMin') double? sectionStartMin,
  //   @Query('sectionFinishMax') double? sectionFinishMax,
  // });

  //isSelf = true
  @GET('/companies/{companyUID}/roads')
  Future<ApiResponse<PackageDataResponseModel>> getCompanyRoads({
    @Path('companyUID') required String companyUID,
    @Query('expand') List<String>? expand,
  });

  //isSelf = false
  @GET(
    '/companies/{companyUID}/contractors/{contractRelationUID}/package-roads',
  )
  Future<ApiResponse<PackageDataResponseModel>> getPackageRoads({
    @Path('companyUID') required String companyUID,
    @Path('contractRelationUID') required String contractRelationUID,
  });
}
