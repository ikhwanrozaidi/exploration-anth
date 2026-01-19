import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/clear_program_cache_usecase.dart';
import '../../../domain/usecases/get_program_usecase.dart';
import 'program_list_event.dart';
import 'program_list_state.dart';

@lazySingleton
class ProgramListBloc extends Bloc<ProgramListEvent, ProgramListState> {
  final GetProgramsUseCase _getProgramsUseCase;
  final ClearProgramCacheUseCase _clearCacheUseCase;

  static const int _pageSize = 10;

  ProgramListBloc(this._getProgramsUseCase, this._clearCacheUseCase)
    : super(const ProgramListState.initial()) {
    on<LoadPrograms>(_onLoadPrograms);
    on<LoadMorePrograms>(_onLoadMorePrograms);
    on<RefreshPrograms>(_onRefreshPrograms);
    on<ClearProgramCache>(_onClearCache);
  }

  Future<void> _onLoadPrograms(
    LoadPrograms event,
    Emitter<ProgramListState> emit,
  ) async {
    print('📋 Loading programs: page=${event.page}, limit=${event.limit}');
    emit(const ProgramListState.loading());

    final result = await _getProgramsUseCase(
      GetProgramsParams(
        companyUID: event.companyUID,
        page: event.page,
        limit: event.limit,
        forceRefresh: event.forceRefresh,
      ),
    );

    result.fold(
      (failure) {
        print('❌ Failed to load programs: ${failure.message}');
        emit(ProgramListState.failure(failure.message));
      },
      (programs) {
        print('✅ Loaded ${programs.length} programs');
        emit(
          ProgramListState.loaded(
            programs: programs,
            currentPage: event.page,
            hasMore: programs.length >= event.limit,
          ),
        );
      },
    );
  }

  Future<void> _onLoadMorePrograms(
    LoadMorePrograms event,
    Emitter<ProgramListState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ProgramListLoaded) return;
    if (!currentState.hasMore || currentState.isLoadingMore) return;

    print('📋 Loading more programs: page=${currentState.currentPage + 1}');

    // Show loading indicator for pagination
    emit(currentState.copyWith(isLoadingMore: true));

    final nextPage = currentState.currentPage + 1;

    final result = await _getProgramsUseCase(
      GetProgramsParams(
        companyUID: event.companyUID,
        page: nextPage,
        limit: _pageSize,
        forceRefresh: false,
      ),
    );

    result.fold(
      (failure) {
        print('❌ Failed to load more programs: ${failure.message}');
        // Return to previous state on error
        emit(currentState.copyWith(isLoadingMore: false));
      },
      (newPrograms) {
        print('✅ Loaded ${newPrograms.length} more programs');
        final allPrograms = [...currentState.programs, ...newPrograms];
        emit(
          ProgramListState.loaded(
            programs: allPrograms,
            currentPage: nextPage,
            hasMore: newPrograms.length >= _pageSize,
            isLoadingMore: false,
          ),
        );
      },
    );
  }

  Future<void> _onRefreshPrograms(
    RefreshPrograms event,
    Emitter<ProgramListState> emit,
  ) async {
    print('🔄 Refreshing programs');
    add(
      LoadPrograms(
        companyUID: event.companyUID,
        page: 1,
        limit: _pageSize,
        forceRefresh: true,
      ),
    );
  }

  Future<void> _onClearCache(
    ClearProgramCache event,
    Emitter<ProgramListState> emit,
  ) async {
    final result = await _clearCacheUseCase();
    result.fold(
      (failure) => emit(ProgramListState.failure(failure.message)),
      (_) => emit(const ProgramListState.initial()),
    );
  }
}
