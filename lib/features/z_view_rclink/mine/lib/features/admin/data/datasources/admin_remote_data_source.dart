import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../models/admin_model.dart';
import 'admin_api_service.dart';

abstract class AdminRemoteDataSource {
  Future<Either<Failure, AdminModel>> getCurrentAdmin();
  Future<Either<Failure, AdminModel>> updateAdmin(Map<String, dynamic> data);
}

@LazySingleton(as: AdminRemoteDataSource)
class AdminRemoteDataSourceImpl implements AdminRemoteDataSource {
  final AdminApiService _apiService;

  AdminRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, AdminModel>> getCurrentAdmin() async {
    try {
      final response = await _apiService.getCurrentAdmin();
      
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

  @override
  Future<Either<Failure, AdminModel>> updateAdmin(Map<String, dynamic> data) async {
    try {
      final response = await _apiService.updateAdmin(data: data);
      
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