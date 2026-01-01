// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionModel _$TransactionModelFromJson(
  Map<String, dynamic> json,
) => _TransactionModel(
  paymentId: json['paymentId'] as String,
  paymentType: json['paymentType'] as String,
  sellerId: (json['sellerId'] as num).toInt(),
  buyerId: (json['buyerId'] as num).toInt(),
  merchantId: (json['merchantId'] as num?)?.toInt(),
  amount: (json['amount'] as num).toInt(),
  providerId: json['providerId'] as String,
  isCompleted: json['isCompleted'] as bool,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  userRole: json['userRole'] as String,
  paymentDetails: PaymentDetailsModel.fromJson(
    json['paymentDetails'] as Map<String, dynamic>,
  ),
  seller: json['seller'] == null
      ? null
      : TransactionUserModel.fromJson(json['seller'] as Map<String, dynamic>),
  buyer: TransactionUserModel.fromJson(json['buyer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      'paymentId': instance.paymentId,
      'paymentType': instance.paymentType,
      'sellerId': instance.sellerId,
      'buyerId': instance.buyerId,
      'merchantId': instance.merchantId,
      'amount': instance.amount,
      'providerId': instance.providerId,
      'isCompleted': instance.isCompleted,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'userRole': instance.userRole,
      'paymentDetails': instance.paymentDetails,
      'seller': instance.seller,
      'buyer': instance.buyer,
    };
