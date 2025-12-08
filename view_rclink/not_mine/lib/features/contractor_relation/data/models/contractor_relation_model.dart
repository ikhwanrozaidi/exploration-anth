import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/contractor_relation_entity.dart';

part 'contractor_relation_model.freezed.dart';
part 'contractor_relation_model.g.dart';

@freezed
abstract class ContractorRelationModel with _$ContractorRelationModel {
  const ContractorRelationModel._();

  const factory ContractorRelationModel({
    required int id,
    required String uid,
    required String name,
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
    String? defaultBankAcc,
    String? defaultBankAccType,
    bool? isSelf,
    String? contractRelationUID,
    String? relationStatus,
    String? relationRole,
  }) = _ContractorRelationModel;

  factory ContractorRelationModel.fromJson(Map<String, dynamic> json) =>
      _$ContractorRelationModelFromJson(json);

  ContractorRelation toEntity() {
    return ContractorRelation(
      id: id,
      uid: uid,
      name: name,
      regNo: regNo,
      cidbNo: cidbNo,
      address: address,
      postalCode: postalCode,
      city: city,
      state: state,
      country: country,
      phone: phone,
      email: email,
      website: website,
      companyType: companyType,
      bumiputera: bumiputera,
      einvoiceTinNo: einvoiceTinNo,
      registrationDate: registrationDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      ownerID: ownerID,
      defaultBankAcc: defaultBankAcc,
      defaultBankAccType: defaultBankAccType,
      isSelf: isSelf,
      contractRelationUID: contractRelationUID,
      relationStatus: relationStatus,
      relationRole: relationRole,
    );
  }

  factory ContractorRelationModel.fromEntity(ContractorRelation entity) {
    return ContractorRelationModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      regNo: entity.regNo,
      cidbNo: entity.cidbNo,
      address: entity.address,
      postalCode: entity.postalCode,
      city: entity.city,
      state: entity.state,
      country: entity.country,
      phone: entity.phone,
      email: entity.email,
      website: entity.website,
      companyType: entity.companyType,
      bumiputera: entity.bumiputera,
      einvoiceTinNo: entity.einvoiceTinNo,
      registrationDate: entity.registrationDate,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
      ownerID: entity.ownerID,
      defaultBankAcc: entity.defaultBankAcc,
      defaultBankAccType: entity.defaultBankAccType,
      isSelf: entity.isSelf,
      contractRelationUID: entity.contractRelationUID,
      relationStatus: entity.relationStatus,
      relationRole: entity.relationRole,
    );
  }
}
