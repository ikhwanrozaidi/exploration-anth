import 'package:freezed_annotation/freezed_annotation.dart';

part 'warning_details_event.freezed.dart';

@freezed
abstract class WarningDetailsEvent with _$WarningDetailsEvent {
  const factory WarningDetailsEvent.loadWarningDetails({
    required String warningUID,
    @Default(false) bool forceRefresh,
  }) = LoadWarningDetails;

  const factory WarningDetailsEvent.refreshWarningDetails({
    required String warningUID,
  }) = RefreshWarningDetails;
}
