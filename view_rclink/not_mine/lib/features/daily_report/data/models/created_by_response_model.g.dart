// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'created_by_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatedByResponseModel _$CreatedByResponseModelFromJson(
  Map<String, dynamic> json,
) => _CreatedByResponseModel(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
);

Map<String, dynamic> _$CreatedByResponseModelToJson(
  _CreatedByResponseModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
};
