import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/user_detail.dart';

part 'user_detail_model.g.dart';

@JsonSerializable()
class UserDetailModel extends UserDetail {
  const UserDetailModel({
    required super.firstName,
    required super.lastName,
    required super.phone,
    required super.country,
    required super.email,
    required super.verify,
    required super.gatePoint,
    required super.balance,
    required super.vaccount,
  });

  factory UserDetailModel.fromJson(Map<String, dynamic> json) =>
      _$UserDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDetailModelToJson(this);

  UserDetail toEntity() => UserDetail(
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        country: country,
        email: email,
        verify: verify,
        gatePoint: gatePoint,
        balance: balance,
        vaccount: vaccount,
      );
}