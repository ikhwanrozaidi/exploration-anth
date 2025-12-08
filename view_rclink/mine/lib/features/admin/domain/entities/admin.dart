import 'package:equatable/equatable.dart';

class Admin extends Equatable {
  final int id;
  final String uid;
  final String phone;
  final String? firstName;
  final String? lastName;
  final String? email;
  final DateTime updatedAt;
  final DateTime createdAt;

  const Admin({
    required this.id,
    required this.uid,
    required this.phone,
    this.firstName,
    this.lastName,
    this.email,
    required this.updatedAt,
    required this.createdAt,
  });

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

  Admin copyWith({
    int? id,
    String? uid,
    String? phone,
    String? firstName,
    String? lastName,
    String? email,
    DateTime? updatedAt,
    DateTime? createdAt,
  }) {
    return Admin(
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
    final parts = [
      firstName,
      lastName,
    ].where((part) => part?.isNotEmpty == true);
    return parts.isEmpty ? 'Unknown' : parts.join(' ');
  }

  String get displayName => fullName != 'Unknown' ? fullName : phone;
}
