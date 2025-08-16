import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import '../../../../shared/models/api_response.dart';
import '../models/user_detail_model.dart';
import '../models/onhold_transaction_model.dart';
import '../models/onhold_balance_model.dart';

part 'dashboard_api_service.g.dart';

@injectable
@RestApi()
abstract class DashboardApiService {
  @factoryMethod
  factory DashboardApiService(Dio dio) = _DashboardApiService;

  @GET('/client/user-detail')
  Future<ApiResponse<UserDetailModel>> getUserDetail();

  @GET('/client/onhold-transaction')
  Future<ApiResponse<List<OnholdTransactionModel>>> getOnholdTransactions();

  @GET('/client/onhold-balance')
  Future<ApiResponse<OnholdBalanceModel>> getOnholdBalance();
}