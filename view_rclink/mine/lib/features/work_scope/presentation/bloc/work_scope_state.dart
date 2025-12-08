import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/errors/failures.dart';
import '../../domain/entities/work_scope.dart';

part 'work_scope_state.freezed.dart';

@freezed
class WorkScopeState with _$WorkScopeState {
  const factory WorkScopeState.initial() = WorkScopeInitial;
  const factory WorkScopeState.loading() = WorkScopeLoading;
  const factory WorkScopeState.loaded(List<WorkScope> workScopes) =
      WorkScopeLoaded;
  const factory WorkScopeState.error(Failure failure) = WorkScopeError;
}
