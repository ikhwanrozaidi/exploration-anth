import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/otp_response.dart';
import '../../domain/entities/tokens.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, OtpResponse>> requestOtp(String phone) async {
    // OTP sending requires internet connection
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    // Delegate to remote data source and convert model to entity
    final result = await _remoteDataSource.requestOtp(phone);
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.toEntity()),
    );
  }

  @override
  Future<Either<Failure, Tokens>> verifyOtp(String phone, String otp) async {
    // OTP verification requires internet connection
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    // Delegate to remote data source and convert model to entity
    final result = await _remoteDataSource.verifyOtp(phone, otp);
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.toEntity()),
    );
  }

  @override
  Future<Either<Failure, Tokens>> refreshToken(String refreshToken) async {
    // Token refresh always requires internet connection
    final isConnected = await _networkInfo.isConnected;
    if (!isConnected) {
      return const Left(ConnectionFailure());
    }

    // Delegate to remote data source and convert model to entity
    final result = await _remoteDataSource.refreshToken(refreshToken);
    return result.fold(
      (failure) => Left(failure),
      (model) => Right(model.toEntity()),
    );
  }
}
