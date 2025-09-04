import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/company.dart';
import '../models/company_model.dart';

abstract class CompanyLocalDataSource {
  Future<List<Company>?> getCachedCompanies();
  Future<void> cacheCompanies(List<Company> companies);
  Future<void> cacheSelectedCompany(String companyId);
  Future<String?> getSelectedCompany();
  Future<void> clearCache();
  Future<void> cacheCompany(Company company);
}

@LazySingleton(as: CompanyLocalDataSource)
class CompanyLocalDataSourceImpl implements CompanyLocalDataSource {
  final DatabaseService _databaseService;
  static const String _selectedCompanyKey = 'selected_company_id';

  CompanyLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<List<Company>?> getCachedCompanies() async {
    try {
      final companyRecords = await _database.select(_database.companies).get();

      if (companyRecords.isEmpty) {
        return null;
      }

      // Convert database records to domain entities
      final companies = companyRecords
          .map(
            (record) => Company(
              id: record.id,
              uid: record.uid,
              name: record.name,
              regNo: record.regNo ?? '',
              cidbNo: record.cidbNo ?? '',
              address: record.address ?? '',
              postalCode: record.postalCode ?? '',
              city: record.city ?? '',
              state: record.state ?? '',
              country: record.country ?? '',
              phone: record.phone ?? '',
              email: record.email ?? '',
              website: record.website ?? '',
              companyType: record.companyType,
              bumiputera: record.bumiputera,
              einvoiceTinNo: record.einvoiceTinNo,
              registrationDate: record.registrationDate,
              createdAt: record.createdAt,
              updatedAt: record.updatedAt,
              deletedAt: record.deletedAt,
              ownerID: record.ownerID,
              // Convert adminRole from stored fields
              adminRole:
                  (record.adminRoleUid != null && record.adminRoleName != null)
                  ? AdminRole(
                      uid: record.adminRoleUid!,
                      name: record.adminRoleName!,
                    )
                  : null,
              adminCount:
                  0, // AdminCount is not stored, could be computed or fetched separately
            ),
          )
          .toList();

      return companies.isEmpty ? null : companies;
    } catch (e) {
      print('Error loading cached companies: $e');
      return null;
    }
  }

  @override
  Future<void> cacheCompanies(List<Company> companies) async {
    try {
      // Clear existing companies
      await _database.delete(_database.companies).go();

      // Insert new companies
      for (final company in companies) {
        await _database
            .into(_database.companies)
            .insert(
              CompaniesCompanion(
                uid: Value(company.uid),
                name: Value(company.name),
                regNo: Value(company.regNo.isNotEmpty ? company.regNo : null),
                cidbNo: Value(
                  company.cidbNo.isNotEmpty ? company.cidbNo : null,
                ),
                address: Value(
                  company.address.isNotEmpty ? company.address : null,
                ),
                postalCode: Value(
                  company.postalCode.isNotEmpty ? company.postalCode : null,
                ),
                city: Value(company.city.isNotEmpty ? company.city : null),
                state: Value(company.state.isNotEmpty ? company.state : null),
                country: Value(
                  company.country.isNotEmpty ? company.country : null,
                ),
                phone: Value(company.phone.isNotEmpty ? company.phone : null),
                email: Value(company.email.isNotEmpty ? company.email : null),
                website: Value(
                  company.website.isNotEmpty ? company.website : null,
                ),
                companyType: Value(company.companyType),
                bumiputera: Value(company.bumiputera),
                einvoiceTinNo: Value(company.einvoiceTinNo),
                registrationDate: Value(company.registrationDate),
                ownerID: Value(company.ownerID),
                adminRoleUid: Value(company.adminRole?.uid),
                adminRoleName: Value(company.adminRole?.name),
                createdAt: Value(company.createdAt),
                updatedAt: Value(company.updatedAt),
                deletedAt: Value(company.deletedAt),
              ),
            );
      }
    } catch (e) {
      print('Error caching companies: $e');
    }
  }

  @override
  Future<void> cacheSelectedCompany(String companyId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_selectedCompanyKey, companyId);
    } catch (e) {
      // Handle silently
    }
  }

  @override
  Future<String?> getSelectedCompany() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return prefs.getString(_selectedCompanyKey);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> clearCache() async {
    try {
      // Delete all companies from database
      await _database.delete(_database.companies).go();

      // Clear selected company from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_selectedCompanyKey);
    } catch (e) {
      // Handle silently
    }
  }

  @override
  Future<void> cacheCompany(Company company) async {
    try {
      // Use insertOnConflictUpdate to update if exists, insert if not
      await _database
          .into(_database.companies)
          .insertOnConflictUpdate(
            CompaniesCompanion(
              uid: Value(company.uid),
              name: Value(company.name),
              regNo: Value(company.regNo.isNotEmpty ? company.regNo : null),
              cidbNo: Value(company.cidbNo.isNotEmpty ? company.cidbNo : null),
              address: Value(
                company.address.isNotEmpty ? company.address : null,
              ),
              postalCode: Value(
                company.postalCode.isNotEmpty ? company.postalCode : null,
              ),
              city: Value(company.city.isNotEmpty ? company.city : null),
              state: Value(company.state.isNotEmpty ? company.state : null),
              country: Value(
                company.country.isNotEmpty ? company.country : null,
              ),
              phone: Value(company.phone.isNotEmpty ? company.phone : null),
              email: Value(company.email.isNotEmpty ? company.email : null),
              website: Value(
                company.website.isNotEmpty ? company.website : null,
              ),
              companyType: Value(company.companyType),
              bumiputera: Value(company.bumiputera),
              einvoiceTinNo: Value(company.einvoiceTinNo),
              registrationDate: Value(company.registrationDate),
              ownerID: Value(company.ownerID),
              adminRoleUid: Value(company.adminRole?.uid),
              adminRoleName: Value(company.adminRole?.name),
              createdAt: Value(company.createdAt),
              updatedAt: Value(company.updatedAt),
              deletedAt: Value(company.deletedAt),
            ),
          );
    } catch (e) {
      print('Error caching company: $e');
    }
  }
}
