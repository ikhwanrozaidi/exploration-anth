// lib/features/user/domain/entities/user.dart
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends Equatable {
  final int id;
  final String uid;
  final String phone;
  final String? firstName;
  final String? lastName;
  final String? email;
  final DateTime updatedAt;
  final DateTime createdAt;

  const User({
    required this.id,
    required this.uid,
    required this.phone,
    this.firstName,
    this.lastName,
    this.email,
    required this.updatedAt,
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  User copyWith({
    int? id,
    String? uid,
    String? phone,
    String? firstName,
    String? lastName,
    String? email,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      phone: phone ?? this.phone,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      updatedAt: updatedAt ?? this.updatedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  String get fullName {
    if (firstName == null && lastName == null) return 'User';
    if (firstName == null) return lastName!;
    if (lastName == null) return firstName!;
    return '$firstName $lastName';
  }

  @override
  List<Object?> get props => [
    id,
    uid,
    phone,
    firstName,
    lastName,
    email,
    updatedAt,
    createdAt,
  ];
}
