import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/database/app_database.dart';
import '../models/company_model.dart';
import '../models/company_model_extensions.dart';

abstract class CompanyLocalDataSource {
  Future<List<CompanyModel>?> getCachedCompanies();
  Future<void> cacheCompanies(List<CompanyModel> companies);
  Future<void> cacheSelectedCompany(String companyId);
  Future<String?> getSelectedCompany();
  Future<void> clearCache();
  Future<void> cacheCompany(CompanyModel company);
}

@LazySingleton(as: CompanyLocalDataSource)
class CompanyLocalDataSourceImpl implements CompanyLocalDataSource {
  final DatabaseService _databaseService;
  static const String _selectedCompanyKey = 'selected_company_id';

  CompanyLocalDataSourceImpl(this._databaseService);

  AppDatabase get _database => _databaseService.database;

  @override
  Future<List<CompanyModel>?> getCachedCompanies() async {
    try {
      final companyRecords = await _database.select(_database.companies).get();

      if (companyRecords.isEmpty) {
        return null;
      }

      // Convert database records to models
      final companies = companyRecords
          .map((record) => record.toModel())
          .toList();

      return companies.isEmpty ? null : companies;
    } catch (e) {
      print('Error loading cached companies: $e');
      return null;
    }
  }

  @override
  Future<void> cacheCompanies(List<CompanyModel> companies) async {
    try {
      // Clear existing companies
      await _database.delete(_database.companies).go();

      // Insert new companies
      for (final company in companies) {
        await _database.into(_database.companies).insert(company.toCompanion());
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
  Future<void> cacheCompany(CompanyModel company) async {
    try {
      // Use insertOnConflictUpdate to update if exists, insert if not
      await _database
          .into(_database.companies)
          .insertOnConflictUpdate(company.toCompanion());
    } catch (e) {
      print('Error caching company: $e');
    }
  }
}
