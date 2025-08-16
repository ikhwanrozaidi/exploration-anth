// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escrow_payment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDescriptionModel _$ProductDescriptionModelFromJson(
  Map<String, dynamic> json,
) => ProductDescriptionModel(description: json['description'] as String);

Map<String, dynamic> _$ProductDescriptionModelToJson(
  ProductDescriptionModel instance,
) => <String, dynamic>{'description': instance.description};

EscrowPaymentModel _$EscrowPaymentModelFromJson(Map<String, dynamic> json) =>
    EscrowPaymentModel(
      productName: json['productName'] as String,
      productDesc: (json['productDesc'] as List<dynamic>)
          .map(
            (e) => ProductDescriptionModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      productCat: json['productCat'] as String,
      price: (json['price'] as num).toDouble(),
      sellerId: json['sellerId'] as String,
      isRequested: json['isRequested'] as bool,
    );

Map<String, dynamic> _$EscrowPaymentModelToJson(EscrowPaymentModel instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'productDesc': instance.productDesc,
      'productCat': instance.productCat,
      'price': instance.price,
      'sellerId': instance.sellerId,
      'isRequested': instance.isRequested,
    };

CreatePaymentRequest _$CreatePaymentRequestFromJson(
  Map<String, dynamic> json,
) => CreatePaymentRequest(
  productName: json['productName'] as String,
  productDesc: (json['productDesc'] as List<dynamic>)
      .map((e) => ProductDescriptionModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  productCat: json['productCat'] as String,
  price: (json['price'] as num).toDouble(),
  sellerId: json['sellerId'] as String,
  isRequested: json['isRequested'] as bool,
);

Map<String, dynamic> _$CreatePaymentRequestToJson(
  CreatePaymentRequest instance,
) => <String, dynamic>{
  'productName': instance.productName,
  'productDesc': instance.productDesc,
  'productCat': instance.productCat,
  'price': instance.price,
  'sellerId': instance.sellerId,
  'isRequested': instance.isRequested,
};

CreatePaymentResponse _$CreatePaymentResponseFromJson(
  Map<String, dynamic> json,
) => CreatePaymentResponse(
  status: (json['status'] as num).toInt(),
  message: json['message'] as String,
  data: CreatePaymentData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CreatePaymentResponseToJson(
  CreatePaymentResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

CreatePaymentData _$CreatePaymentDataFromJson(Map<String, dynamic> json) =>
    CreatePaymentData(message: json['message'] as String);

Map<String, dynamic> _$CreatePaymentDataToJson(CreatePaymentData instance) =>
    <String, dynamic>{'message': instance.message};
