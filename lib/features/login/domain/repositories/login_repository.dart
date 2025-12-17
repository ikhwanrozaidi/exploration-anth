import 'package:dartz/dartz.dart';
import 'package:gatepay_app/features/login/domain/entities/user.dart';
import '../../../../core/errors/failures.dart';
import '../../../../shared/entities/auth_result.dart';

abstract class LoginRepository {
  Future<Either<Failure, String>> login(String email, String password);
  Future<Either<Failure, (AuthResult, User)>> verifyOtp(
    String email,
    String otp,
  );
  Future<Either<Failure, (AuthResult, User)>> refreshToken();
  Future<Either<Failure, void>> logout();
  Future<Either<Failure, User?>> getStoredUser();
  Future<Either<Failure, String?>> getAccessToken();
  Future<Either<Failure, String?>> getRefreshToken();

  /// Not yet have the apis...
  ///
  // Forgot password functionality
  // Future<Either<Failure, String>> forgotPassword(String email);
  // Future<Either<Failure, String>> verifyOtpForgot(
  //   String email,
  //   String otpForgot,
  // );
  // Future<Either<Failure, String>> changePassword(
  //   String email,
  //   String newPassword,
  // );

  Future<Either<Failure, void>> storeLoginCredentials(
    String email,
    String password,
  );
  Future<Either<Failure, Map<String, String>?>> getStoredCredentials();
}
