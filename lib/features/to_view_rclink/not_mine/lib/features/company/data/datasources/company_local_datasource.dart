import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/database/app_database.dart';
import '../../domain/entities/company.dart';

abstract class CompanyLocalDataSource {
  Future<List<Company>?> getCachedCompanies();
  Future<void> cacheCompanies(List<Company> companies);
  Future<void> cacheSelectedCompany(String companyId);
  Future<String?> getSelectedCompany();
  Future<void> clearCache();
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
              createdAt: record.createdAt,
              updatedAt: record.updatedAt,
              deletedAt: record.deletedAt,
              ownerID: record.ownerID,
              adminRole: null, // AdminRole is not stored in Companies table
              adminCount: 0, // AdminCount is not stored in Companies table
            ),
          )
          .toList();

      return companies.isEmpty ? null : companies;
    } catch (e) {
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
                ownerID: Value(company.ownerID),
                createdAt: Value(company.createdAt),
                updatedAt: Value(company.updatedAt),
                deletedAt: Value(company.deletedAt),
              ),
            );
      }
    } catch (e) {
      // Handle silently bcs errors are handled by the repository layer
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
}
