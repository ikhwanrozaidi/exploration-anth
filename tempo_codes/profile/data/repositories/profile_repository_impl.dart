import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../lib/core/errors/failures.dart';
import '../../../../lib/features/login/domain/entities/user.dart';
import '../../domain/repositories/profile_repository.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl();

  @override
  Future<Either<Failure, User?>> getStoredUser() async {
    return await _localDataSource.getStoredUser();
  }
}
