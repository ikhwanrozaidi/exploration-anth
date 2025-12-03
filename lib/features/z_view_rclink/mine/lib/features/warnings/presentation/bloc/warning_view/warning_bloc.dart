import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/clear_warning_cache_usecase.dart';
import '../../../domain/usecases/get_warnings_usecase.dart';
import 'warning_event.dart';
import 'warning_state.dart';

@injectable
class WarningBloc extends Bloc<WarningEvent, WarningState> {
  final GetWarningsUseCase _getWarningsUseCase;
  final ClearWarningCacheUseCase _clearWarningCacheUseCase;

  WarningBloc(this._getWarningsUseCase, this._clearWarningCacheUseCase)
    : super(const WarningState.initial()) {
    on<LoadWarnings>(_onLoadWarnings);
    on<LoadMoreWarnings>(_onLoadMoreWarnings);
    on<RefreshWarnings>(_onRefreshWarnings);
    on<ClearWarningCache>(_onClearWarningCache);
  }

  Future<void> _onLoadWarnings(
    LoadWarnings event,
    Emitter<WarningState> emit,
  ) async {
    emit(const WarningState.loading());

    final params = GetWarningsParams(
      companyUID: event.companyUID,
      page: event.page,
      limit: event.limit,
      sortOrder: event.sortOrder,
      warningType: event.warningType,
      roadUID: event.roadUID,
      workScopeUID: event.workScopeUID,
      contractRelationUID: event.contractRelationUID,
      dailyReportUID: event.dailyReportUID,
      isResolved: event.isResolved,
      requiresAction: event.requiresAction,
    );

    final result = await _getWarningsUseCase(params);

    result.fold(
      (failure) => emit(WarningState.error(failure: failure)),
      (warnings) => emit(
        WarningState.loaded(
          warnings: warnings,
          currentPage: event.page,
          hasMore: warnings.length >= event.limit,
        ),
      ),
    );
  }

  Future<void> _onLoadMoreWarnings(
    LoadMoreWarnings event,
    Emitter<WarningState> emit,
  ) async {
    final currentState = state;
    if (currentState is! WarningLoaded) return;

    // Don't load more if already loading or no more data
    if (currentState.isLoadingMore || !currentState.hasMore) return;

    emit(
      WarningState.loadingMore(
        warnings: currentState.warnings,
        currentPage: currentState.currentPage,
      ),
    );

    final params = GetWarningsParams(
      companyUID: event.companyUID,
      page: event.nextPage,
      limit: event.limit,
      sortOrder: event.sortOrder,
      warningType: event.warningType,
      roadUID: event.roadUID,
      workScopeUID: event.workScopeUID,
      contractRelationUID: event.contractRelationUID,
      dailyReportUID: event.dailyReportUID,
      isResolved: event.isResolved,
      requiresAction: event.requiresAction,
    );

    final result = await _getWarningsUseCase(params);

    result.fold(
      (failure) => emit(
        WarningState.loaded(
          warnings: currentState.warnings,
          currentPage: currentState.currentPage,
          hasMore: false,
        ),
      ),
      (newWarnings) {
        final allWarnings = [...currentState.warnings, ...newWarnings];
        emit(
          WarningState.loaded(
            warnings: allWarnings,
            currentPage: event.nextPage,
            hasMore: newWarnings.length >= event.limit,
          ),
        );
      },
    );
  }

  Future<void> _onRefreshWarnings(
    RefreshWarnings event,
    Emitter<WarningState> emit,
  ) async {
    final params = GetWarningsParams(
      companyUID: event.companyUID,
      page: 1,
      limit: event.limit,
      sortOrder: event.sortOrder,
      warningType: event.warningType,
      roadUID: event.roadUID,
      workScopeUID: event.workScopeUID,
      contractRelationUID: event.contractRelationUID,
      dailyReportUID: event.dailyReportUID,
      isResolved: event.isResolved,
      requiresAction: event.requiresAction,
    );

    final result = await _getWarningsUseCase(params);

    result.fold(
      (failure) {
        final currentState = state;
        if (currentState is WarningLoaded) {
          emit(
            WarningState.error(
              failure: failure,
              cachedWarnings: currentState.warnings,
            ),
          );
        } else {
          emit(WarningState.error(failure: failure));
        }
      },
      (warnings) => emit(
        WarningState.loaded(
          warnings: warnings,
          currentPage: 1,
          hasMore: warnings.length >= event.limit,
        ),
      ),
    );
  }

  Future<void> _onClearWarningCache(
    ClearWarningCache event,
    Emitter<WarningState> emit,
  ) async {
    await _clearWarningCacheUseCase();
  }
}
