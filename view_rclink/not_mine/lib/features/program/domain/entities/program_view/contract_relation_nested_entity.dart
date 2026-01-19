import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'contractor_company_nested_entity.dart';

part 'contract_relation_nested_entity.g.dart';

@JsonSerializable()
class ContractRelationNested extends Equatable {
  final int? id;
  final String? uid;
  final int? principalCompanyID;
  final int? contractorCompanyID;
  final String? contractNumber;
  final String? description;
  final String? startDate;
  final String? endDate;
  final String? status;
  final String? invitedAt;
  final String? acceptedAt;
  final String? suspendedAt;
  final String? terminatedAt;
  final String? terminationReason;
  final String? rejectedAt;
  final String? rejectionReason;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final int? packageID;
  final int? invitationCodeID;
  final ContractorCompanyNested? contractorCompany;

  const ContractRelationNested({
    this.id,
    this.uid,
    this.principalCompanyID,
    this.contractorCompanyID,
    this.contractNumber,
    this.description,
    this.startDate,
    this.endDate,
    this.status,
    this.invitedAt,
    this.acceptedAt,
    this.suspendedAt,
    this.terminatedAt,
    this.terminationReason,
    this.rejectedAt,
    this.rejectionReason,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.packageID,
    this.invitationCodeID,
    this.contractorCompany,
  });

  factory ContractRelationNested.fromJson(Map<String, dynamic> json) =>
      _$ContractRelationNestedFromJson(json);

  Map<String, dynamic> toJson() => _$ContractRelationNestedToJson(this);

  ContractRelationNested copyWith({
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
    ContractorCompanyNested? contractorCompany,
  }) {
    return ContractRelationNested(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      principalCompanyID: principalCompanyID ?? this.principalCompanyID,
      contractorCompanyID: contractorCompanyID ?? this.contractorCompanyID,
      contractNumber: contractNumber ?? this.contractNumber,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      status: status ?? this.status,
      invitedAt: invitedAt ?? this.invitedAt,
      acceptedAt: acceptedAt ?? this.acceptedAt,
      suspendedAt: suspendedAt ?? this.suspendedAt,
      terminatedAt: terminatedAt ?? this.terminatedAt,
      terminationReason: terminationReason ?? this.terminationReason,
      rejectedAt: rejectedAt ?? this.rejectedAt,
      rejectionReason: rejectionReason ?? this.rejectionReason,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      packageID: packageID ?? this.packageID,
      invitationCodeID: invitationCodeID ?? this.invitationCodeID,
      contractorCompany: contractorCompany ?? this.contractorCompany,
    );
  }

  @override
  List<Object?> get props => [
    id,
    uid,
    principalCompanyID,
    contractorCompanyID,
    contractNumber,
    description,
    startDate,
    endDate,
    status,
    invitedAt,
    acceptedAt,
    suspendedAt,
    terminatedAt,
    terminationReason,
    rejectedAt,
    rejectionReason,
    createdAt,
    updatedAt,
    deletedAt,
    packageID,
    invitationCodeID,
    contractorCompany,
  ];
}
