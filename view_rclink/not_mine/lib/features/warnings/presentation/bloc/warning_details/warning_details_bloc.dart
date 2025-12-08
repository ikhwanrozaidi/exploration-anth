import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../company/presentation/bloc/company_bloc.dart';
import '../../../../company/presentation/bloc/company_state.dart';
import '../../../domain/usecases/get_warnings_by_uid_usecase.dart';
import 'warning_details_event.dart';
import 'warning_details_state.dart';

@injectable
class WarningDetailsBloc
    extends Bloc<WarningDetailsEvent, WarningDetailsState> {
  final GetWarningByUidUseCase _getWarningByUidUseCase;
  final CompanyBloc _companyBloc;

  WarningDetailsBloc(this._getWarningByUidUseCase, this._companyBloc)
    : super(const WarningDetailsState.initial()) {
    on<LoadWarningDetails>(_onLoadWarningDetails);
    on<RefreshWarningDetails>(_onRefreshWarningDetails);
  }

  Future<void> _onLoadWarningDetails(
    LoadWarningDetails event,
    Emitter<WarningDetailsState> emit,
  ) async {
    emit(const WarningDetailsState.loading());

    final companyState = _companyBloc.state;
    if (companyState is! CompanyLoaded ||
        companyState.selectedCompany == null) {
      emit(
        WarningDetailsState.error(
          failure: ServerFailure('No company selected'),
        ),
      );
      return;
    }

    final companyUID = companyState.selectedCompany!.uid;

    final params = GetWarningByUidParams(
      companyUID: companyUID,
      uid: event.warningUID,
      forceRefresh: event.forceRefresh,
    );

    final result = await _getWarningByUidUseCase(params);

    result.fold(
      (failure) => emit(WarningDetailsState.error(failure: failure)),
      (warning) => emit(WarningDetailsState.loaded(warning: warning)),
    );
  }

  Future<void> _onRefreshWarningDetails(
    RefreshWarningDetails event,
    Emitter<WarningDetailsState> emit,
  ) async {
    final companyState = _companyBloc.state;
    if (companyState is! CompanyLoaded ||
        companyState.selectedCompany == null) {
      emit(
        WarningDetailsState.error(
          failure: ServerFailure('No company selected'),
        ),
      );
      return;
    }

    final companyUID = companyState.selectedCompany!.uid;

    final params = GetWarningByUidParams(
      companyUID: companyUID,
      uid: event.warningUID,
      forceRefresh: true,
    );

    final result = await _getWarningByUidUseCase(params);

    result.fold((failure) {
      final currentState = state;
      if (currentState is WarningDetailsLoaded) {
        emit(
          WarningDetailsState.error(
            failure: failure,
            cachedWarning: currentState.warning,
          ),
        );
      } else {
        emit(WarningDetailsState.error(failure: failure));
      }
    }, (warning) => emit(WarningDetailsState.loaded(warning: warning)));
  }
}
