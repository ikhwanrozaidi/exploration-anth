import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/onhold_transaction.dart';

part 'onhold_transaction_model.g.dart';

@JsonSerializable()
class OnholdTransactionModel extends OnholdTransaction {
  const OnholdTransactionModel({
    required super.createdAt,
    required super.paymentId,
    required super.paymentType,
    required super.senderId,
    required super.receiverId,
    required super.merchantId,
    required super.productName,
    required super.productDesc,
    required super.productCat,
    required super.amount,
    required super.refundable,
  });

  factory OnholdTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$OnholdTransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnholdTransactionModelToJson(this);

  OnholdTransaction toEntity() => OnholdTransaction(
        createdAt: createdAt,
        paymentId: paymentId,
        paymentType: paymentType,
        senderId: senderId,
        receiverId: receiverId,
        merchantId: merchantId,
        productName: productName,
        productDesc: productDesc,
        productCat: productCat,
        amount: amount,
        refundable: refundable,
      );
}