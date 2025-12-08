import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../models/user_settings_response_model.dart';
import 'profile_api_service.dart';

abstract class ProfileRemoteDataSource {
  Future<Either<Failure, UserSettingsResponseModel>> getUserSettings();
}

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileApiService _apiService;

  const ProfileRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, UserSettingsResponseModel>> getUserSettings() async {
    try {
      final response = await _apiService.getUserSettings();

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
