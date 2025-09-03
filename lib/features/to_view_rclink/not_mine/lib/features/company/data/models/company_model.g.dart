// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) =>
    _CompanyModel(
      id: (json['id'] as num).toInt(),
      uid: json['uid'] as String,
      name: json['name'] as String,
      regNo: json['regNo'] as String,
      cidbNo: json['cidbNo'] as String,
      address: json['address'] as String,
      postalCode: json['postalCode'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      website: json['website'] as String,
      companyType: json['companyType'] as String,
      bumiputera: json['bumiputera'] as bool,
      einvoiceTinNo: json['einvoiceTinNo'] as String?,
      registrationDate: json['registrationDate'] == null
          ? null
          : DateTime.parse(json['registrationDate'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      deletedAt: json['deletedAt'] == null
          ? null
          : DateTime.parse(json['deletedAt'] as String),
      ownerID: (json['ownerID'] as num).toInt(),
      adminRole: json['adminRole'] == null
          ? null
          : AdminRoleModel.fromJson(json['adminRole'] as Map<String, dynamic>),
      adminCount: (json['adminCount'] as num).toInt(),
    );

Map<String, dynamic> _$CompanyModelToJson(_CompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'regNo': instance.regNo,
      'cidbNo': instance.cidbNo,
      'address': instance.address,
      'postalCode': instance.postalCode,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'phone': instance.phone,
      'email': instance.email,
      'website': instance.website,
      'companyType': instance.companyType,
      'bumiputera': instance.bumiputera,
      'einvoiceTinNo': instance.einvoiceTinNo,
      'registrationDate': instance.registrationDate?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'deletedAt': instance.deletedAt?.toIso8601String(),
      'ownerID': instance.ownerID,
      'adminRole': instance.adminRole,
      'adminCount': instance.adminCount,
    };

_AdminRoleModel _$AdminRoleModelFromJson(Map<String, dynamic> json) =>
    _AdminRoleModel(uid: json['uid'] as String, name: json['name'] as String);

Map<String, dynamic> _$AdminRoleModelToJson(_AdminRoleModel instance) =>
    <String, dynamic>{'uid': instance.uid, 'name': instance.name};
