import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:injectable/injectable.dart';
import '../../../../shared/models/api_response.dart';
import '../models/search_response_model.dart';
import '../models/search_username_request_model.dart';
import '../models/search_phone_request_model.dart';
import '../models/create_payment_request_model.dart';

part 'escrowpay_api_service.g.dart';

@injectable
@RestApi()
abstract class EscrowpayApiService {
  @factoryMethod
  factory EscrowpayApiService(Dio dio) = _EscrowpayApiService;

  @POST('/client/search-username')
  Future<ApiResponse<SearchResponseModel>> searchByUsername({
    @Body() required SearchUsernameRequestModel data,
  });

  @POST('/client/search-phone')
  Future<ApiResponse<SearchResponseModel>> searchByPhone({
    @Body() required SearchPhoneRequestModel data,
  });

  @POST('/client/create-payment')
  Future<ApiResponse<dynamic>> createPayment({
    @Body() required CreatePaymentRequestModel data,
  });
}
