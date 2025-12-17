// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserSettings _$UserSettingsFromJson(Map<String, dynamic> json) => UserSettings(
  marketing: json['marketing'] as bool,
  notifications: json['notifications'] as bool,
  twoFA: json['twoFA'] as bool,
);

Map<String, dynamic> _$UserSettingsToJson(UserSettings instance) =>
    <String, dynamic>{
      'marketing': instance.marketing,
      'notifications': instance.notifications,
      'twoFA': instance.twoFA,
    };
