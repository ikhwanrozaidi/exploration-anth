import 'package:json_annotation/json_annotation.dart';

part 'update_profile_request_model.g.dart';

@JsonSerializable(includeIfNull: false)
class UpdateProfileRequestModel {
  final String? email;
  final String? phone;
  final String? country;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? address;
  final String? birthDate;
  final String? profilePicture;

  const UpdateProfileRequestModel({
    this.email,
    this.phone,
    this.country,
    this.firstName,
    this.lastName,
    this.fullName,
    this.address,
    this.birthDate,
    this.profilePicture,
  });

  factory UpdateProfileRequestModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfileRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateProfileRequestModelToJson(this);
}
