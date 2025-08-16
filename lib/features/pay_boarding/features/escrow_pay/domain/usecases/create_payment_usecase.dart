import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecases/usecase.dart';
import '../entities/escrow_payment.dart';
import '../repositories/escrow_pay_repository.dart';

@injectable
class CreatePaymentUseCase implements UseCase<String, CreatePaymentParams> {
  final EscrowPayRepository repository;

  CreatePaymentUseCase(this.repository);

  @override
  Future<Either<Failure, String>> call(CreatePaymentParams params) async {
    if (params.productName.isEmpty) {
      return const Left(ValidationFailure('Product name cannot be empty'));
    }

    if (params.productDesc.isEmpty) {
      return const Left(
        ValidationFailure('Product description cannot be empty'),
      );
    }

    if (params.price <= 0) {
      return const Left(ValidationFailure('Price must be greater than 0'));
    }

    if (params.sellerId.isEmpty) {
      return const Left(ValidationFailure('Seller ID cannot be empty'));
    }

    final payment = EscrowPayment(
      productName: params.productName,
      productDesc: params.productDesc,
      productCat: params.productCat,
      price: params.price,
      sellerId: params.sellerId,
      isRequested: params.isRequested,
    );

    return await repository.createPayment(payment);
  }
}

class CreatePaymentParams extends Equatable {
  final String productName;
  final List<ProductDescription> productDesc;
  final String productCat;
  final double price;
  final String sellerId;
  final bool isRequested;

  const CreatePaymentParams({
    required this.productName,
    required this.productDesc,
    required this.productCat,
    required this.price,
    required this.sellerId,
    required this.isRequested,
  });

  @override
  List<Object?> get props => [
    productName,
    productDesc,
    productCat,
    price,
    sellerId,
    isRequested,
  ];
}
