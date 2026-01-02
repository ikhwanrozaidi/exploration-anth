import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:gatepay_app/shared/models/api_response.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../models/create_order_request_model.dart';
import '../models/payment_order_model.dart';
import '../models/search_user_request_model.dart';
import '../models/search_user_response_model.dart';
import 'escrowpay_api_service.dart';

abstract class EscrowpayRemoteDataSource {
  Future<Either<Failure, ApiResponse<PaymentOrderModel>>> createOrder(
    CreateOrderRequestModel request,
  );

  Future<Either<Failure, ApiResponse<SearchUserDataModel>>> searchUser(
    SearchUserRequestModel request,
  );
}

@Injectable(as: EscrowpayRemoteDataSource)
class EscrowpayRemoteDataSourceImpl implements EscrowpayRemoteDataSource {
  final EscrowpayApiService _apiService;

  EscrowpayRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, ApiResponse<PaymentOrderModel>>> createOrder(
    CreateOrderRequestModel request,
  ) async {
    try {
      final response = await _apiService.createOrder(request);
      return Right(response);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        final message = e.response?.data['message'] ?? 'Invalid request';
        return Left(ValidationFailure(message));
      }

      if (e.response?.statusCode == 404) {
        return const Left(ValidationFailure('Seller not found'));
      }

      if (e.response?.statusCode == 401) {
        return const Left(UnauthorizedFailure());
      }

      if (e.response?.statusCode == 500) {
        final message = e.response?.data['message'] ?? 'Server error occurred';
        return Left(ServerFailure(message));
      }

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return const Left(TimeoutFailure());
      }

      if (e.type == DioExceptionType.connectionError) {
        return const Left(ConnectionFailure());
      }

      return Left(NetworkFailure(e.message ?? 'Network error occurred'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ApiResponse<SearchUserDataModel>>> searchUser(
    SearchUserRequestModel request,
  ) async {
    try {
      final response = await _apiService.searchUser(request);
      return Right(response);
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        // User not found - this is expected behavior
        return const Left(ValidationFailure('User not found'));
      }

      if (e.response?.statusCode == 400) {
        final message = e.response?.data['message'] ?? 'Invalid request';
        return Left(ValidationFailure(message));
      }

      if (e.response?.statusCode == 401) {
        return const Left(UnauthorizedFailure());
      }

      if (e.response?.statusCode == 500) {
        final message = e.response?.data['message'] ?? 'Server error occurred';
        return Left(ServerFailure(message));
      }

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout ||
          e.type == DioExceptionType.sendTimeout) {
        return const Left(TimeoutFailure());
      }

      if (e.type == DioExceptionType.connectionError) {
        return const Left(ConnectionFailure());
      }

      return Left(NetworkFailure(e.message ?? 'Network error occurred'));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
