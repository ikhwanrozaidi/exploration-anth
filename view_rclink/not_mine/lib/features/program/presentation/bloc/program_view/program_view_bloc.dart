import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../domain/usecases/clear_program_cache_usecase.dart';
import '../../../domain/usecases/get_program_detail_usecase.dart';
import '../../../domain/usecases/get_program_usecase.dart';
import 'program_view_event.dart';
import 'program_view_state.dart';

@lazySingleton
class ProgramViewBloc extends Bloc<ProgramViewEvent, ProgramViewState> {
  final GetProgramsUseCase _getProgramsUseCase;
  final GetProgramDetailUseCase _getProgramDetailUseCase;
  final ClearProgramCacheUseCase _clearCacheUseCase;

  static const int _pageSize = 10;

  ProgramViewBloc(
    this._getProgramsUseCase,
    this._getProgramDetailUseCase,
    this._clearCacheUseCase,
  ) : super(const ProgramViewState.initial()) {
    on<LoadPrograms>(_onLoadPrograms);
    on<LoadMorePrograms>(_onLoadMorePrograms);
    on<RefreshPrograms>(_onRefreshPrograms);
    on<LoadProgramDetail>(_onLoadProgramDetail);
    on<RefreshProgramDetail>(_onRefreshProgramDetail);
    on<ClearProgramCache>(_onClearCache);
  }

  // ======================================================================
  // LIST EVENT HANDLERS
  // ======================================================================

  Future<void> _onLoadPrograms(
    LoadPrograms event,
    Emitter<ProgramViewState> emit,
  ) async {
    print('📋 Loading programs: page=${event.page}, limit=${event.limit}');
    emit(const ProgramViewState.loading());

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
        emit(ProgramViewState.failure(failure.message));
      },
      (programs) {
        print('✅ Loaded ${programs.length} programs');
        emit(
          ProgramViewState.loaded(
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
    Emitter<ProgramViewState> emit,
  ) async {
    final currentState = state;
    if (currentState is! ProgramViewLoaded) return;
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
          ProgramViewState.loaded(
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
    Emitter<ProgramViewState> emit,
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

  // ======================================================================
  // DETAIL EVENT HANDLERS
  // ======================================================================

  Future<void> _onLoadProgramDetail(
    LoadProgramDetail event,
    Emitter<ProgramViewState> emit,
  ) async {
    print('📄 Loading program detail: ${event.programUID}');
    emit(const ProgramViewState.detailLoading());

    final result = await _getProgramDetailUseCase(
      GetProgramDetailParams(
        companyUID: event.companyUID,
        programUID: event.programUID,
        forceRefresh: event.forceRefresh,
      ),
    );

    result.fold(
      (failure) {
        print('❌ Failed to load program detail: ${failure.message}');
        emit(ProgramViewState.detailFailure(failure.message));
      },
      (program) {
        print('✅ Loaded program detail: ${program.name}');
        emit(ProgramViewState.detailLoaded(program: program));
      },
    );
  }

  Future<void> _onRefreshProgramDetail(
    RefreshProgramDetail event,
    Emitter<ProgramViewState> emit,
  ) async {
    print('🔄 Refreshing program detail: ${event.programUID}');
    add(
      LoadProgramDetail(
        companyUID: event.companyUID,
        programUID: event.programUID,
        forceRefresh: true,
      ),
    );
  }

  // ======================================================================
  // CACHE MANAGEMENT
  // ======================================================================

  Future<void> _onClearCache(
    ClearProgramCache event,
    Emitter<ProgramViewState> emit,
  ) async {
    print('🗑️ Clearing program cache');
    await _clearCacheUseCase();
    emit(const ProgramViewState.initial());
  }
}
