import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/payment_order_entity.dart';
import '../entities/seller_validation_entity.dart';

abstract class EscrowpayRepository {
  /// Create a new escrow payment order
  Future<Either<Failure, PaymentOrderEntity>> createOrder({
    required String sellerUsername,
    required double amount,
    required String productName,
    required List<String> productDesc,
    required String productCat,
  });

  /// Search for a user by username or phone to validate seller
  Future<Either<Failure, SellerValidationEntity>> searchUser({
    String? username,
    String? phone,
  });

  /// Clear all cached escrow payment data
  Future<Either<Failure, void>> clearCache();
}
