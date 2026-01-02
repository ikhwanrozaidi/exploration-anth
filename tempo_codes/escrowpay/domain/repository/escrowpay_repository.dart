import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/search_response.dart';
import '../entities/create_payment_request.dart';

abstract class EscrowpayRepository {
  Future<Either<Failure, SearchResponse>> searchByUsername(String username);
  Future<Either<Failure, SearchResponse>> searchByPhone(String phone);
  Future<Either<Failure, String>> createPayment(CreatePaymentRequest request);
}
