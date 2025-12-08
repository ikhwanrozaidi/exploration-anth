import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../shared/models/api_response.dart';
import '../models/warning_category_with_reasons_model.dart';

part 'warning_categories_api_service.g.dart';

@injectable
@RestApi()
abstract class WarningCategoriesApiService {
  @factoryMethod
  factory WarningCategoriesApiService(Dio dio) =
      _WarningCategoriesApiService;

  @GET('/companies/{companyUID}/warnings/categories')
  Future<ApiResponse<List<WarningCategoryWithReasonsModel>>> getCategories({
    @Path('companyUID') required String companyUID,
    @Query('limit') int? limit = 0, // 0 = all items
    @Query('warningType') String? warningType,
    @Query('workScopeUID') String? workScopeUID,
  });
}
