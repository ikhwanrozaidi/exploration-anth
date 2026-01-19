// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_relation_nested_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ContractRelationNestedModel _$ContractRelationNestedModelFromJson(
  Map<String, dynamic> json,
) => _ContractRelationNestedModel(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
  principalCompanyID: (json['principalCompanyID'] as num?)?.toInt(),
  contractorCompanyID: (json['contractorCompanyID'] as num?)?.toInt(),
  contractNumber: json['contractNumber'] as String?,
  description: json['description'] as String?,
  startDate: json['startDate'] as String?,
  endDate: json['endDate'] as String?,
  status: json['status'] as String?,
  invitedAt: json['invitedAt'] as String?,
  acceptedAt: json['acceptedAt'] as String?,
  suspendedAt: json['suspendedAt'] as String?,
  terminatedAt: json['terminatedAt'] as String?,
  terminationReason: json['terminationReason'] as String?,
  rejectedAt: json['rejectedAt'] as String?,
  rejectionReason: json['rejectionReason'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  deletedAt: json['deletedAt'] as String?,
  packageID: (json['packageID'] as num?)?.toInt(),
  invitationCodeID: (json['invitationCodeID'] as num?)?.toInt(),
  contractorCompany: json['contractorCompany'] == null
      ? null
      : ContractorCompanyNestedModel.fromJson(
          json['contractorCompany'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ContractRelationNestedModelToJson(
  _ContractRelationNestedModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'principalCompanyID': instance.principalCompanyID,
  'contractorCompanyID': instance.contractorCompanyID,
  'contractNumber': instance.contractNumber,
  'description': instance.description,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
  'status': instance.status,
  'invitedAt': instance.invitedAt,
  'acceptedAt': instance.acceptedAt,
  'suspendedAt': instance.suspendedAt,
  'terminatedAt': instance.terminatedAt,
  'terminationReason': instance.terminationReason,
  'rejectedAt': instance.rejectedAt,
  'rejectionReason': instance.rejectionReason,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'deletedAt': instance.deletedAt,
  'packageID': instance.packageID,
  'invitationCodeID': instance.invitationCodeID,
  'contractorCompany': instance.contractorCompany,
};
