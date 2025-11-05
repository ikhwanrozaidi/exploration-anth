import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/daily_report.dart';
import '../repository/daily_report_repository.dart';

class GetDailyReportsParams extends Equatable {
  final String companyUID;
  final int page;
  final int limit;
  final String sortOrder;
  final String? search;
  final String? roadUid;
  final String? workScopeUid;
  final String? contractorUid;

  const GetDailyReportsParams({
    required this.companyUID,
    this.page = 1,
    this.limit = 10,
    this.sortOrder = 'asc',
    this.search,
    this.roadUid,
    this.workScopeUid,
    this.contractorUid,
  });

  @override
  List<Object?> get props => [companyUID, page, limit, sortOrder, search];
}

@lazySingleton
class GetDailyReportsUseCase
    implements UseCase<List<DailyReport>, GetDailyReportsParams> {
  final DailyReportRepository repository;

  GetDailyReportsUseCase(this.repository);

  @override
  Future<Either<Failure, List<DailyReport>>> call(
    GetDailyReportsParams params,
  ) async {
    return await repository.getDailyReports(
      companyUID: params.companyUID,
      page: params.page,
      limit: params.limit,
      sortOrder: params.sortOrder,
      search: params.search,
      roadUid: params.roadUid,
      workScopeUid: params.workScopeUid,
      contractorUid: params.contractorUid,
    );
  }
}
