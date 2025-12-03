import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/warning.dart';

part 'warning_state.freezed.dart';

@freezed
class WarningState with _$WarningState {
  const factory WarningState.initial() = WarningInitial;

  const factory WarningState.loading() = WarningLoading;

  const factory WarningState.loaded({
    required List<Warning> warnings,
    required int currentPage,
    required bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = WarningLoaded;

  const factory WarningState.loadingMore({
    required List<Warning> warnings,
    required int currentPage,
  }) = WarningLoadingMore;

  const factory WarningState.error({
    required Failure failure,
    List<Warning>? cachedWarnings,
  }) = WarningError;
}
