import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../login/domain/entities/user.dart';
import '../repositories/profile_repository.dart';

@injectable
class UpdateUserProfileUseCase implements UseCase<User, UpdateProfileParams> {
  final ProfileRepository repository;

  UpdateUserProfileUseCase(this.repository);

  @override
  Future<Either<Failure, User>> call(UpdateProfileParams params) async {
    // Validate at least one field is being updated
    if (params.updates.isEmpty) {
      return const Left(ValidationFailure('No fields to update'));
    }

    return await repository.updateUserProfile(params.updates);
  }
}

class UpdateProfileParams extends Equatable {
  final Map<String, dynamic> updates;

  const UpdateProfileParams(this.updates);

  @override
  List<Object> get props => [updates];
}
