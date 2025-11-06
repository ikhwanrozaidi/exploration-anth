import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/get_work_scopes_usecase.dart';
import 'work_scope_event.dart';
import 'work_scope_state.dart';

@lazySingleton
class WorkScopeBloc extends Bloc<WorkScopeEvent, WorkScopeState> {
  final GetWorkScopesUseCase _getWorkScopesUseCase;

  WorkScopeBloc(this._getWorkScopesUseCase)
    : super(const WorkScopeState.initial()) {
    on<LoadWorkScopes>(_onLoadWorkScopes);
  }

  Future<void> _onLoadWorkScopes(
    LoadWorkScopes event,
    Emitter<WorkScopeState> emit,
  ) async {
    emit(const WorkScopeState.loading());

    final result = await _getWorkScopesUseCase(
      GetWorkScopesParams(
        forceRefresh: event.forceRefresh,
        cacheTimeout: event.cacheTimeout,
      ),
    );

    result.fold(
      (failure) => emit(WorkScopeState.error(failure)),
      (workScopes) => emit(WorkScopeState.loaded(workScopes)),
    );
  }
}
