// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetail _$UserDetailFromJson(Map<String, dynamic> json) => UserDetail(
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

Map<String, dynamic> _$UserDetailToJson(UserDetail instance) =>
    <String, dynamic>{
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
