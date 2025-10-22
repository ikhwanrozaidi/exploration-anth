// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workscope_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkScopeResponse _$WorkScopeResponseFromJson(Map<String, dynamic> json) =>
    WorkScopeResponse(
      name: json['name'] as String?,
      code: json['code'] as String?,
      uid: json['uid'] as String?,
    );

Map<String, dynamic> _$WorkScopeResponseToJson(WorkScopeResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'uid': instance.uid,
    };
