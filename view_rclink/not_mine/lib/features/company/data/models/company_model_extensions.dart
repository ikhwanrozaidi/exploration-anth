import 'package:drift/drift.dart';
import '../../../../core/database/app_database.dart';
import 'company_model.dart';

/// Extension to add database methods to CompanyModel
extension CompanyModelDatabaseX on CompanyModel {
  /// Convert CompanyModel to CompanyRecord database entity
  CompanyRecord toRecord() {
    return CompanyRecord(
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
      ownerID: ownerID,
      defaultBankAcc: defaultBankAcc,
      defaultBankAccType: defaultBankAccType,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      adminRoleUid: adminRole?.uid,
      adminRoleName: adminRole?.name,
      bumiputera: bumiputera,
      einvoiceTinNo: einvoiceTinNo,
      registrationDate: registrationDate,
    );
  }

  /// Create a database insertable for this company model
  CompaniesCompanion toCompanion() {
    return CompaniesCompanion.insert(
      uid: uid,
      name: name,
      regNo: Value(regNo),
      cidbNo: Value(cidbNo),
      address: Value(address),
      postalCode: Value(postalCode),
      city: Value(city),
      state: Value(state),
      country: Value(country),
      phone: Value(phone),
      email: Value(email),
      website: Value(website),
      companyType: companyType,
      ownerID: ownerID,
      defaultBankAcc: Value(defaultBankAcc),
      defaultBankAccType: Value(defaultBankAccType),
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: Value(deletedAt),
      adminRoleUid: Value(adminRole?.uid),
      adminRoleName: Value(adminRole?.name),
      bumiputera: Value(bumiputera),
      einvoiceTinNo: Value(einvoiceTinNo),
      registrationDate: Value(registrationDate),
    );
  }
}

/// Extension to convert CompanyRecord database entity to CompanyModel
extension CompanyRecordToModel on CompanyRecord {
  CompanyModel toModel() {
    return CompanyModel(
      id: id,
      uid: uid,
      name: name,
      regNo: regNo ?? '',
      cidbNo: cidbNo ?? '',
      address: address ?? '',
      postalCode: postalCode ?? '',
      city: city ?? '',
      state: state ?? '',
      country: country ?? '',
      phone: phone ?? '',
      email: email ?? '',
      website: website,
      companyType: companyType,
      bumiputera: bumiputera,
      einvoiceTinNo: einvoiceTinNo,
      registrationDate: registrationDate,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      ownerID: ownerID,
      adminRole: adminRoleUid != null && adminRoleName != null
          ? AdminRoleModel(uid: adminRoleUid!, name: adminRoleName!)
          : null,
      adminCount: 0, // Not stored in database
      defaultBankAcc: defaultBankAcc,
      defaultBankAccType: defaultBankAccType,
    );
  }
}
