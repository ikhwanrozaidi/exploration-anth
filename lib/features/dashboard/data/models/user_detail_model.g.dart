// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailModel _$UserDetailModelFromJson(Map<String, dynamic> json) =>
    UserDetailModel(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      phone: json['phone'] as String,
      country: json['country'] as String,
      email: json['email'] as String,
      verify: json['verify'] as String,
      gatePoint: json['gatePoint'] as String,
      balance: json['balance'] as String,
      vaccount: json['vaccount'] as String,
    );

Map<String, dynamic> _$UserDetailModelToJson(UserDetailModel instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'country': instance.country,
      'email': instance.email,
      'verify': instance.verify,
      'gatePoint': instance.gatePoint,
      'balance': instance.balance,
      'vaccount': instance.vaccount,
    };
