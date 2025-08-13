// lib/features/auth/data/repositories/auth_repository_impl.dart
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/otp_response.dart';
import '../../domain/entities/auth_result.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../datasources/auth_local_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl(
    this._remoteDataSource,
    this._localDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, OtpResponse>> sendOtp(String phone) async {
    // OTP sending requires internet connection
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    // Delegate to remote data source
    return await _remoteDataSource.sendOtp(phone);
  }

  @override
  Future<Either<Failure, bool>> checkEmailExists(String email) async {
    // Check email requires internet connection
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    // Delegate to remote data source
    return await _remoteDataSource.checkEmailExists(email);
  }

  @override
  Future<Either<Failure, AuthResult>> signUp(
    String email,
    String password,
    Map<String, dynamic> additionalData,
  ) async {
    // Sign up requires internet connection
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    // Attempt to sign up
    final result = await _remoteDataSource.signUp(email, password, additionalData);

    return result.fold(
      (failure) => Left(failure),
      (authResult) async {
        // Store auth result locally on success
        await _localDataSource.storeAuthResult(authResult);
        return Right(authResult);
      },
    );
  }
}