// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateProfileResponseModel _$UpdateProfileResponseModelFromJson(
  Map<String, dynamic> json,
) => _UpdateProfileResponseModel(
  user: UserResponseModel.fromJson(json['user'] as Map<String, dynamic>),
  userDetail: UserDetailResponseModel.fromJson(
    json['userDetail'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$UpdateProfileResponseModelToJson(
  _UpdateProfileResponseModel instance,
) => <String, dynamic>{
  'user': instance.user,
  'userDetail': instance.userDetail,
};
