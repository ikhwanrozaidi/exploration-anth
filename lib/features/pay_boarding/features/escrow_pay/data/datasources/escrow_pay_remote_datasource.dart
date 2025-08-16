// lib/features/pay_boarding/features/escrow_pay/data/datasources/escrow_pay_remote_data_source.dart
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/network/network_info.dart';
import '../../domain/entities/seller_info_entity.dart';
import '../models/escrow_payment_model.dart';
import '../models/seller_info_model.dart';
import 'escrow_pay_api_service.dart';

abstract class EscrowPayRemoteDataSource {
  Future<Either<Failure, String>> createPayment(CreatePaymentRequest request);
  Future<Either<Failure, SellerValidation>> searchUsername(String username);
  Future<Either<Failure, SellerValidation>> searchPhone(String phone);
}

@LazySingleton(as: EscrowPayRemoteDataSource)
class EscrowPayRemoteDataSourceImpl implements EscrowPayRemoteDataSource {
  final EscrowPayApiService _apiService;
  final NetworkInfo _networkInfo;

  EscrowPayRemoteDataSourceImpl(this._apiService, this._networkInfo);

  @override
  Future<Either<Failure, String>> createPayment(
    CreatePaymentRequest request,
  ) async {
    if (!await _networkInfo.isConnected) {
      return const Left(ConnectionFailure());
    }

    try {
      final response = await _apiService.createPayment(request);

      if (response.status == 200) {
        return Right(response.data.message);
      } else {
        return Left(ServerFailure(response.message));
      }
    } catch (e) {
      return Left(NetworkFailure('Failed to create payment: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, SellerValidation>> searchUsername(
    String username,
  ) async {
    if (!await _networkInfo.isConnected) {
      return const Left(ConnectionFailure());
    }

    try {
      final request = SearchUsernameRequest(sellerUsername: username);
      final response = await _apiService.searchUsername(request);

      if (response.status == 200) {
        if (response.message == "User found") {
          // User found - parse seller info
          final sellerInfo = SellerInfoModel.fromJson(
            response.data as Map<String, dynamic>,
          );
          final sellerInfoModel = SellerInfoModel.fromJson(
            response.data as Map<String, dynamic>,
          );
          return Right(
            SellerValidation(
              result: SellerValidationResult.valid,
              message: response.message,
              sellerInfo: sellerInfoModel.toEntity(),
            ),
          );
        } else if (response.message == "User Not found") {
          // User not found - should use phone
          final errorData = SearchErrorData.fromJson(
            response.data as Map<String, dynamic>,
          );
          return Right(
            SellerValidation(
              result: SellerValidationResult.shouldUsePhone,
              message: errorData.message,
            ),
          );
        }
      }

      return Left(ServerFailure(response.message));
    } catch (e) {
      return Left(NetworkFailure('Failed to search username: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, SellerValidation>> searchPhone(String phone) async {
    if (!await _networkInfo.isConnected) {
      return const Left(ConnectionFailure());
    }

    try {
      final request = SearchPhoneRequest(sellerPhone: phone);
      final response = await _apiService.searchPhone(request);

      if (response.status == 200) {
        if (response.message == "User found") {
          // User found - should use username instead
          return Right(
            SellerValidation(
              result: SellerValidationResult.shouldUseUsername,
              message: response.data.message,
            ),
          );
        } else if (response.message == "User Not found") {
          // User not found - phone is valid for new user
          return Right(
            SellerValidation(
              result: SellerValidationResult.valid,
              message: response.data.message,
            ),
          );
        }
      }

      return Left(ServerFailure(response.message));
    } catch (e) {
      return Left(NetworkFailure('Failed to search phone: ${e.toString()}'));
    }
  }
}
