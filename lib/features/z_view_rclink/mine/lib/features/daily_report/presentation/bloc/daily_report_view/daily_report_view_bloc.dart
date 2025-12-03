import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../../core/errors/failures.dart';
import '../../../data/datasources/daily_report_local_datasource.dart';
import '../../../domain/usecases/get_daily_report_usecase.dart';
import '../../../domain/usecases/get_daily_report_by_id_usecase.dart';
import '../../../domain/usecases/clear_daily_report_cache_usecase.dart';
import 'daily_report_view_event.dart';
import 'daily_report_view_state.dart';

@lazySingleton
class DailyReportViewBloc
    extends Bloc<DailyReportViewEvent, DailyReportViewState> {
  final GetDailyReportsUseCase _getDailyReportsUseCase;
  final GetDailyReportByIdUseCase _getDailyReportByIdUseCase;
  final ClearDailyReportCacheUseCase _clearDailyReportCacheUseCase;
  final DailyReportLocalDataSource _localDataSource;

  DailyReportViewBloc(
    this._getDailyReportsUseCase,
    this._getDailyReportByIdUseCase,
    this._clearDailyReportCacheUseCase,
    this._localDataSource,
  ) : super(const DailyReportViewInitial()) {
    on<LoadDailyReports>(_onLoadDailyReports);
    on<LoadMoreDailyReports>(_onLoadMoreDailyReports);
    on<LoadDailyReportById>(_onLoadDailyReportById);
    on<ChangeTab>(_onChangeTab);
    on<LoadDraftReports>(_onLoadDraftReports);
    on<ClearDailyReportCache>(_onClearCache);

    // on<LoadRoadsForEdit>(_onLoadRoadsForEdit);
    on<SelectRoadForEdit>(_onSelectRoadForEdit);
    // on<UpdateSectionForEdit>(_onUpdateSectionForEdit);
    on<ClearRoadEditData>(_onClearRoadEditData);
  }

  Future<void> _onLoadDailyReports(
    LoadDailyReports event,
    Emitter<DailyReportViewState> emit,
  ) async {
    emit(const DailyReportViewLoading());

    final result = await _getDailyReportsUseCase(
      GetDailyReportsParams(
        companyUID: event.companyUID,
        page: event.page,
        limit: event.limit,
        sortOrder: event.sortOrder,
        search: event.search,
        roadUid: event.roadUid,
        workScopeUid: event.workScopeUid,
        contractorUid: event.contractorUid,
        fromDate: event.fromDate,
        toDate: event.toDate,
      ),
    );

    result.fold(
      (failure) => emit(DailyReportViewFailure(_mapFailureToMessage(failure))),
      (reports) => emit(
        DailyReportViewLoaded(
          reports: reports,
          currentPage: event.page,
          hasMore: reports.length >= event.limit,
          isLoadingMore: false,
          searchQuery: event.search,
        ),
      ),
    );
  }

  Future<void> _onLoadMoreDailyReports(
    LoadMoreDailyReports event,
    Emitter<DailyReportViewState> emit,
  ) async {
    // Only load more if current state is loaded and not already loading more
    if (state is! DailyReportViewLoaded) return;

    final currentState = state as DailyReportViewLoaded;

    // Don't load if already loading or no more data
    if (currentState.isLoadingMore || !currentState.hasMore) return;

    // Emit loading more state
    emit(currentState.copyWith(isLoadingMore: true));

    final result = await _getDailyReportsUseCase(
      GetDailyReportsParams(
        companyUID: event.companyUID,
        page: event.page,
        limit: event.limit,
        sortOrder: event.sortOrder,
        search: event.search,
      ),
    );

    result.fold(
      (failure) {
        // On error, keep existing data but stop loading more
        emit(currentState.copyWith(isLoadingMore: false, hasMore: false));
      },
      (newReports) {
        // Append new reports to existing ones
        final allReports = [...currentState.reports, ...newReports];

        emit(
          DailyReportViewLoaded(
            reports: allReports,
            currentPage: event.page,
            hasMore: newReports.length >= event.limit,
            isLoadingMore: false,
            searchQuery: event.search,
          ),
        );
      },
    );
  }

  Future<void> _onLoadDailyReportById(
    LoadDailyReportById event,
    Emitter<DailyReportViewState> emit,
  ) async {
    emit(const DailyReportViewDetailLoading());

    final result = await _getDailyReportByIdUseCase(
      GetDailyReportByIdParams(
        companyUID: event.companyUID,
        dailyReportUID: event.dailyReportUID,
        forceRefresh: event.forceRefresh,
      ),
    );

    result.fold(
      (failure) =>
          emit(DailyReportViewDetailFailure(_mapFailureToMessage(failure))),
      (report) => emit(DailyReportViewDetailLoaded(report: report)),
    );
  }

  Future<void> _onClearCache(
    ClearDailyReportCache event,
    Emitter<DailyReportViewState> emit,
  ) async {
    final result = await _clearDailyReportCacheUseCase();

    result.fold(
      (failure) => emit(DailyReportViewFailure(_mapFailureToMessage(failure))),
      (_) {
        emit(const DailyReportViewInitial());
      },
    );
  }

  // Future<void> _onLoadRoadsForEdit(
  //   LoadRoadsForEdit event,
  //   Emitter<DailyReportViewState> emit,
  // ) async {
  //   emit(const RoadsLoading());

  //   final result = await _getRoadsForEditUseCase(
  //     GetRoadsForEditParams(
  //       districtName: event.districtName,
  //       forceRefresh: event.forceRefresh,
  //     ),
  //   );

  //   result.fold(
  //     (failure) => emit(RoadsFailure(_mapFailureToMessage(failure))),
  //     (roads) => emit(
  //       RoadsLoaded(
  //         roads: roads,
  //         selectedRoad: null,
  //         currentSection: null,
  //         sectionError: null,
  //       ),
  //     ),
  //   );
  // }

  Future<void> _onSelectRoadForEdit(
    SelectRoadForEdit event,
    Emitter<DailyReportViewState> emit,
  ) async {
    if (state is RoadsLoaded) {
      final currentState = state as RoadsLoaded;

      emit(
        RoadsLoaded(
          roads: currentState.roads,
          selectedRoad: event.selectedRoad,
          currentSection: currentState.currentSection,
          sectionError: null, // Clear error when road changes
        ),
      );
    }
  }

  // Future<void> _onUpdateSectionForEdit(
  //   UpdateSectionForEdit event,
  //   Emitter<DailyReportViewState> emit,
  // ) async {
  //   if (state is RoadsLoaded) {
  //     final currentState = state as RoadsLoaded;
  //     String? sectionError;

  //     // Validate section if road is selected
  //     if (currentState.selectedRoad != null) {
  //       final selectedRoad = currentState.selectedRoad!;
  //       final sectionValue = double.tryParse(event.section);

  //       if (sectionValue == null && event.section.isNotEmpty) {
  //         sectionError = 'Please enter a valid number';
  //       } else if (sectionValue != null &&
  //           selectedRoad.sectionStart != null &&
  //           selectedRoad.sectionFinish != null) {
  //         final start = double.tryParse(selectedRoad.sectionStart!);
  //         final finish = double.tryParse(selectedRoad.sectionFinish!);

  //         if (start != null && finish != null) {
  //           if (sectionValue < start || sectionValue > finish) {
  //             sectionError = 'Section must be between $start and $finish';
  //           }
  //         }
  //       }
  //     }

  //     emit(
  //       RoadsLoaded(
  //         roads: currentState.roads,
  //         selectedRoad: currentState.selectedRoad,
  //         currentSection: event.section,
  //         sectionError: sectionError,
  //       ),
  //     );
  //   }
  // }

  Future<void> _onClearRoadEditData(
    ClearRoadEditData event,
    Emitter<DailyReportViewState> emit,
  ) async {
    emit(const DailyReportViewInitial());
  }

  // ======================================================================
  // TAB & DRAFT MANAGEMENT
  // ======================================================================

  Future<void> _onChangeTab(
    ChangeTab event,
    Emitter<DailyReportViewState> emit,
  ) async {
    print('📑 Changing tab to index: ${event.tabIndex}');

    if (event.tabIndex == 0) {
      // Submitted tab - load regular reports
      emit(const DailyReportViewLoading());

      final result = await _getDailyReportsUseCase(
        GetDailyReportsParams(
          companyUID: event.companyUID,
          page: 1,
          limit: 50,
          sortOrder: 'desc',
        ),
      );

      result.fold(
        (failure) =>
            emit(DailyReportViewFailure(_mapFailureToMessage(failure))),
        (reports) => emit(
          DailyReportViewLoaded(
            reports: reports,
            currentPage: 1,
            hasMore: reports.length >= 10,
            isLoadingMore: false,
            selectedTabIndex: 0,
          ),
        ),
      );
    } else {
      // Draft tab - load drafts from local database
      add(DailyReportViewEvent.loadDraftReports(companyUID: event.companyUID));
    }
  }

  Future<void> _onLoadDraftReports(
    LoadDraftReports event,
    Emitter<DailyReportViewState> emit,
  ) async {
    print('📋 Loading draft reports for company: ${event.companyUID}');

    emit(const DailyReportViewLoading());

    try {
      // Get drafts from local database
      final draftModels = await _localDataSource.getDraftReports(
        event.companyUID,
      );

      // Convert models to entities
      final drafts = draftModels.map((model) => model.toEntity()).toList();

      print('✅ Loaded ${drafts.length} draft reports');

      emit(
        DailyReportViewLoaded(
          reports: drafts,
          currentPage: 1,
          hasMore: false, // Drafts don't have pagination
          isLoadingMore: false,
          selectedTabIndex: 1, // Draft tab
        ),
      );
    } catch (e) {
      print('❌ Error loading drafts: $e');
      emit(
        DailyReportViewFailure('Failed to load draft reports: ${e.toString()}'),
      );
    }
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
