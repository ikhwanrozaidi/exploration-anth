import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../login/domain/entities/user.dart';
import '../repositories/profile_repository.dart';

@injectable
class UpdateProfileUseCase implements UseCase<User, UpdateProfileParams> {
  final ProfileRepository repository;

  UpdateProfileUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(UpdateProfileParams params) async {
    if (params.updates.isEmpty) {
      return const Left(ValidationFailure('No fields to update'));
    }
    return await repository.updateProfile(params.updates);
  }
}

//REVISE: Be specific with fields to update
class UpdateProfileParams {
  final Map<String, dynamic> updates;

  UpdateProfileParams(this.updates);
}
