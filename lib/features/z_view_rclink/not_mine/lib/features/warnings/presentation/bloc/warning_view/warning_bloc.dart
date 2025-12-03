import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/entities/warning.dart';
import '../../../domain/usecases/clear_warning_cache_usecase.dart';
import '../../../domain/usecases/get_warnings_usecase.dart';
import '../../../domain/usecases/resolve_warning_item_usecase.dart';
import 'warning_event.dart';
import 'warning_state.dart';

@injectable
class WarningBloc extends Bloc<WarningEvent, WarningState> {
  final GetWarningsUseCase _getWarningsUseCase;
  final ClearWarningCacheUseCase _clearWarningCacheUseCase;
  final ResolveWarningItemUseCase _resolveWarningItemUseCase;

  WarningBloc(
    this._getWarningsUseCase,
    this._clearWarningCacheUseCase,
    this._resolveWarningItemUseCase,
  ) : super(const WarningState.initial()) {
    on<LoadWarnings>(_onLoadWarnings);
    on<LoadMoreWarnings>(_onLoadMoreWarnings);
    on<RefreshWarnings>(_onRefreshWarnings);
    on<ResolveWarningItem>(_onResolveWarningItem);
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

  Future<void> _onResolveWarningItem(
    ResolveWarningItem event,
    Emitter<WarningState> emit,
  ) async {
    print('🔵 [WarningBloc:${hashCode}] _onResolveWarningItem called');
    print('   warningUID: ${event.warningUID}, itemUID: ${event.itemUID}');

    final currentState = state;
    print('🔵 [WarningBloc] Current state: ${currentState.runtimeType}');

    // Handle different initial states
    List<Warning> existingWarnings = [];
    int currentPage = 1;
    bool hasMore = false;

    if (currentState is WarningLoaded) {
      existingWarnings = currentState.warnings;
      currentPage = currentState.currentPage;
      hasMore = currentState.hasMore;
    } else if (currentState is WarningLoadingMore) {
      existingWarnings = currentState.warnings;
      currentPage = currentState.currentPage;
    }

    print('🔵 [WarningBloc] Existing warnings count: ${existingWarnings.length}');

    // Only emit resolving state if we have warnings loaded
    if (existingWarnings.isNotEmpty) {
      print('🔵 [WarningBloc] Emitting resolvingItem state...');
      emit(
        WarningState.resolvingItem(
          warnings: existingWarnings,
          currentPage: currentPage,
          hasMore: hasMore,
          resolvingItemUID: event.itemUID,
        ),
      );
    }

    final params = ResolveWarningItemParams(
      companyUID: event.companyUID,
      warningUID: event.warningUID,
      itemUID: event.itemUID,
      notes: event.notes,
    );

    print('🔵 [WarningBloc] Calling use case...');
    final result = await _resolveWarningItemUseCase(params);
    print('🔵 [WarningBloc] Use case returned: ${result.isRight() ? "Success" : "Failure"}');

    result.fold(
      (failure) {
        print('❌ [WarningBloc] Resolve failed: ${failure.message}');
        // On failure, emit error state
        emit(
          WarningState.error(
            failure: failure,
            cachedWarnings: existingWarnings.isNotEmpty ? existingWarnings : null,
          ),
        );
      },
      (updatedWarning) {
        print('✅ [WarningBloc] Resolve succeeded!');

        // Update the warning in the list if we have it
        List<Warning> updatedWarnings;
        if (existingWarnings.isNotEmpty) {
          updatedWarnings = existingWarnings.map((warning) {
            if (warning.uid == event.warningUID) {
              return updatedWarning;
            }
            return warning;
          }).toList();
        } else {
          // If no existing warnings, create a list with just the updated one
          updatedWarnings = [updatedWarning];
        }

        print('🔵 [WarningBloc] Emitting itemResolved state');
        // Emit success state
        emit(
          WarningState.itemResolved(
            warnings: updatedWarnings,
            currentPage: currentPage,
            hasMore: hasMore,
            resolvedItemUID: event.itemUID,
          ),
        );

        print('🔵 [WarningBloc] Scheduling transition to loaded state');
        // After a brief moment, transition back to loaded state
        Future.delayed(const Duration(milliseconds: 500), () {
          if (!emit.isDone) {
            print('🔵 [WarningBloc] Transitioning to loaded state');
            emit(
              WarningState.loaded(
                warnings: updatedWarnings,
                currentPage: currentPage,
                hasMore: hasMore,
              ),
            );
          }
        });
      },
    );
  }

  Future<void> _onClearWarningCache(
    ClearWarningCache event,
    Emitter<WarningState> emit,
  ) async {
    await _clearWarningCacheUseCase();
  }
}
