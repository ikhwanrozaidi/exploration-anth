// lib/features/pay_boarding/features/escrow_pay/domain/entities/escrow_payment.dart
import 'package:equatable/equatable.dart';

class EscrowPayment extends Equatable {
  final String productName;
  final List<ProductDescription> productDesc;
  final String productCat;
  final double price;
  final String sellerId;
  final bool isRequested;

  const EscrowPayment({
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

class ProductDescription extends Equatable {
  final String description;

  const ProductDescription({required this.description});

  @override
  List<Object?> get props => [description];
}
