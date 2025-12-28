import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_detail.g.dart';

@JsonSerializable()
class UserDetail extends Equatable {
  final String firstName;
  final String lastName;
  final String fullName;
  final String? address;
  final String? birthDate;
  final String? profilePicture;
  final int gatePoint;
  final bool verify;
  final String? vaccount;

  const UserDetail({
    required this.firstName,
    required this.lastName,
    required this.fullName,
    this.address,
    this.birthDate,
    this.profilePicture,
    required this.gatePoint,
    required this.verify,
    this.vaccount,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) =>
      _$UserDetailFromJson(json);
  Map<String, dynamic> toJson() => _$UserDetailToJson(this);

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    fullName,
    address,
    birthDate,
    profilePicture,
    gatePoint,
    verify,
    vaccount,
  ];
}
