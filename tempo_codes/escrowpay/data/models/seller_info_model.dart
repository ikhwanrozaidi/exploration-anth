import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/seller_info_entity.dart';

part 'seller_info_model.g.dart';

@JsonSerializable()
class SellerInfoModel extends SellerInfo {
  const SellerInfoModel({
    required super.userId,
    required super.phone,
    required super.username,
    required super.firstName,
    required super.lastName,
    required super.address,
    required super.profilePic,
    required super.status,
  });

  factory SellerInfoModel.fromJson(Map<String, dynamic> json) =>
      _$SellerInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$SellerInfoModelToJson(this);

  SellerInfo toEntity() => SellerInfo(
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
