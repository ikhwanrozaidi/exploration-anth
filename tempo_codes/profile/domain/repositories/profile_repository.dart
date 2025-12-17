import 'package:dartz/dartz.dart';
import '../../../../lib/core/errors/failures.dart';
import '../../../../lib/features/login/domain/entities/user.dart';

abstract class ProfileRepository {
  Future<Either<Failure, User?>> getStoredUser();
}
