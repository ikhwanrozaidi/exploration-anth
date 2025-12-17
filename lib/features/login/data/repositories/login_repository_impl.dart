import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/service/secure_storage_service.dart';
import '../../../../shared/entities/auth_result.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_local_datasource.dart';
import '../datasources/login_remote_datasource.dart';

@LazySingleton(as: LoginRepository)
class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource _remoteDataSource;
  final LoginLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;
  final SecureStorageService _secureStorage;

  LoginRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
    this._secureStorage,
  );

  // ==================== LOGIN ====================

  @override
  Future<Either<Failure, String>> login(String email, String password) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    return await _remoteDataSource.login(email, password);
  }

  // ==================== VERIFY OTP ====================

  @override
  Future<Either<Failure, (AuthResult, User)>> verifyOtp(
    String email,
    String otp,
  ) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    print('📡 Repository: Calling remote datasource verifyOtp...');
    final result = await _remoteDataSource.verifyOtp(email, otp);

    return result.fold(
      (failure) {
        print('❌ Repository: Remote datasource failed - ${failure.message}');
        return Left(failure);
      },
      (data) async {
        final (authResult, user) = data;
        print('✅ Repository: Got data from remote - User: ${user.email}');
        print('💾 Repository: Calling local datasource to store...');

        // ✅ Store BOTH tokens and user
        final storeResult = await _localDataSource.storeAuthResult(
          authResult,
          user,
        );

        storeResult.fold(
          (failure) => print('❌ Repository: Store failed - ${failure.message}'),
          (_) => print('✅ Repository: Store successful'),
        );

        return Right((authResult, user));
      },
    );
  }

  // ==================== FORGOT PASSWORD ====================

  // @override
  // Future<Either<Failure, String>> forgotPassword(String email) async {
  //   final isConnected = await _networkInfo.isConnected;
  //   if (!isConnected) {
  //     return const Left(ConnectionFailure());
  //   }

  //   return await _remoteDataSource.forgotPassword(email);
  // }

  // @override
  // Future<Either<Failure, String>> verifyOtpForgot(
  //   String email,
  //   String otpForgot,
  // ) async {
  //   final isConnected = await _networkInfo.isConnected;
  //   if (!isConnected) {
  //     return const Left(ConnectionFailure());
  //   }

  //   return await _remoteDataSource.verifyOtpForgot(email, otpForgot);
  // }

  // @override
  // Future<Either<Failure, String>> changePassword(
  //   String email,
  //   String newPassword,
  // ) async {
  //   final isConnected = await _networkInfo.isConnected;
  //   if (!isConnected) {
  //     return const Left(ConnectionFailure());
  //   }

  //   return await _remoteDataSource.changePassword(email, newPassword);
  // }

  // ==================== REFRESH TOKEN ====================

  @override
  Future<Either<Failure, (AuthResult, User)>> refreshToken() async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    // Get refresh token from local storage
    final refreshTokenResult = await _localDataSource.getRefreshToken();

    return await refreshTokenResult.fold((failure) => Left(failure), (
      refreshToken,
    ) async {
      if (refreshToken == null || refreshToken.isEmpty) {
        return const Left(CacheFailure('No refresh token found'));
      }

      // Call refresh token API
      // TODO: Implement when backend refresh token endpoint is ready
      return const Left(ServerFailure('Refresh token not implemented'));
    });
  }

  // ==================== LOGOUT ====================

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      // Clear all auth data (tokens + user + credentials)
      await _localDataSource.clearAuthData();

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to logout: ${e.toString()}'));
    }
  }

  // ==================== GET STORED DATA ====================

  @override
  Future<Either<Failure, User?>> getStoredUser() async {
    return await _localDataSource.getStoredUser();
  }

  @override
  Future<Either<Failure, String?>> getAccessToken() async {
    return await _localDataSource.getAccessToken();
  }

  @override
  Future<Either<Failure, String?>> getRefreshToken() async {
    return await _localDataSource.getRefreshToken();
  }

  // ==================== REMEMBER ME ====================

  @override
  Future<Either<Failure, void>> storeLoginCredentials(
    String email,
    String password,
  ) async {
    try {
      await _secureStorage.storeCredentials(email: email, password: password);
      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to store credentials: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Map<String, String>?>> getStoredCredentials() async {
    try {
      final credentials = await _secureStorage.getStoredCredentials();
      return Right(credentials);
    } catch (e) {
      return Left(
        CacheFailure('Failed to get stored credentials: ${e.toString()}'),
      );
    }
  }
}
