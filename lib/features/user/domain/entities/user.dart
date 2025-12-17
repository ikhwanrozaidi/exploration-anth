import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int id;
  final String email;
  final String role;
  final String phone;
  final String status;
  final String balance;
  final String? merchantId;
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
    String? merchantId,
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

@JsonSerializable()
class UserDetail extends Equatable {
  final String firstName;
  final String lastName;
  final String fullName;
  final String address;
  final String birthDate;
  final String profilePicture;
  final int gatePoint;
  final bool verify;
  final String vaccount;

  const UserDetail({
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.address,
    required this.birthDate,
    required this.profilePicture,
    required this.gatePoint,
    required this.verify,
    required this.vaccount,
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

@JsonSerializable()
class UserSettings extends Equatable {
  final bool marketing;
  final bool notifications;
  final bool twoFA;

  const UserSettings({
    required this.marketing,
    required this.notifications,
    required this.twoFA,
  });

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
  Map<String, dynamic> toJson() => _$UserSettingsToJson(this);

  @override
  List<Object?> get props => [marketing, notifications, twoFA];
}
