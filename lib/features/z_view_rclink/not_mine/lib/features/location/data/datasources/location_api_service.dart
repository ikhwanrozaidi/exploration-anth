import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../../../to_view_rclink/not_mine/shared/models/api_response.dart';
import '../models/district_model.dart';
import '../models/province_model.dart';
import '../models/road_model.dart';

part 'location_api_service.g.dart';

@injectable
@RestApi()
abstract class LocationApiService {
  @factoryMethod
  factory LocationApiService(Dio dio) = _LocationApiService;

  @GET('/states')
  Future<ApiResponse<List<ProvinceModel>>> getStates({
    @Queries() Map<String, dynamic>? baseParams,

    @Query('countryID') int? countryID = 1,
  });

  @GET('/districts')
  Future<ApiResponse<List<DistrictModel>>> getDistricts({
    @Queries() Map<String, dynamic>? baseParams,

    @Query('stateID') int? stateID,
  });

  @GET('/roads')
  Future<ApiResponse<List<RoadModel>>> getRoads({
    @Queries() Map<String, dynamic>? baseParams,

    @Query('districtID') int? districtID,
    @Query('mainCategoryID') int? mainCategoryID,
    @Query('secondaryCategoryID') int? secondaryCategoryID,
    @Query('sectionStartMin') double? sectionStartMin,
    @Query('sectionFinishMax') double? sectionFinishMax,
  });
}
