import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/create_report_warning_usecase.dart';
import 'create_warning_event.dart';
import 'create_warning_state.dart';

@injectable
class CreateWarningBloc extends Bloc<CreateWarningEvent, CreateWarningState> {
  final CreateReportWarningUseCase _createReportWarningUseCase;

  CreateWarningBloc(this._createReportWarningUseCase)
    : super(const CreateWarningState.initial()) {
    on<CreateWarning>(_onCreateWarning);
  }

  Future<void> _onCreateWarning(
    CreateWarning event,
    Emitter<CreateWarningState> emit,
  ) async {
    emit(const CreateWarningState.loading());

    // Create params from event data
    final params = CreateReportWarningParams(
      dailyReportUID: event.dailyReportUID,
      warningReasonUIDs: event.warningReasonUIDs,
      description: event.description,
    );

    // Call use case
    final result = await _createReportWarningUseCase(params);

    // Emit success or error state
    result.fold(
      (failure) => emit(CreateWarningState.error(failure)),
      (warning) => emit(CreateWarningState.success(warning)),
    );
  }
}
