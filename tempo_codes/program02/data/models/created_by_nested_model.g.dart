// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_by_nested_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatedByNestedModel _$CreatedByNestedModelFromJson(
  Map<String, dynamic> json,
) => _CreatedByNestedModel(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
);

Map<String, dynamic> _$CreatedByNestedModelToJson(
  _CreatedByNestedModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'phone': instance.phone,
  'email': instance.email,
};
