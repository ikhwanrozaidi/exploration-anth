import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/payment_order_entity.dart';
import '../../domain/entities/seller_validation_entity.dart';
import '../../domain/repositories/escrowpay_repository.dart';
import '../datasource/escrowpay_remote_datasource.dart';
import '../models/create_order_request_model.dart';
import '../models/search_user_request_model.dart';

@LazySingleton(as: EscrowpayRepository)
class EscrowpayRepositoryImpl implements EscrowpayRepository {
  final EscrowpayRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  EscrowpayRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, PaymentOrderEntity>> createOrder({
    required String sellerUsername,
    required double amount,
    required String productName,
    required List<String> productDesc,
    required String productCat,
  }) async {
    // Check internet connection
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    // Create request model
    final request = CreateOrderRequestModel(
      sellerUsername: sellerUsername,
      amount: amount.toString(), // API expects string
      productName: productName,
      productDesc: productDesc,
      productCat: productCat,
    );

    // Call remote datasource
    final result = await _remoteDataSource.createOrder(request);

    // Convert model to entity using toEntity()
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.data!.toEntity()),
    );
  }

  @override
  Future<Either<Failure, SellerValidationEntity>> searchUser({
    String? username,
    String? phone,
  }) async {
    // Check internet connection
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    // Create request model
    final request = SearchUserRequestModel(username: username, phone: phone);

    // Call remote datasource
    final result = await _remoteDataSource.searchUser(request);

    // Convert model to entity using toEntity()
    return result.fold((failure) => Left(failure), (model) => Right(model));
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    // No cache to clear since we're not storing anything locally
    return const Right(null);
  }
}
