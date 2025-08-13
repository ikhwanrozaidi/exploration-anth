// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onhold_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnholdTransactionModel _$OnholdTransactionModelFromJson(
  Map<String, dynamic> json,
) => OnholdTransactionModel(
  createdAt: json['createdAt'] as String,
  paymentId: json['paymentId'] as String,
  paymentType: json['paymentType'] as String,
  senderId: json['senderId'] as String,
  receiverId: json['receiverId'] as String,
  merchantId: json['merchantId'] as String,
  productName: json['productName'] as String,
  productDesc: json['productDesc'] as String,
  productCat: json['productCat'] as String,
  amount: json['amount'] as String,
  refundable: json['refundable'] as String,
);

Map<String, dynamic> _$OnholdTransactionModelToJson(
  OnholdTransactionModel instance,
) => <String, dynamic>{
  'createdAt': instance.createdAt,
  'paymentId': instance.paymentId,
  'paymentType': instance.paymentType,
  'senderId': instance.senderId,
  'receiverId': instance.receiverId,
  'merchantId': instance.merchantId,
  'productName': instance.productName,
  'productDesc': instance.productDesc,
  'productCat': instance.productCat,
  'amount': instance.amount,
  'refundable': instance.refundable,
};
