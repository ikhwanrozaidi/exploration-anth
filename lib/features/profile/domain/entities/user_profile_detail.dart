import 'package:equatable/equatable.dart';

class UserProfileDetail extends Equatable {
  final String firstName;
  final String lastName;
  final String fullName;
  final String? address;
  final String? birthDate;
  final String? profilePicture;
  final int gatePoint;
  final bool verify;
  final String? vaccount;

  const UserProfileDetail({
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
