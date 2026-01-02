import 'package:equatable/equatable.dart';

class CreatePaymentRequest extends Equatable {
  final String productName;
  final String productDesc;
  final String productCat;
  final double price;
  final String sellerId;
  final bool isRequested;

  const CreatePaymentRequest({
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
