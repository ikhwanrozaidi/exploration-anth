import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/admin.dart';

abstract class AdminRepository {
  Future<Either<Failure, Admin>> getCurrentAdmin({
    bool forceRefresh = false,
    Duration? cacheTimeout = const Duration(hours: 1),
  });
  Future<Either<Failure, Admin>> updateAdmin(Admin admin);
}
