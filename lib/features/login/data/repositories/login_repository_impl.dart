// lib/features/auth/data/repositories/login_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:gatepay_app/core/service/secure_storage_service.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../../auth/domain/entities/auth_result.dart';
import '../../../user/domain/entities/user.dart';
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

  @override
  Future<Either<Failure, String>> login(String email, String password) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    final result = await _remoteDataSource.login(email, password);
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response.message),
    );
  }

  @override
  Future<Either<Failure, (AuthResult, User)>> verifyOtp(
    String email,
    String otp,
  ) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    final result = await _remoteDataSource.verifyOtp(email, otp);
    return await result.fold((failure) => Left(failure), (response) async {
      // Create AuthResult and User from response
      final authResult = AuthResult(
        accessToken: response.accesstoken,
        refreshToken: response.refreshToken,
      );

      // Create user with the ID from response
      final user = User(
        id: int.tryParse(response.id) ?? 0,
        uid: response.id,
        phone: email, // Using email as phone for now
        email: email,
        firstName: null,
        lastName: null,
        updatedAt: DateTime.now(),
        createdAt: DateTime.now(),
      );

      // Store auth result locally
      await _localDataSource.storeAuthResult(authResult, user);

      return Right((authResult, user));
    });
  }

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    final result = await _remoteDataSource.forgotPassword(email);
    return result.fold(
      (failure) => Left(failure),
      (response) => Right(response.message),
    );
  }

  @override
  Future<Either<Failure, String>> verifyOtpForgot(
    String email,
    String otpForgot,
  ) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    return await _remoteDataSource.verifyOtpForgot(email, otpForgot);
  }

  @override
  Future<Either<Failure, String>> changePassword(
    String email,
    String newPassword,
  ) async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    return await _remoteDataSource.changePassword(email, newPassword);
  }

  @override
  Future<Either<Failure, (AuthResult, User)>> refreshToken() async {
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    return Left(ServerFailure('Refresh token not implemented'));
  }

  @override
  Future<Either<Failure, void>> logout() async {
    try {
      await _localDataSource.clearAuthData();

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure('Failed to logout: ${e.toString()}'));
    }
  }

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
