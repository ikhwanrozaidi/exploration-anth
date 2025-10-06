import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/usecases/get_daily_report_usecase.dart';
import '../../domain/usecases/clear_daily_report_cache_usecase.dart';
import '../../domain/usecases/get_roads_edit_usecase.dart';
import 'daily_report_event.dart';
import 'daily_report_state.dart';

@injectable
class DailyReportBloc extends Bloc<DailyReportEvent, DailyReportState> {
  final GetDailyReportsUseCase _getDailyReportsUseCase;
  final ClearDailyReportCacheUseCase _clearDailyReportCacheUseCase;
  final GetRoadsForEditUseCase _getRoadsForEditUseCase;

  DailyReportBloc(
    this._getDailyReportsUseCase,
    this._clearDailyReportCacheUseCase,
    this._getRoadsForEditUseCase,
  ) : super(const DailyReportInitial()) {
    on<LoadDailyReports>(_onLoadDailyReports);
    on<ClearDailyReportCache>(_onClearCache);

    on<LoadRoadsForEdit>(_onLoadRoadsForEdit);
    on<SelectRoadForEdit>(_onSelectRoadForEdit);
    on<UpdateSectionForEdit>(_onUpdateSectionForEdit);
    on<ClearRoadEditData>(_onClearRoadEditData);
  }

  Future<void> _onLoadDailyReports(
    LoadDailyReports event,
    Emitter<DailyReportState> emit,
  ) async {
    emit(const DailyReportLoading());

    final result = await _getDailyReportsUseCase(
      GetDailyReportsParams(
        companyUID: event.companyUID,
        page: event.page,
        limit: event.limit,
        sortOrder: event.sortOrder,
      ),
    );

    result.fold(
      (failure) => emit(DailyReportFailure(_mapFailureToMessage(failure))),
      (reports) => emit(DailyReportLoaded(reports)),
    );
  }

  Future<void> _onClearCache(
    ClearDailyReportCache event,
    Emitter<DailyReportState> emit,
  ) async {
    final result = await _clearDailyReportCacheUseCase();

    result.fold(
      (failure) => emit(DailyReportFailure(_mapFailureToMessage(failure))),
      (_) {
        emit(const DailyReportInitial());
      },
    );
  }

  Future<void> _onLoadRoadsForEdit(
    LoadRoadsForEdit event,
    Emitter<DailyReportState> emit,
  ) async {
    emit(const RoadsLoading());

    final result = await _getRoadsForEditUseCase(
      GetRoadsForEditParams(
        districtName: event.districtName,
        forceRefresh: event.forceRefresh,
      ),
    );

    result.fold(
      (failure) => emit(RoadsFailure(_mapFailureToMessage(failure))),
      (roads) => emit(
        RoadsLoaded(
          roads: roads,
          selectedRoad: null,
          currentSection: null,
          sectionError: null,
        ),
      ),
    );
  }

  Future<void> _onSelectRoadForEdit(
    SelectRoadForEdit event,
    Emitter<DailyReportState> emit,
  ) async {
    if (state is RoadsLoaded) {
      final currentState = state as RoadsLoaded;

      emit(
        RoadsLoaded(
          roads: currentState.roads,
          selectedRoad: event.selectedRoad,
          currentSection: currentState.currentSection,
          sectionError: null,
        ),
      );
    }
  }

  Future<void> _onUpdateSectionForEdit(
    UpdateSectionForEdit event,
    Emitter<DailyReportState> emit,
  ) async {
    if (state is RoadsLoaded) {
      final currentState = state as RoadsLoaded;
      String? sectionError;

      // Validate section if road is selected
      if (currentState.selectedRoad != null) {
        final selectedRoad = currentState.selectedRoad!;
        final sectionValue = double.tryParse(event.section);

        if (sectionValue == null && event.section.isNotEmpty) {
          sectionError = 'Please enter a valid number';
        } else if (sectionValue != null &&
            selectedRoad.sectionStart != null &&
            selectedRoad.sectionFinish != null) {
          final start = double.tryParse(selectedRoad.sectionStart!);
          final finish = double.tryParse(selectedRoad.sectionFinish!);

          if (start != null && finish != null) {
            if (sectionValue < start || sectionValue > finish) {
              sectionError = 'Section must be between $start and $finish';
            }
          }
        }
      }

      emit(
        RoadsLoaded(
          roads: currentState.roads,
          selectedRoad: currentState.selectedRoad,
          currentSection: event.section,
          sectionError: sectionError,
        ),
      );
    }
  }

  Future<void> _onClearRoadEditData(
    ClearRoadEditData event,
    Emitter<DailyReportState> emit,
  ) async {
    emit(const DailyReportInitial());
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server error occurred';
      case CacheFailure:
        return 'Cache error occurred';
      case NetworkFailure:
        return 'Network error occurred';
      case ConnectionFailure:
        return 'No internet connection';
      case NotFoundFailure:
        return 'Data not found';
      case UnauthorizedFailure:
        return 'Unauthorized access';
      default:
        return 'An unexpected error occurred';
    }
  }
}
