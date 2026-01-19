import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contractor_company_nested_entity.g.dart';

@JsonSerializable()
class ContractorCompanyNested extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? regNo;
  final bool? bumiputera;
  final String? einvoiceTinNo;
  final String? registrationDate;
  final String? cidbNo;
  final String? cidbGrade;
  final String? lastCidbSyncAt;
  final String? address;
  final String? postalCode;
  final String? city;
  final String? state;
  final String? country;
  final String? phone;
  final String? email;
  final String? website;
  final String? defaultBankAcc;
  final String? defaultBankAccType;
  final String? companyType;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int? ownerID;
  final String? status;
  final String? statusReason;
  final String? statusUpdatedAt;
  final int? statusUpdatedByID;

  const ContractorCompanyNested({
    this.id,
    this.uid,
    this.name,
    this.regNo,
    this.bumiputera,
    this.einvoiceTinNo,
    this.registrationDate,
    this.cidbNo,
    this.cidbGrade,
    this.lastCidbSyncAt,
    this.address,
    this.postalCode,
    this.city,
    this.state,
    this.country,
    this.phone,
    this.email,
    this.website,
    this.defaultBankAcc,
    this.defaultBankAccType,
    this.companyType,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.ownerID,
    this.status,
    this.statusReason,
    this.statusUpdatedAt,
    this.statusUpdatedByID,
  });

  factory ContractorCompanyNested.fromJson(Map<String, dynamic> json) =>
      _$ContractorCompanyNestedFromJson(json);

  Map<String, dynamic> toJson() => _$ContractorCompanyNestedToJson(this);

  ContractorCompanyNested copyWith({
    int? id,
    String? uid,
    String? name,
    String? regNo,
    bool? bumiputera,
    String? einvoiceTinNo,
    String? registrationDate,
    String? cidbNo,
    String? cidbGrade,
    String? lastCidbSyncAt,
    String? address,
    String? postalCode,
    String? city,
    String? state,
    String? country,
    String? phone,
    String? email,
    String? website,
    String? defaultBankAcc,
    String? defaultBankAccType,
    String? companyType,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    int? ownerID,
    String? status,
    String? statusReason,
    String? statusUpdatedAt,
    int? statusUpdatedByID,
  }) {
    return ContractorCompanyNested(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      regNo: regNo ?? this.regNo,
      bumiputera: bumiputera ?? this.bumiputera,
      einvoiceTinNo: einvoiceTinNo ?? this.einvoiceTinNo,
      registrationDate: registrationDate ?? this.registrationDate,
      cidbNo: cidbNo ?? this.cidbNo,
      cidbGrade: cidbGrade ?? this.cidbGrade,
      lastCidbSyncAt: lastCidbSyncAt ?? this.lastCidbSyncAt,
      address: address ?? this.address,
      postalCode: postalCode ?? this.postalCode,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      website: website ?? this.website,
      defaultBankAcc: defaultBankAcc ?? this.defaultBankAcc,
      defaultBankAccType: defaultBankAccType ?? this.defaultBankAccType,
      companyType: companyType ?? this.companyType,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      ownerID: ownerID ?? this.ownerID,
      status: status ?? this.status,
      statusReason: statusReason ?? this.statusReason,
      statusUpdatedAt: statusUpdatedAt ?? this.statusUpdatedAt,
      statusUpdatedByID: statusUpdatedByID ?? this.statusUpdatedByID,
    );
  }

  @override
  List<Object?> get props => [
    id,
    uid,
    name,
    regNo,
    bumiputera,
    einvoiceTinNo,
    registrationDate,
    cidbNo,
    cidbGrade,
    lastCidbSyncAt,
    address,
    postalCode,
    city,
    state,
    country,
    phone,
    email,
    website,
    defaultBankAcc,
    defaultBankAccType,
    companyType,
    createdAt,
    updatedAt,
    deletedAt,
    ownerID,
    status,
    statusReason,
    statusUpdatedAt,
    statusUpdatedByID,
  ];
}
