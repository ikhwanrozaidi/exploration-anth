import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/program_view/contract_relation_nested_entity.dart';
import 'contractor_company_nested_model.dart';

part 'contract_relation_nested_model.freezed.dart';
part 'contract_relation_nested_model.g.dart';

@freezed
abstract class ContractRelationNestedModel with _$ContractRelationNestedModel {
  const factory ContractRelationNestedModel({
    int? id,
    String? uid,
    int? principalCompanyID,
    int? contractorCompanyID,
    String? contractNumber,
    String? description,
    String? startDate,
    String? endDate,
    String? status,
    String? invitedAt,
    String? acceptedAt,
    String? suspendedAt,
    String? terminatedAt,
    String? terminationReason,
    String? rejectedAt,
    String? rejectionReason,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    int? packageID,
    int? invitationCodeID,
    ContractorCompanyNestedModel? contractorCompany,
  }) = _ContractRelationNestedModel;

  factory ContractRelationNestedModel.fromJson(Map<String, dynamic> json) =>
      _$ContractRelationNestedModelFromJson(json);
}

extension ContractRelationNestedModelX on ContractRelationNestedModel {
  ContractRelationNested toEntity() {
    return ContractRelationNested(
      id: id,
      uid: uid,
      principalCompanyID: principalCompanyID,
      contractorCompanyID: contractorCompanyID,
      contractNumber: contractNumber,
      description: description,
      startDate: startDate,
      endDate: endDate,
      status: status,
      invitedAt: invitedAt,
      acceptedAt: acceptedAt,
      suspendedAt: suspendedAt,
      terminatedAt: terminatedAt,
      terminationReason: terminationReason,
      rejectedAt: rejectedAt,
      rejectionReason: rejectionReason,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      packageID: packageID,
      invitationCodeID: invitationCodeID,
      contractorCompany: contractorCompany?.toEntity(),
    );
  }

  static ContractRelationNestedModel fromEntity(ContractRelationNested entity) {
    return ContractRelationNestedModel(
      id: entity.id,
      uid: entity.uid,
      principalCompanyID: entity.principalCompanyID,
      contractorCompanyID: entity.contractorCompanyID,
      contractNumber: entity.contractNumber,
      description: entity.description,
      startDate: entity.startDate,
      endDate: entity.endDate,
      status: entity.status,
      invitedAt: entity.invitedAt,
      acceptedAt: entity.acceptedAt,
      suspendedAt: entity.suspendedAt,
      terminatedAt: entity.terminatedAt,
      terminationReason: entity.terminationReason,
      rejectedAt: entity.rejectedAt,
      rejectionReason: entity.rejectionReason,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
      packageID: entity.packageID,
      invitationCodeID: entity.invitationCodeID,
      contractorCompany: entity.contractorCompany != null
          ? ContractorCompanyNestedModelX.fromEntity(entity.contractorCompany!)
          : null,
    );
  }
}
