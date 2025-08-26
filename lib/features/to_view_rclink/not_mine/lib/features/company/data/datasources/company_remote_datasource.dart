import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../models/company_model.dart';
import 'company_api_service.dart';

abstract class CompanyRemoteDataSource {
  Future<Either<Failure, List<CompanyModel>>> getMyCompanies();
}

@LazySingleton(as: CompanyRemoteDataSource)
class CompanyRemoteDataSourceImpl implements CompanyRemoteDataSource {
  final CompanyApiService _apiService;

  CompanyRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, List<CompanyModel>>> getMyCompanies() async {
    try {
      final response = await _apiService.getMyCompanies();

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
