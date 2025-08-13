// lib/features/auth/domain/repositories/login_repository.dart
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../admin/domain/entities/admin.dart';
import '../entities/auth_result.dart';

abstract class LoginRepository {
  // Login returns a message (OTP sent confirmation)
  Future<Either<Failure, String>> login(String email, String password);
  
  // Verify OTP returns AuthResult and Admin (complete login)
  Future<Either<Failure, (AuthResult, Admin)>> verifyOtp(String email, String otp);
  
  // Refresh token
  Future<Either<Failure, (AuthResult, Admin)>> refreshToken();
  
  // Logout
  Future<Either<Failure, void>> logout();
  
  // Get stored data
  Future<Either<Failure, Admin?>> getStoredAdmin();
  Future<Either<Failure, String?>> getAccessToken();
  Future<Either<Failure, String?>> getRefreshToken();
  
  // Forgot password functionality
  Future<Either<Failure, String>> forgotPassword(String email);
  Future<Either<Failure, String>> verifyOtpForgot(String email, String otpForgot);
  Future<Either<Failure, String>> changePassword(String email, String newPassword);
  
  // Remember me functionality
  Future<Either<Failure, void>> storeLoginCredentials(String email, String password);
  Future<Either<Failure, Map<String, String>?>> getStoredCredentials();
}