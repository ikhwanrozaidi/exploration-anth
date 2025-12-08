import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contractor_relation_entity.g.dart';

@JsonSerializable()
class ContractorRelation extends Equatable {
  final int id;
  final String uid;
  final String name;
  final String? regNo;
  final String? cidbNo;
  final String? address;
  final String? postalCode;
  final String? city;
  final String? state;
  final String? country;
  final String? phone;
  final String? email;
  final String? website;
  final String? companyType;
  final bool? bumiputera;
  final String? einvoiceTinNo;
  final DateTime? registrationDate;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final int? ownerID;
  final String? defaultBankAcc;
  final String? defaultBankAccType;
  final bool? isSelf;
  final String? contractRelationUID;
  final String? relationStatus;
  final String? relationRole;

  const ContractorRelation({
    required this.id,
    required this.uid,
    required this.name,
    this.regNo,
    this.cidbNo,
    this.address,
    this.postalCode,
    this.city,
    this.state,
    this.country,
    this.phone,
    this.email,
    this.website,
    this.companyType,
    this.bumiputera,
    this.einvoiceTinNo,
    this.registrationDate,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.ownerID,
    this.defaultBankAcc,
    this.defaultBankAccType,
    this.isSelf,
    this.contractRelationUID,
    this.relationStatus,
    this.relationRole,
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
    defaultBankAcc,
    defaultBankAccType,
    isSelf,
    contractRelationUID,
    relationStatus,
    relationRole,
  ];

  factory ContractorRelation.fromJson(Map<String, dynamic> json) =>
      _$ContractorRelationFromJson(json);

  Map<String, dynamic> toJson() => _$ContractorRelationToJson(this);
}
