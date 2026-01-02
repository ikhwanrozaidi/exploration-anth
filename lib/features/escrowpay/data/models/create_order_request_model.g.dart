// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateOrderRequestModel _$CreateOrderRequestModelFromJson(
  Map<String, dynamic> json,
) => _CreateOrderRequestModel(
  sellerUsername: json['sellerUsername'] as String,
  amount: json['amount'] as String,
  productName: json['productName'] as String,
  productDesc: (json['productDesc'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  productCat: json['productCat'] as String,
);

Map<String, dynamic> _$CreateOrderRequestModelToJson(
  _CreateOrderRequestModel instance,
) => <String, dynamic>{
  'sellerUsername': instance.sellerUsername,
  'amount': instance.amount,
  'productName': instance.productName,
  'productDesc': instance.productDesc,
  'productCat': instance.productCat,
};
