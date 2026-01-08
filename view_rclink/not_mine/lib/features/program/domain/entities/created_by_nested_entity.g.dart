// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_by_nested_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatedByNested _$CreatedByNestedFromJson(Map<String, dynamic> json) =>
    CreatedByNested(
      id: (json['id'] as num?)?.toInt(),
      uid: json['uid'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$CreatedByNestedToJson(CreatedByNested instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phone': instance.phone,
      'email': instance.email,
    };
