import 'package:equatable/equatable.dart';

class OnholdTransaction extends Equatable {
  final String createdAt;
  final String paymentId;
  final String paymentType;
  final String senderId;
  final String receiverId;
  final String merchantId;
  final String productName;
  final String productDesc;
  final String productCat;
  final String amount;
  final String refundable;

  const OnholdTransaction({
    required this.createdAt,
    required this.paymentId,
    required this.paymentType,
    required this.senderId,
    required this.receiverId,
    required this.merchantId,
    required this.productName,
    required this.productDesc,
    required this.productCat,
    required this.amount,
    required this.refundable,
  });

  @override
  List<Object> get props => [
        createdAt,
        paymentId,
        paymentType,
        senderId,
        receiverId,
        merchantId,
        productName,
        productDesc,
        productCat,
        amount,
        refundable,
      ];
}