import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../login/domain/entities/user.dart';
import '../entities/user_profile.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserProfile?>> getProfile();

  Future<Either<Failure, UserProfile>> updateProfile({
    String? email,
    String? phone,
    String? country,
    String? firstName,
    String? lastName,
    String? fullName,
    String? address,
    String? birthDate,
    String? profilePicture,
  });
}
