// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerInfoModel _$SellerInfoModelFromJson(Map<String, dynamic> json) =>
    SellerInfoModel(
      userId: json['userId'] as String,
      phone: json['phone'] as String,
      username: json['username'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      address: json['address'] as String,
      profilePic: json['profilePic'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$SellerInfoModelToJson(SellerInfoModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'phone': instance.phone,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'address': instance.address,
      'profilePic': instance.profilePic,
      'status': instance.status,
    };
