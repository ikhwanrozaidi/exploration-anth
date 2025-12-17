// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequestModel _$UpdateProfileRequestModelFromJson(
  Map<String, dynamic> json,
) => UpdateProfileRequestModel(
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
  UpdateProfileRequestModel instance,
) => <String, dynamic>{
  if (instance.email case final value?) 'email': value,
  if (instance.phone case final value?) 'phone': value,
  if (instance.country case final value?) 'country': value,
  if (instance.firstName case final value?) 'firstName': value,
  if (instance.lastName case final value?) 'lastName': value,
  if (instance.fullName case final value?) 'fullName': value,
  if (instance.address case final value?) 'address': value,
  if (instance.birthDate case final value?) 'birthDate': value,
  if (instance.profilePicture case final value?) 'profilePicture': value,
};
