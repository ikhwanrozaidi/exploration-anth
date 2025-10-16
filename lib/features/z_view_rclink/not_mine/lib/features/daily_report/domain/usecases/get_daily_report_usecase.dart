import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/daily_report_response.dart';
import '../repository/daily_report_repository.dart';

class GetDailyReportsParams extends Equatable {
  final String companyUID;
  final int page;
  final int limit;
  final String sortOrder;

  const GetDailyReportsParams({
    required this.companyUID,
    this.page = 1,
    this.limit = 10,
    this.sortOrder = 'asc',
  });

  @override
  List<Object?> get props => [companyUID, page, limit, sortOrder];
}

@lazySingleton
class GetDailyReportsUseCase
    implements UseCase<List<DailyReportResponse>, GetDailyReportsParams> {
  final DailyReportRepository repository;

  GetDailyReportsUseCase(this.repository);

  @override
  Future<Either<Failure, List<DailyReportResponse>>> call(
    GetDailyReportsParams params,
  ) async {
    return await repository.getDailyReports(
      companyUID: params.companyUID,
      page: params.page,
      limit: params.limit,
      sortOrder: params.sortOrder,
    );
  }
}
