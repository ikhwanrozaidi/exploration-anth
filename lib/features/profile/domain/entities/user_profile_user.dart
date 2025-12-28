import 'package:equatable/equatable.dart';

class UserProfileUser extends Equatable {
  final int id;
  final String email;
  final String role;
  final String phone;
  final String status;
  final String balance;
  final int? merchantId;
  final String? country;
  final DateTime createdAt;

  const UserProfileUser({
    required this.id,
    required this.email,
    required this.role,
    required this.phone,
    required this.status,
    required this.balance,
    this.merchantId,
    this.country,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
    id,
    email,
    role,
    phone,
    status,
    balance,
    merchantId,
    country,
    createdAt,
  ];
}
