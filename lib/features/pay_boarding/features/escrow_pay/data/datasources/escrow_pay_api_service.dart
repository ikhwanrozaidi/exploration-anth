// lib/features/pay_boarding/features/escrow_pay/data/datasources/escrow_pay_api_service.dart
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import '../models/escrow_payment_model.dart';
import '../models/seller_info_model.dart';

part 'escrow_pay_api_service.g.dart';

@RestApi()
@lazySingleton
abstract class EscrowPayApiService {
  @factoryMethod
  factory EscrowPayApiService(Dio dio) = _EscrowPayApiService;

  @POST('/client/create-payment')
  Future<CreatePaymentResponse> createPayment(
    @Body() CreatePaymentRequest request,
  );

  @POST('/client/search-username')
  Future<SearchUsernameResponse> searchUsername(
    @Body() SearchUsernameRequest request,
  );

  @POST('/client/search-phone')
  Future<SearchPhoneResponse> searchPhone(@Body() SearchPhoneRequest request);
}
