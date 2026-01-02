import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/create_payment_request.dart';
import '../../domain/entities/search_response.dart';
import '../../domain/repository/escrowpay_repository.dart';
import '../datasources/escrowpay_local_datasource.dart';
import '../datasources/escrowpay_remote_datasource.dart';

@LazySingleton(as: EscrowpayRepository)
class EscrowpayRepositoryImpl implements EscrowpayRepository {
  final EscrowpayRemoteDataSource _remoteDataSource;
  final EscrowpayLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  EscrowpayRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, SearchResponse>> searchByUsername(
    String username,
  ) async {
    // Skip network check for now - let Dio handle connection errors
    final result = await _remoteDataSource.searchByUsername(username);
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.toEntity()),
    );
  }

  @override
  Future<Either<Failure, SearchResponse>> searchByPhone(String phone) async {
    // Skip network check for now - let Dio handle connection errors
    final result = await _remoteDataSource.searchByPhone(phone);
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.toEntity()),
    );
  }

  @override
  Future<Either<Failure, String>> createPayment(
    CreatePaymentRequest request,
  ) async {
    // Skip network check for now - let Dio handle connection errors
    final payload = {
      'productName': request.productName,
      'productDesc': request.productDesc,
      'productCat': request.productCat,
      'price': request.price.toString(),
      'sellerId': request.sellerId,
      'isRequested': request.isRequested.toString(),
    };

    return await _remoteDataSource.createPayment(payload);
  }
}
