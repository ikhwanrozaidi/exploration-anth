// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSettingsResponseModel _$UserSettingsResponseModelFromJson(
  Map<String, dynamic> json,
) => UserSettingsResponseModel(
  address: json['address'] as String,
  profilePicture: json['profilePicture'] as String,
  tier: json['tier'] as String,
  fullName: json['fullName'] as String,
  isMarketing: json['isMarketing'] as bool,
  isNotifications: json['isNotifications'] as bool,
  isTwoFa: json['isTwoFa'] as bool,
);

Map<String, dynamic> _$UserSettingsResponseModelToJson(
  UserSettingsResponseModel instance,
) => <String, dynamic>{
  'address': instance.address,
  'profilePicture': instance.profilePicture,
  'tier': instance.tier,
  'fullName': instance.fullName,
  'isMarketing': instance.isMarketing,
  'isNotifications': instance.isNotifications,
  'isTwoFa': instance.isTwoFa,
};
