import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user_detail.dart';
import 'user_settings.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int id;
  final String email;
  final String role;
  final String phone;
  final String status;
  final String balance;
  final int? merchantId;
  final String? country;
  final DateTime createdAt;
  final UserDetail? userDetail;
  final UserSettings? userSettings;

  const User({
    required this.id,
    required this.email,
    required this.role,
    required this.phone,
    required this.status,
    required this.balance,
    this.merchantId,
    this.country,
    required this.createdAt,
    this.userDetail,
    this.userSettings,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? id,
    String? email,
    String? role,
    String? phone,
    String? status,
    String? balance,
    int? merchantId,
    String? country,
    DateTime? createdAt,
    UserDetail? userDetail,
    UserSettings? userSettings,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      role: role ?? this.role,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      balance: balance ?? this.balance,
      merchantId: merchantId ?? this.merchantId,
      country: country ?? this.country,
      createdAt: createdAt ?? this.createdAt,
      userDetail: userDetail ?? this.userDetail,
      userSettings: userSettings ?? this.userSettings,
    );
  }

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
    userDetail,
    userSettings,
  ];
}
