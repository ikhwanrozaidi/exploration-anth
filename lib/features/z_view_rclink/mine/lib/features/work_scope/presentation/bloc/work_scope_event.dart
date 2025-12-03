import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_scope_event.freezed.dart';

@freezed
abstract class WorkScopeEvent with _$WorkScopeEvent {
  const factory WorkScopeEvent.loadWorkScopes({
    @Default(false) bool forceRefresh,
    Duration? cacheTimeout,
  }) = LoadWorkScopes;
}
