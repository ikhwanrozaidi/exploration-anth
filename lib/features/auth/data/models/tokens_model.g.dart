// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TokensModel _$TokensModelFromJson(Map<String, dynamic> json) => _TokensModel(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  accessTokenExpiresAt: DateTime.parse(json['accessTokenExpiresAt'] as String),
  refreshTokenExpiresAt: DateTime.parse(
    json['refreshTokenExpiresAt'] as String,
  ),
);

Map<String, dynamic> _$TokensModelToJson(_TokensModel instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'accessTokenExpiresAt': instance.accessTokenExpiresAt.toIso8601String(),
      'refreshTokenExpiresAt': instance.refreshTokenExpiresAt.toIso8601String(),
    };
