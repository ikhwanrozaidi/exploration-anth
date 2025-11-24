import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_warning_event.freezed.dart';

@freezed
abstract class CreateWarningEvent with _$CreateWarningEvent {
  /// Event to create a warning from a daily report
  const factory CreateWarningEvent.createWarning({
    required String dailyReportUID,
    required List<String> warningReasonUIDs,
    String? description,
  }) = CreateWarning;
}
