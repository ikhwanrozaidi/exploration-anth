import 'package:dio/dio.dart';
import 'package:gatepay_app/shared/models/api_response.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../models/create_order_request_model.dart';
import '../models/payment_order_model.dart';
import '../models/search_user_request_model.dart';
import '../models/search_user_response_model.dart';

part 'escrowpay_api_service.g.dart';

@injectable
@RestApi()
abstract class EscrowpayApiService {
  @factoryMethod
  factory EscrowpayApiService(Dio dio) = _EscrowpayApiService;

  @POST('/buyer/create-order')
  Future<ApiResponse<PaymentOrderModel>> createOrder(
    @Body() CreateOrderRequestModel request,
  );

  @POST('/users/search-user')
  Future<ApiResponse<SearchUserDataModel>> searchUser(
    @Body() SearchUserRequestModel request,
  );
}
