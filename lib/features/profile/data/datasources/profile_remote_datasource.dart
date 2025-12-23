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
      final response = await _apiService.updateProfile(data: updates);

      if (response.isSuccess && response.data != null) {
        final data = response
            .data!; //REVISE: Are you sure to use this because already extract out 'data' from ApiResponse
        final userData =
            data['user']
                as Map<String, dynamic>; //REVISE: don't use "data['user']"
        final userDetailData =
            data['userDetail']
                as Map<
                  String,
                  dynamic
                >?; //REVISE: don't use "data['userDetail']"

        User user = User.fromJson(userData);

        if (userDetailData != null) {
          final userDetail = UserDetail.fromJson(userDetailData);
          user = user.copyWith(userDetail: userDetail);
        }

        return Right(user);
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
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
