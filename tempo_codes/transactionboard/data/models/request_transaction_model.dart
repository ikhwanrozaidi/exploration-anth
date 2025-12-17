import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/request_transaction.dart';

part 'request_transaction_model.g.dart';

@JsonSerializable()
class RequestTransactionModel extends RequestTransaction {
  const RequestTransactionModel({
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

  factory RequestTransactionModel.fromJson(Map<String, dynamic> json) =>
      _$RequestTransactionModelFromJson(json);

  Map<String, dynamic> toJson() => _$RequestTransactionModelToJson(this);

  RequestTransaction toEntity() => RequestTransaction(
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