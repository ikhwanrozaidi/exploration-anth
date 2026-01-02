import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/payment_order_entity.dart';
import '../repositories/escrowpay_repository.dart';

@lazySingleton
class CreateOrderUseCase
    implements UseCase<PaymentOrderEntity, CreateOrderParams> {
  final EscrowpayRepository _repository;

  CreateOrderUseCase(this._repository);

  @override
  Future<Either<Failure, PaymentOrderEntity>> call(
    CreateOrderParams params,
  ) async {
    // Validation
    if (params.sellerUsername.isEmpty) {
      return const Left(ValidationFailure('Seller username is required'));
    }

    if (params.amount <= 0) {
      return const Left(ValidationFailure('Amount must be greater than 0'));
    }

    if (params.productName.isEmpty) {
      return const Left(ValidationFailure('Product name is required'));
    }

    if (params.productDesc.isEmpty) {
      return const Left(
        ValidationFailure('At least one product description is required'),
      );
    }

    if (params.productCat.isEmpty) {
      return const Left(ValidationFailure('Product category is required'));
    }

    return _repository.createOrder(
      sellerUsername: params.sellerUsername,
      amount: params.amount,
      productName: params.productName,
      productDesc: params.productDesc,
      productCat: params.productCat,
    );
  }
}

class CreateOrderParams {
  final String sellerUsername;
  final double amount;
  final String productName;
  final List<String> productDesc;
  final String productCat;

  CreateOrderParams({
    required this.sellerUsername,
    required this.amount,
    required this.productName,
    required this.productDesc,
    required this.productCat,
  });
}
