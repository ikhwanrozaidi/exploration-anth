// lib/features/pay_boarding/features/escrow_pay/data/models/seller_info_model.dart
import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/seller_info_entity.dart';

part 'seller_info_model.g.dart';

@JsonSerializable()
class SellerInfoModel {
  final String userId;
  final String phone;
  final String username;
  final String firstName;
  final String lastName;
  final String address;
  final String profilePic;
  final String status;

  const SellerInfoModel({
    required this.userId,
    required this.phone,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.profilePic,
    required this.status,
  });

  factory SellerInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SellerInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerInfoModelToJson(this);

  // Convert to entity
  SellerInfo toEntity() {
    return SellerInfo(
      userId: userId,
      phone: phone,
      username: username,
      firstName: firstName,
      lastName: lastName,
      address: address,
      profilePic: profilePic,
      status: status,
    );
  }

  // Convert from entity
  factory SellerInfoModel.fromEntity(SellerInfo entity) {
    return SellerInfoModel(
      userId: entity.userId,
      phone: entity.phone,
      username: entity.username,
      firstName: entity.firstName,
      lastName: entity.lastName,
      address: entity.address,
      profilePic: entity.profilePic,
      status: entity.status,
    );
  }
}

@JsonSerializable()
class SearchUsernameRequest {
  final String sellerUsername;

  const SearchUsernameRequest({required this.sellerUsername});

  factory SearchUsernameRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchUsernameRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchUsernameRequestToJson(this);
}

@JsonSerializable()
class SearchPhoneRequest {
  final String sellerPhone;

  const SearchPhoneRequest({required this.sellerPhone});

  factory SearchPhoneRequest.fromJson(Map<String, dynamic> json) =>
      _$SearchPhoneRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPhoneRequestToJson(this);
}

@JsonSerializable()
class SearchUsernameResponse {
  final int status;
  final String message;
  final dynamic data; // Can be SellerInfoModel or SearchErrorData

  const SearchUsernameResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SearchUsernameResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchUsernameResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchUsernameResponseToJson(this);
}

@JsonSerializable()
class SearchPhoneResponse {
  final int status;
  final String message;
  final SearchErrorData data;

  const SearchPhoneResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SearchPhoneResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchPhoneResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchPhoneResponseToJson(this);
}

@JsonSerializable()
class SearchErrorData {
  final String message;

  const SearchErrorData({required this.message});

  factory SearchErrorData.fromJson(Map<String, dynamic> json) =>
      _$SearchErrorDataFromJson(json);

  Map<String, dynamic> toJson() => _$SearchErrorDataToJson(this);
}
