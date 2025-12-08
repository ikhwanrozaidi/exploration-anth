// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_payment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePaymentRequestModel _$CreatePaymentRequestModelFromJson(
  Map<String, dynamic> json,
) => CreatePaymentRequestModel(
  productName: json['productName'] as String,
  productDesc: json['productDesc'] as String,
  productCat: json['productCat'] as String,
  price: json['price'] as String,
  sellerId: json['sellerId'] as String,
  isRequested: json['isRequested'] as String,
);

Map<String, dynamic> _$CreatePaymentRequestModelToJson(
  CreatePaymentRequestModel instance,
) => <String, dynamic>{
  'productName': instance.productName,
  'productDesc': instance.productDesc,
  'productCat': instance.productCat,
  'price': instance.price,
  'sellerId': instance.sellerId,
  'isRequested': instance.isRequested,
};
