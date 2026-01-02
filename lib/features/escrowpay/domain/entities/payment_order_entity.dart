import 'package:gatepay_app/features/transaction_board/domain/entities/payment_details.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_info_entity.dart';

part 'payment_order_entity.g.dart';

@JsonSerializable()
class PaymentOrderEntity {
  final String paymentId;
  final String paymentType;
  final int sellerId;
  final int buyerId;
  final double amount;
  final bool isRequest;
  final String status;
  final bool isCompleted;
  final PaymentDetails paymentDetails;
  final UserInfoEntity buyer;
  final UserInfoEntity seller;

  const PaymentOrderEntity({
    required this.paymentId,
    required this.paymentType,
    required this.sellerId,
    required this.buyerId,
    required this.amount,
    required this.isRequest,
    required this.status,
    required this.isCompleted,
    required this.paymentDetails,
    required this.buyer,
    required this.seller,
  });

  factory PaymentOrderEntity.fromJson(Map<String, dynamic> json) =>
      _$PaymentOrderEntityFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentOrderEntityToJson(this);

  PaymentOrderEntity copyWith({
    String? paymentId,
    String? paymentType,
    int? sellerId,
    int? buyerId,
    double? amount,
    bool? isRequest,
    String? status,
    bool? isCompleted,
    PaymentDetails? paymentDetails,
    UserInfoEntity? buyer,
    UserInfoEntity? seller,
  }) {
    return PaymentOrderEntity(
      paymentId: paymentId ?? this.paymentId,
      paymentType: paymentType ?? this.paymentType,
      sellerId: sellerId ?? this.sellerId,
      buyerId: buyerId ?? this.buyerId,
      amount: amount ?? this.amount,
      isRequest: isRequest ?? this.isRequest,
      status: status ?? this.status,
      isCompleted: isCompleted ?? this.isCompleted,
      paymentDetails: paymentDetails ?? this.paymentDetails,
      buyer: buyer ?? this.buyer,
      seller: seller ?? this.seller,
    );
  }
}
