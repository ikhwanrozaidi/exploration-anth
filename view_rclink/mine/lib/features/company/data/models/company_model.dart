import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/company.dart';

part 'company_model.freezed.dart';
part 'company_model.g.dart';

@freezed
abstract class CompanyModel with _$CompanyModel {
  const CompanyModel._();

  const factory CompanyModel({
    required int id,
    required String uid,
    required String name,
    required String regNo,
    required String cidbNo,
    required String address,
    required String postalCode,
    required String city,
    required String state,
    required String country,
    required String phone,
    required String email,
    String? website,
    required String companyType,
    required bool bumiputera,
    String? einvoiceTinNo,
    DateTime? registrationDate,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    required int ownerID,
    AdminRoleModel? adminRole,
    int? adminCount,
    String? defaultBankAcc,
    String? defaultBankAccType,
  }) = _CompanyModel;

  factory CompanyModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyModelFromJson(json);

  // Convert model to entity
  Company toEntity() {
    return Company(
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
      website: website ?? '',
      companyType: companyType,
      bumiputera: bumiputera,
      einvoiceTinNo: einvoiceTinNo,
      registrationDate: registrationDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      ownerID: ownerID,
      adminRole: adminRole?.toEntity(),
      adminCount: adminCount ?? 0,
      defaultBankAcc: defaultBankAcc,
      defaultBankAccType: defaultBankAccType,
    );
  }

  // Create model from entity
  factory CompanyModel.fromEntity(Company entity) {
    return CompanyModel(
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
      adminRole: entity.adminRole != null
          ? AdminRoleModel.fromEntity(entity.adminRole!)
          : null,
      adminCount: entity.adminCount,
      defaultBankAcc: entity.defaultBankAcc,
      defaultBankAccType: entity.defaultBankAccType,
    );
  }
}

@freezed
abstract class AdminRoleModel with _$AdminRoleModel {
  const AdminRoleModel._();

  const factory AdminRoleModel({required String uid, required String name}) =
      _AdminRoleModel;

  factory AdminRoleModel.fromJson(Map<String, dynamic> json) =>
      _$AdminRoleModelFromJson(json);

  // Convert model to entity
  AdminRole toEntity() {
    return AdminRole(uid: uid, name: name);
  }

  // Create model from entity
  factory AdminRoleModel.fromEntity(AdminRole entity) {
    return AdminRoleModel(uid: entity.uid, name: entity.name);
  }
}
