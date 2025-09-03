import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company extends Equatable {
  final int id;
  final String uid;
  final String name;
  final String regNo;
  final String cidbNo;
  final String address;
  final String postalCode;
  final String city;
  final String state;
  final String country;
  final String phone;
  final String email;
  final String website;
  final String companyType;
  final bool bumiputera;
  final String? einvoiceTinNo;
  final DateTime? registrationDate;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int ownerID;
  final AdminRole? adminRole;
  final int adminCount;

  const Company({
    required this.id,
    required this.uid,
    required this.name,
    required this.regNo,
    required this.cidbNo,
    required this.address,
    required this.postalCode,
    required this.city,
    required this.state,
    required this.country,
    required this.phone,
    required this.email,
    required this.website,
    required this.companyType,
    required this.bumiputera,
    this.einvoiceTinNo,
    this.registrationDate,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.ownerID,
    this.adminRole,
    required this.adminCount,
  });

  @override
  List<Object?> get props => [
    id,
    uid,
    name,
    regNo,
    cidbNo,
    address,
    postalCode,
    city,
    state,
    country,
    phone,
    email,
    website,
    companyType,
    bumiputera,
    einvoiceTinNo,
    registrationDate,
    createdAt,
    updatedAt,
    deletedAt,
    ownerID,
    adminRole,
    adminCount,
  ];

  Company copyWith({
    int? id,
    String? uid,
    String? name,
    String? regNo,
    String? cidbNo,
    String? address,
    String? postalCode,
    String? city,
    String? state,
    String? country,
    String? phone,
    String? email,
    String? website,
    String? companyType,
    bool? bumiputera,
    String? einvoiceTinNo,
    DateTime? registrationDate,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    int? ownerID,
    AdminRole? adminRole,
    int? adminCount,
  }) {
    return Company(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      regNo: regNo ?? this.regNo,
      cidbNo: cidbNo ?? this.cidbNo,
      address: address ?? this.address,
      postalCode: postalCode ?? this.postalCode,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      website: website ?? this.website,
      companyType: companyType ?? this.companyType,
      bumiputera: bumiputera ?? this.bumiputera,
      einvoiceTinNo: einvoiceTinNo ?? this.einvoiceTinNo,
      registrationDate: registrationDate ?? this.registrationDate,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      ownerID: ownerID ?? this.ownerID,
      adminRole: adminRole ?? this.adminRole,
      adminCount: adminCount ?? this.adminCount,
    );
  }

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable()
class AdminRole extends Equatable {
  final String uid;
  final String name;

  const AdminRole({required this.uid, required this.name});

  @override
  List<Object?> get props => [uid, name];

  AdminRole copyWith({String? uid, String? name}) {
    return AdminRole(uid: uid ?? this.uid, name: name ?? this.name);
  }

  factory AdminRole.fromJson(Map<String, dynamic> json) =>
      _$AdminRoleFromJson(json);
  Map<String, dynamic> toJson() => _$AdminRoleToJson(this);
}
