import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../admin/domain/entities/admin.dart';
import '../entities/auth_result.dart';

abstract class LoginRepository {
  Future<Either<Failure, (AuthResult, Admin)>> login(String email, String password);
  Future<Either<Failure, (AuthResult, Admin)>> refreshToken();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, Admin?>> getStoredAdmin();
  Future<Either<Failure, String?>> getAccessToken();
  Future<Either<Failure, String?>> getRefreshToken();
}