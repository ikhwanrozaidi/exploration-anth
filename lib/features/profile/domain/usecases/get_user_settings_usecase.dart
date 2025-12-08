import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/user_settings_entity.dart';
import '../repositories/profile_repository.dart';

@lazySingleton
class GetUserSettingsUseCase {
  final ProfileRepository repository;

  const GetUserSettingsUseCase(this.repository);

  @override
  Future<Either<Failure, UserSettings>> call() async {
    return await repository.getUserSettings();
  }
}
