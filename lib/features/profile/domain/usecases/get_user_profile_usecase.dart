import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../login/domain/entities/user.dart';
import '../repositories/profile_repository.dart';

@injectable
class GetUserProfileUseCase implements UseCaseNoParams<User?> {
  final ProfileRepository repository;

  GetUserProfileUseCase(this.repository);

  @override
  Future<Either<Failure, User?>> call() async {
    return await repository.getUserProfile();
  }
}
