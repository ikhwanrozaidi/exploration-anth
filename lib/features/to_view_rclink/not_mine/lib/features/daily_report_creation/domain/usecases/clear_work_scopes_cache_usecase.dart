import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/daily_report_creation_repository.dart';

@injectable
class ClearWorkScopesCacheUseCase implements UseCaseNoParams<void> {
  final DailyReportCreationRepository _repository;

  ClearWorkScopesCacheUseCase(this._repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await _repository.clearCache();
  }
}
