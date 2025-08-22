import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../../../core/errors/failures.dart';
import '../models/company_model.dart';

abstract class CompanyLocalDataSource {
  Future<Either<Failure, List<CompanyModel>>> getCachedCompanies();
  Future<Either<Failure, void>> cacheCompanies(List<CompanyModel> companies);
  Future<Either<Failure, void>> cacheSelectedCompany(String companyId);
  Future<Either<Failure, String?>> getSelectedCompany();
  Future<Either<Failure, void>> clearCache();
}

@LazySingleton(as: CompanyLocalDataSource)
class CompanyLocalDataSourceImpl implements CompanyLocalDataSource {
  static const String _companiesKey = 'cached_companies';
  static const String _selectedCompanyKey = 'selected_company_id';

  @override
  Future<Either<Failure, List<CompanyModel>>> getCachedCompanies() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final companiesJson = prefs.getString(_companiesKey);

      if (companiesJson == null) {
        return const Right([]);
      }

      final List<dynamic> companiesList = json.decode(companiesJson);
      final companies = companiesList
          .map((json) => CompanyModel.fromJson(json))
          .toList();

      return Right(companies);
    } catch (e) {
      return Left(
        CacheFailure('Failed to get cached companies: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> cacheCompanies(
    List<CompanyModel> companies,
  ) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final companiesJson = json.encode(
        companies.map((company) => company.toJson()).toList(),
      );
      await prefs.setString(_companiesKey, companiesJson);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to cache companies: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> cacheSelectedCompany(String companyId) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString(_selectedCompanyKey, companyId);
      return const Right(null);
    } catch (e) {
      return Left(
        CacheFailure('Failed to cache selected company: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, String?>> getSelectedCompany() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final companyId = prefs.getString(_selectedCompanyKey);
      return Right(companyId);
    } catch (e) {
      return Left(
        CacheFailure('Failed to get selected company: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failure, void>> clearCache() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_companiesKey);
      await prefs.remove(_selectedCompanyKey);
      return const Right(null);
    } catch (e) {
      return Left(
        CacheFailure('Failed to clear company cache: ${e.toString()}'),
      );
    }
  }
}
