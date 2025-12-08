import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repository/daily_report_repository.dart';

@lazySingleton
class ClearDailyReportCacheUseCase implements UseCaseNoParams<void> {
  final DailyReportRepository repository;

  ClearDailyReportCacheUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await repository.clearCache();
  }
}
