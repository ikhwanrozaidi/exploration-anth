// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileResponseModel _$UpdateProfileResponseModelFromJson(
  Map<String, dynamic> json,
) => UpdateProfileResponseModel(
  user: User.fromJson(json['user'] as Map<String, dynamic>),
  userDetail: json['userDetail'] as Map<String, dynamic>,
);

Map<String, dynamic> _$UpdateProfileResponseModelToJson(
  UpdateProfileResponseModel instance,
) => <String, dynamic>{
  'user': instance.user,
  'userDetail': instance.userDetail,
};
