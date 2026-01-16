import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/program_settings/program_setting_entity.dart';
import '../repositories/program_repository.dart';

class GetProgramSettingsParams {
  final bool forceRefresh;

  const GetProgramSettingsParams({this.forceRefresh = false});
}

@lazySingleton
class GetProgramSettingsUseCase
    implements UseCase<List<ProgramSetting>, GetProgramSettingsParams> {
  final ProgramRepository _repository;

  GetProgramSettingsUseCase(this._repository);

  @override
  Future<Either<Failure, List<ProgramSetting>>> call(
    GetProgramSettingsParams params,
  ) async {
    return await _repository.getProgramSettings(
      forceRefresh: params.forceRefresh,
    );
  }
}
