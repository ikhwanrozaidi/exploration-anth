// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contractor_company_nested_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractorCompanyNested _$ContractorCompanyNestedFromJson(
  Map<String, dynamic> json,
) => ContractorCompanyNested(
  id: (json['id'] as num?)?.toInt(),
  uid: json['uid'] as String?,
  name: json['name'] as String?,
  regNo: json['regNo'] as String?,
  bumiputera: json['bumiputera'] as bool?,
  einvoiceTinNo: json['einvoiceTinNo'] as String?,
  registrationDate: json['registrationDate'] as String?,
  cidbNo: json['cidbNo'] as String?,
  cidbGrade: json['cidbGrade'] as String?,
  lastCidbSyncAt: json['lastCidbSyncAt'] as String?,
  address: json['address'] as String?,
  postalCode: json['postalCode'] as String?,
  city: json['city'] as String?,
  state: json['state'] as String?,
  country: json['country'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  website: json['website'] as String?,
  defaultBankAcc: json['defaultBankAcc'] as String?,
  defaultBankAccType: json['defaultBankAccType'] as String?,
  companyType: json['companyType'] as String?,
  createdAt: json['createdAt'] as String?,
  updatedAt: json['updatedAt'] as String?,
  deletedAt: json['deletedAt'] as String?,
  ownerID: (json['ownerID'] as num?)?.toInt(),
  status: json['status'] as String?,
  statusReason: json['statusReason'] as String?,
  statusUpdatedAt: json['statusUpdatedAt'] as String?,
  statusUpdatedByID: (json['statusUpdatedByID'] as num?)?.toInt(),
);

Map<String, dynamic> _$ContractorCompanyNestedToJson(
  ContractorCompanyNested instance,
) => <String, dynamic>{
  'id': instance.id,
  'uid': instance.uid,
  'name': instance.name,
  'regNo': instance.regNo,
  'bumiputera': instance.bumiputera,
  'einvoiceTinNo': instance.einvoiceTinNo,
  'registrationDate': instance.registrationDate,
  'cidbNo': instance.cidbNo,
  'cidbGrade': instance.cidbGrade,
  'lastCidbSyncAt': instance.lastCidbSyncAt,
  'address': instance.address,
  'postalCode': instance.postalCode,
  'city': instance.city,
  'state': instance.state,
  'country': instance.country,
  'phone': instance.phone,
  'email': instance.email,
  'website': instance.website,
  'defaultBankAcc': instance.defaultBankAcc,
  'defaultBankAccType': instance.defaultBankAccType,
  'companyType': instance.companyType,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'deletedAt': instance.deletedAt,
  'ownerID': instance.ownerID,
  'status': instance.status,
  'statusReason': instance.statusReason,
  'statusUpdatedAt': instance.statusUpdatedAt,
  'statusUpdatedByID': instance.statusUpdatedByID,
};
