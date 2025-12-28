import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/user_profile.dart';
import '../models/update_profile_request_model.dart';
import 'profile_api_service.dart';

abstract class ProfileRemoteDataSource {
  Future<Either<Failure, UserProfile>> updateProfile(
    UpdateProfileRequestModel request,
  );
}

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileApiService _apiService;

  ProfileRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, UserProfile>> updateProfile(
    UpdateProfileRequestModel request,
  ) async {
    try {
      print('🌐 [ProfileRemoteDataSource] Calling updateProfile API...');

      final response = await _apiService.updateProfile(data: request);

      if (response.isSuccess && response.data != null) {
        print('✅ [ProfileRemoteDataSource] Profile updated successfully');
        return Right(response.data!.toEntity());
      } else {
        print('❌ [ProfileRemoteDataSource] Update failed: ${response.message}');
        return Left(
          ServerFailure(
            response.message.isEmpty
                ? 'Failed to update profile'
                : response.message,
            statusCode: response.statusCode,
          ),
        );
      }
    } catch (e) {
      print('❌ [ProfileRemoteDataSource] Error: $e');
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
