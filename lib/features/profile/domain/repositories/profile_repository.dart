import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../login/domain/entities/user.dart';

abstract class ProfileRepository {
  Future<Either<Failure, User?>> getUserProfile();

  Future<Either<Failure, User>> updateUserProfile(Map<String, dynamic> updates);
}
