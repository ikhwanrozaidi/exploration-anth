// lib/features/pay_boarding/features/escrow_pay/domain/repositories/escrow_pay_repository.dart
import 'package:dartz/dartz.dart';
import '../../../../../../core/errors/failures.dart';
import '../entities/escrow_payment.dart';
import '../entities/seller_info_entity.dart';

abstract class EscrowPayRepository {
  Future<Either<Failure, String>> createPayment(EscrowPayment payment);
  Future<Either<Failure, SellerValidation>> searchUsername(String username);
  Future<Either<Failure, SellerValidation>> searchPhone(String phone);
}
