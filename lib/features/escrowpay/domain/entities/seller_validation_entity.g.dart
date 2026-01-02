// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_validation_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerValidationEntity _$SellerValidationEntityFromJson(
  Map<String, dynamic> json,
) => SellerValidationEntity(
  isValid: json['isValid'] as bool,
  message: json['message'] as String,
);

Map<String, dynamic> _$SellerValidationEntityToJson(
  SellerValidationEntity instance,
) => <String, dynamic>{
  'isValid': instance.isValid,
  'message': instance.message,
};
