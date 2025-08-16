import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/errors/failures.dart';
import '../../domain/entities/escrow_payment.dart';
import '../../domain/entities/seller_info_entity.dart';
import '../../domain/repositories/escrow_pay_repository.dart';
import '../datasources/escrow_pay_local_datasource.dart';
import '../datasources/escrow_pay_remote_datasource.dart';
import '../models/escrow_payment_model.dart';

@LazySingleton(as: EscrowPayRepository)
class EscrowPayRepositoryImpl implements EscrowPayRepository {
  final EscrowPayRemoteDataSource _remoteDataSource;
  final EscrowPayLocalDataSource _localDataSource;

  EscrowPayRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  Future<Either<Failure, String>> createPayment(EscrowPayment payment) async {
    try {
      // Convert entity to model
      final request = CreatePaymentRequest(
        productName: payment.productName,
        productDesc: payment.productDesc
            .map((desc) => ProductDescriptionModel.fromEntity(desc))
            .toList(),
        productCat: payment.productCat,
        price: payment.price,
        sellerId: payment.sellerId,
        isRequested: payment.isRequested,
      );

      // Cache data locally first for offline recovery
      await _localDataSource.cachePaymentData(request);

      // Make API call
      final result = await _remoteDataSource.createPayment(request);

      return result.fold((failure) => Left(failure), (message) {
        // Clear cache on successful payment
        _localDataSource.clearPaymentCache();
        return Right(message);
      });
    } catch (e) {
      return Left(ServerFailure('Repository error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, SellerValidation>> searchUsername(
    String username,
  ) async {
    try {
      return await _remoteDataSource.searchUsername(username);
    } catch (e) {
      return Left(ServerFailure('Repository error: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, SellerValidation>> searchPhone(String phone) async {
    try {
      return await _remoteDataSource.searchPhone(phone);
    } catch (e) {
      return Left(ServerFailure('Repository error: ${e.toString()}'));
    }
  }
}
