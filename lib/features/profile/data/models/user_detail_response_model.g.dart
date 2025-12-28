// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDetailResponseModel _$UserDetailResponseModelFromJson(
  Map<String, dynamic> json,
) => _UserDetailResponseModel(
  userId: (json['userId'] as num).toInt(),
  firstName: json['firstName'] as String,
  lastName: json['lastName'] as String,
  fullName: json['fullName'] as String,
  address: json['address'] as String?,
  birthDate: json['birthDate'] as String?,
  profilePicture: json['profilePicture'] as String?,
  gatePoint: (json['gatePoint'] as num).toInt(),
  verify: json['verify'] as bool,
  vaccount: json['vaccount'] as String?,
);

Map<String, dynamic> _$UserDetailResponseModelToJson(
  _UserDetailResponseModel instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'fullName': instance.fullName,
  'address': instance.address,
  'birthDate': instance.birthDate,
  'profilePicture': instance.profilePicture,
  'gatePoint': instance.gatePoint,
  'verify': instance.verify,
  'vaccount': instance.vaccount,
};
