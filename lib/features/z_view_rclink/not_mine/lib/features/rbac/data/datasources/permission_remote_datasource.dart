import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rclink_app/features/rbac/data/datasources/role_api_service.dart';

import '../../../../core/errors/failures.dart';
import '../models/role_model.dart';

abstract class PermissionRemoteDataSource {
  Future<Either<Failure, RoleModel>> getRole(String roleUID);
}

@LazySingleton(as: PermissionRemoteDataSource)
class PermissionRemoteDataSourceImpl implements PermissionRemoteDataSource {
  final RoleApiService _roleApiService;

  PermissionRemoteDataSourceImpl(this._roleApiService);

  @override
  Future<Either<Failure, RoleModel>> getRole(String roleUID) async {
    try {
      final response = await _roleApiService.getRole(roleUID);

      if (response.isSuccess && response.data != null) {
        return Right(response.data!);
      } else {
        return Left(
          ServerFailure(response.message, statusCode: response.statusCode),
        );
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        return const Left(NotFoundFailure());
      }
      if (e.response?.statusCode == 401) {
        return const Left(UnauthorizedFailure());
      }
      return Left(NetworkFailure('Network error: ${e.message}'));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: $e'));
    }
  }
}
