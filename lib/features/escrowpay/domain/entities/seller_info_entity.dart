import 'package:equatable/equatable.dart';

class SellerInfo extends Equatable {
  final String userId;
  final String phone;
  final String username;
  final String firstName;
  final String lastName;
  final String address;
  final String profilePic;
  final String status;

  const SellerInfo({
    required this.userId,
    required this.phone,
    required this.username,
    required this.firstName,
    required this.lastName,
    required this.address,
    required this.profilePic,
    required this.status,
  });

  @override
  List<Object?> get props => [
    userId,
    phone,
    username,
    firstName,
    lastName,
    address,
    profilePic,
    status,
  ];

  String get fullName => '$firstName $lastName'.trim();
}
