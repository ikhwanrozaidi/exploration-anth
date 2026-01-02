import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/models/api_response.dart';
import '../models/search_response_model.dart';
import '../models/search_username_request_model.dart';
import '../models/search_phone_request_model.dart';
import '../models/create_payment_request_model.dart';
import 'escrowpay_api_service.dart';

abstract class EscrowpayRemoteDataSource {
  Future<Either<Failure, SearchResponseModel>> searchByUsername(
    String username,
  );
  Future<Either<Failure, SearchResponseModel>> searchByPhone(String phone);
  Future<Either<Failure, String>> createPayment(Map<String, dynamic> payload);
}

@LazySingleton(as: EscrowpayRemoteDataSource)
class EscrowpayRemoteDataSourceImpl implements EscrowpayRemoteDataSource {
  final EscrowpayApiService _apiService;

  EscrowpayRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, SearchResponseModel>> searchByUsername(
    String username,
  ) async {
    try {
      final request = SearchUsernameRequestModel(sellerUsername: username);
      final ApiResponse<SearchResponseModel> response = await _apiService
          .searchByUsername(data: request);

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(response.message ?? 'Search failed'));
      }
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  @override
  Future<Either<Failure, SearchResponseModel>> searchByPhone(
    String phone,
  ) async {
    try {
      final request = SearchPhoneRequestModel(sellerPhone: phone);
      final ApiResponse<SearchResponseModel> response = await _apiService
          .searchByPhone(data: request);

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(ServerFailure(response.message ?? 'Search failed'));
      }
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  @override
  Future<Either<Failure, String>> createPayment(
    Map<String, dynamic> payload,
  ) async {
    try {
      final request = CreatePaymentRequestModel(
        productName: payload['productName'],
        productDesc: payload['productDesc'],
        productCat: payload['productCat'],
        price: payload['price'],
        sellerId: payload['sellerId'],
        isRequested: payload['isRequested'],
      );

      final ApiResponse<dynamic> response = await _apiService.createPayment(
        data: request,
      );

      if (response.isSuccess) {
        return Right(response.message ?? 'Payment created successfully');
      } else {
        return Left(
          ServerFailure(response.message ?? 'Payment creation failed'),
        );
      }
    } catch (e) {
      return Left(_handleError(e));
    }
  }

  Failure _handleError(dynamic error) {
    if (error is Exception) {
      return ServerFailure('Network error: ${error.toString()}');
    }
    return ServerFailure('Unknown error occurred');
  }
}
