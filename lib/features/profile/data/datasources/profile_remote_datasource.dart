import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../login/domain/entities/user.dart';
import '../../../login/domain/entities/user_detail.dart';
import '../../../login/domain/entities/user_settings.dart';
import 'profile_api_service.dart';

abstract class ProfileRemoteDataSource {
  Future<Either<Failure, User>> updateProfile(Map<String, dynamic> updates);
}

@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileApiService _apiService;

  ProfileRemoteDataSourceImpl(this._apiService);

  @override
  Future<Either<Failure, User>> updateProfile(
    Map<String, dynamic> updates,
  ) async {
    try {
      print('📡 [ProfileRemoteDataSource] Updating profile with: $updates');

      final response = await _apiService.updateProfile(data: updates);

      if (response.isSuccess && response.data != null) {
        final responseData = response.data!;

        // Parse userDetail
        UserDetail? userDetail;
        if (responseData.userDetail.isNotEmpty) {
          userDetail = UserDetail.fromJson(responseData.userDetail);
        }

        // Parse userSettings (if exists in response, otherwise keep existing)
        UserSettings? userSettings = responseData.user.userSettings;

        // Create updated user entity
        final updatedUser = responseData.user.copyWith(
          userDetail: userDetail,
          userSettings: userSettings,
        );

        print('✅ [ProfileRemoteDataSource] Profile updated successfully');
        return Right(updatedUser);
      } else {
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
      print('❌ [ProfileRemoteDataSource] Update error: $e');
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
