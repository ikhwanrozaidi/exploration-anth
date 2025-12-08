import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/warning.dart';

part 'warning_details_state.freezed.dart';

@freezed
class WarningDetailsState with _$WarningDetailsState {
  const factory WarningDetailsState.initial() = WarningDetailsInitial;

  const factory WarningDetailsState.loading() = WarningDetailsLoading;

  const factory WarningDetailsState.loaded({required Warning warning}) =
      WarningDetailsLoaded;

  const factory WarningDetailsState.error({
    required Failure failure,
    Warning? cachedWarning,
  }) = WarningDetailsError;
}
