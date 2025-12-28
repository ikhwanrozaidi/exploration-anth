// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateProfileRequestModel _$UpdateProfileRequestModelFromJson(
  Map<String, dynamic> json,
) => _UpdateProfileRequestModel(
  email: json['email'] as String?,
  phone: json['phone'] as String?,
  country: json['country'] as String?,
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  fullName: json['fullName'] as String?,
  address: json['address'] as String?,
  birthDate: json['birthDate'] as String?,
  profilePicture: json['profilePicture'] as String?,
);

Map<String, dynamic> _$UpdateProfileRequestModelToJson(
  _UpdateProfileRequestModel instance,
) => <String, dynamic>{
  'email': instance.email,
  'phone': instance.phone,
  'country': instance.country,
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'fullName': instance.fullName,
  'address': instance.address,
  'birthDate': instance.birthDate,
  'profilePicture': instance.profilePicture,
};
