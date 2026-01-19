import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/program_view/contractor_company_nested_entity.dart';

part 'contractor_company_nested_model.freezed.dart';
part 'contractor_company_nested_model.g.dart';

@freezed
abstract class ContractorCompanyNestedModel
    with _$ContractorCompanyNestedModel {
  const factory ContractorCompanyNestedModel({
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
  }) = _ContractorCompanyNestedModel;

  factory ContractorCompanyNestedModel.fromJson(Map<String, dynamic> json) =>
      _$ContractorCompanyNestedModelFromJson(json);
}

extension ContractorCompanyNestedModelX on ContractorCompanyNestedModel {
  ContractorCompanyNested toEntity() {
    return ContractorCompanyNested(
      id: id,
      uid: uid,
      name: name,
      regNo: regNo,
      bumiputera: bumiputera,
      einvoiceTinNo: einvoiceTinNo,
      registrationDate: registrationDate,
      cidbNo: cidbNo,
      cidbGrade: cidbGrade,
      lastCidbSyncAt: lastCidbSyncAt,
      address: address,
      postalCode: postalCode,
      city: city,
      state: state,
      country: country,
      phone: phone,
      email: email,
      website: website,
      defaultBankAcc: defaultBankAcc,
      defaultBankAccType: defaultBankAccType,
      companyType: companyType,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      ownerID: ownerID,
      status: status,
      statusReason: statusReason,
      statusUpdatedAt: statusUpdatedAt,
      statusUpdatedByID: statusUpdatedByID,
    );
  }

  static ContractorCompanyNestedModel fromEntity(
    ContractorCompanyNested entity,
  ) {
    return ContractorCompanyNestedModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      regNo: entity.regNo,
      bumiputera: entity.bumiputera,
      einvoiceTinNo: entity.einvoiceTinNo,
      registrationDate: entity.registrationDate,
      cidbNo: entity.cidbNo,
      cidbGrade: entity.cidbGrade,
      lastCidbSyncAt: entity.lastCidbSyncAt,
      address: entity.address,
      postalCode: entity.postalCode,
      city: entity.city,
      state: entity.state,
      country: entity.country,
      phone: entity.phone,
      email: entity.email,
      website: entity.website,
      defaultBankAcc: entity.defaultBankAcc,
      defaultBankAccType: entity.defaultBankAccType,
      companyType: entity.companyType,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
      ownerID: entity.ownerID,
      status: entity.status,
      statusReason: entity.statusReason,
      statusUpdatedAt: entity.statusUpdatedAt,
      statusUpdatedByID: entity.statusUpdatedByID,
    );
  }
}
