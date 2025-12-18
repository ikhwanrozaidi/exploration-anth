import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/warning.dart';
import '../repositories/warning_repository.dart';

@injectable
class GetWarningsUseCase implements UseCase<List<Warning>, GetWarningsParams> {
  final WarningRepository _repository;

  GetWarningsUseCase(this._repository);

  @override
  Future<Either<Failure, List<Warning>>> call(GetWarningsParams params) async {
    return await _repository.getWarnings(
      companyUID: params.companyUID,
      page: params.page,
      limit: params.limit,
      sortOrder: params.sortOrder,
      warningType: params.warningType,
      roadUID: params.roadUID,
      workScopeUID: params.workScopeUID,
      contractRelationUID: params.contractRelationUID,
      dailyReportUID: params.dailyReportUID,
      isResolved: params.isResolved,
      requiresAction: params.requiresAction,
    );
  }
}

class GetWarningsParams {
  final String companyUID;
  final int page;
  final int limit;
  final String sortOrder;
  final List<String>? warningType;
  final String? roadUID;
  final String? workScopeUID;
  final String? contractRelationUID;
  final String? dailyReportUID;
  final bool? isResolved;
  final bool? requiresAction;

  GetWarningsParams({
    required this.companyUID,
    this.page = 1,
    this.limit = 50,
    this.sortOrder = 'desc',
    this.warningType,
    this.roadUID,
    this.workScopeUID,
    this.contractRelationUID,
    this.dailyReportUID,
    this.isResolved,
    this.requiresAction,
  });
}
