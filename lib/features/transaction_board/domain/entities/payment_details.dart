import 'package:equatable/equatable.dart';

class PaymentDetails extends Equatable {
  final String productName;
  final List<String> productDesc;
  final String productCat;
  final int amount;
  final bool refundable;
  final String deliveryStatus; // 'preparing', 'shipping', 'delivered', 'issue'

  const PaymentDetails({
    required this.productName,
    required this.productDesc,
    required this.productCat,
    required this.amount,
    required this.refundable,
    required this.deliveryStatus,
  });

  @override
  List<Object?> get props => [
    productName,
    productDesc,
    productCat,
    amount,
    refundable,
    deliveryStatus,
  ];
}
