import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/usecases/get_warning_categories_usecase.dart';
import 'warning_categories_event.dart';
import 'warning_categories_state.dart';

@lazySingleton
class WarningCategoriesBloc
    extends Bloc<WarningCategoriesEvent, WarningCategoriesState> {
  final GetWarningCategoriesUseCase _getWarningCategoriesUseCase;

  WarningCategoriesBloc(this._getWarningCategoriesUseCase)
    : super(const WarningCategoriesState.initial()) {
    on<LoadWarningCategories>(_onLoadWarningCategories);
  }

  Future<void> _onLoadWarningCategories(
    LoadWarningCategories event,
    Emitter<WarningCategoriesState> emit,
  ) async {
    emit(const WarningCategoriesState.loading());

    final result = await _getWarningCategoriesUseCase(
      GetWarningCategoriesParams(
        forceRefresh: event.forceRefresh,
        cacheTimeout: event.cacheTimeout,
        warningType: event.warningType,
        workScopeUID: event.workScopeUID,
      ),
    );

    result.fold(
      (failure) => emit(WarningCategoriesState.error(failure)),
      (categories) => emit(WarningCategoriesState.loaded(categories)),
    );
  }
}
