import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/otp_response.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  AuthRepositoryImpl(this._remoteDataSource, this._networkInfo);

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
}
