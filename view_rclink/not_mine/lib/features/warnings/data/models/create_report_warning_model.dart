import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_report_warning_model.freezed.dart';
part 'create_report_warning_model.g.dart';

/// Model for creating a warning from a daily report
/// Matches backend CreateReportWarningDto
@freezed
abstract class CreateReportWarningModel with _$CreateReportWarningModel {
  const factory CreateReportWarningModel({
    /// Daily report UID this warning is created from
    required String dailyReportUID,

    /// Array of warning reason UIDs
    required List<String> warningReasonUIDs,

    /// Additional description or notes (optional)
    String? description,
  }) = _CreateReportWarningModel;

  factory CreateReportWarningModel.fromJson(Map<String, dynamic> json) =>
      _$CreateReportWarningModelFromJson(json);
}
