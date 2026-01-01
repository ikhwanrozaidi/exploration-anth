// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentDetailsModel _$PaymentDetailsModelFromJson(Map<String, dynamic> json) =>
    _PaymentDetailsModel(
      productName: json['productName'] as String,
      productDesc: (json['productDesc'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      productCat: json['productCat'] as String,
      amount: (json['amount'] as num).toInt(),
      refundable: json['refundable'] as bool,
      deliveryStatus: json['deliveryStatus'] as String,
    );

Map<String, dynamic> _$PaymentDetailsModelToJson(
  _PaymentDetailsModel instance,
) => <String, dynamic>{
  'productName': instance.productName,
  'productDesc': instance.productDesc,
  'productCat': instance.productCat,
  'amount': instance.amount,
  'refundable': instance.refundable,
  'deliveryStatus': instance.deliveryStatus,
};
