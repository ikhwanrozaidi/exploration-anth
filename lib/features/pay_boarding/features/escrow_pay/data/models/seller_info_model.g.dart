// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'seller_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SellerInfoModel _$SellerInfoModelFromJson(Map<String, dynamic> json) =>
    SellerInfoModel(
      userId: json['userId'] as String,
      phone: json['phone'] as String,
      username: json['username'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      address: json['address'] as String,
      profilePic: json['profilePic'] as String,
      status: json['status'] as String,
    );

Map<String, dynamic> _$SellerInfoModelToJson(SellerInfoModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'phone': instance.phone,
      'username': instance.username,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'address': instance.address,
      'profilePic': instance.profilePic,
      'status': instance.status,
    };

SearchUsernameRequest _$SearchUsernameRequestFromJson(
  Map<String, dynamic> json,
) => SearchUsernameRequest(sellerUsername: json['sellerUsername'] as String);

Map<String, dynamic> _$SearchUsernameRequestToJson(
  SearchUsernameRequest instance,
) => <String, dynamic>{'sellerUsername': instance.sellerUsername};

SearchPhoneRequest _$SearchPhoneRequestFromJson(Map<String, dynamic> json) =>
    SearchPhoneRequest(sellerPhone: json['sellerPhone'] as String);

Map<String, dynamic> _$SearchPhoneRequestToJson(SearchPhoneRequest instance) =>
    <String, dynamic>{'sellerPhone': instance.sellerPhone};

SearchUsernameResponse _$SearchUsernameResponseFromJson(
  Map<String, dynamic> json,
) => SearchUsernameResponse(
  status: (json['status'] as num).toInt(),
  message: json['message'] as String,
  data: json['data'],
);

Map<String, dynamic> _$SearchUsernameResponseToJson(
  SearchUsernameResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

SearchPhoneResponse _$SearchPhoneResponseFromJson(Map<String, dynamic> json) =>
    SearchPhoneResponse(
      status: (json['status'] as num).toInt(),
      message: json['message'] as String,
      data: SearchErrorData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchPhoneResponseToJson(
  SearchPhoneResponse instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'data': instance.data,
};

SearchErrorData _$SearchErrorDataFromJson(Map<String, dynamic> json) =>
    SearchErrorData(message: json['message'] as String);

Map<String, dynamic> _$SearchErrorDataToJson(SearchErrorData instance) =>
    <String, dynamic>{'message': instance.message};
