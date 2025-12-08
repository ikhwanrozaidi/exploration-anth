import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/create_payment_request.dart';
import '../repository/escrowpay_repository.dart';

class CreatePaymentUseCase implements UseCase<String, CreatePaymentParams> {
  final EscrowpayRepository repository;

  CreatePaymentUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(CreatePaymentParams params) async {
    // Validate required fields
    if (params.request.productName.isEmpty) {
      return const Left(ValidationFailure('Product name cannot be empty'));
    }

    if (params.request.productDesc.isEmpty) {
      return const Left(
        ValidationFailure('Product description cannot be empty'),
      );
    }

    // Validate minimum 2 words for product description
    final words = params.request.productDesc.trim().split(' ');
    if (words.length < 2) {
      return const Left(
        ValidationFailure('Product description must contain at least 2 words'),
      );
    }

    if (params.request.price <= 0) {
      return const Left(ValidationFailure('Price must be greater than 0'));
    }

    if (params.request.sellerId.isEmpty) {
      return const Left(ValidationFailure('Seller must be selected'));
    }

    return await repository.createPayment(params.request);
  }
}

class CreatePaymentParams extends Equatable {
  final CreatePaymentRequest request;

  const CreatePaymentParams(this.request);

  @override
  List<Object?> get props => [request];
}
