import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/create_report_warning_model.dart';
import '../entities/warning.dart';
import '../repositories/warnings_repository.dart';

@injectable
class CreateReportWarningUseCase
    implements UseCase<Warning, CreateReportWarningParams> {
  final WarningsRepository _repository;

  CreateReportWarningUseCase(this._repository);

  @override
  Future<Either<Failure, Warning>> call(
    CreateReportWarningParams params,
  ) async {
    // Create the model from params
    final model = CreateReportWarningModel(
      dailyReportUID: params.dailyReportUID,
      warningReasonUIDs: params.warningReasonUIDs,
      description: params.description,
    );

    // Call repository to create warning
    return await _repository.createReportWarning(model);
  }
}

/// Parameters for creating a report warning
class CreateReportWarningParams extends Equatable {
  final String dailyReportUID;
  final List<String> warningReasonUIDs;
  final String? description;

  const CreateReportWarningParams({
    required this.dailyReportUID,
    required this.warningReasonUIDs,
    this.description,
  });

  @override
  List<Object?> get props => [dailyReportUID, warningReasonUIDs, description];
}
