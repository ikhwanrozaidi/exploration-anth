import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/daily_report.dart';
import '../repository/daily_report_repository.dart';

class GetDailyReportByIdParams extends Equatable {
  final String companyUID;
  final String dailyReportUID;
  final bool forceRefresh;

  const GetDailyReportByIdParams({
    required this.companyUID,
    required this.dailyReportUID,
    this.forceRefresh = false,
  });

  @override
  List<Object?> get props => [companyUID, dailyReportUID, forceRefresh];
}

@lazySingleton
class GetDailyReportByIdUseCase
    implements UseCase<DailyReport, GetDailyReportByIdParams> {
  final DailyReportRepository repository;

  GetDailyReportByIdUseCase(this.repository);

  @override
  Future<Either<Failure, DailyReport>> call(
    GetDailyReportByIdParams params,
  ) async {
    return await repository.getDailyReportById(
      companyUID: params.companyUID,
      dailyReportUID: params.dailyReportUID,
      forceRefresh: params.forceRefresh,
    );
  }
}
