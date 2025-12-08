import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/user_settings_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, UserSettings>> getUserSettings();
}
