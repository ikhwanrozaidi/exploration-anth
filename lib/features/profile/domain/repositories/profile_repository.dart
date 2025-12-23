import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../login/domain/entities/user.dart';

abstract class ProfileRepository {
  Future<Either<Failure, User>> updateProfile(Map<String, dynamic> updates);
}
