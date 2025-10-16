import 'package:freezed_annotation/freezed_annotation.dart';
import 'create_daily_report_model.dart';

part 'update_daily_report_model.freezed.dart';
part 'update_daily_report_model.g.dart';

@freezed
abstract class UpdateDailyReportModel with _$UpdateDailyReportModel {
  const factory UpdateDailyReportModel({
    /// Report name/title
    String? name,

    /// Additional notes for the report
    String? notes,

    /// Weather condition during work
    WeatherCondition? weatherCondition,

    /// Whether work was performed on this day
    bool? workPerformed,

    /// Work scope UID
    String? workScopeUID,

    /// Road UID where work was performed
    String? roadUID,

    /// Total number of workers
    int? totalWorkers,

    /// From section (KM)
    double? fromSection,

    /// To section (KM)
    double? toSection,

    /// Longitude coordinate of the work location
    double? longitude,

    /// Latitude coordinate of the work location
    double? latitude,

    /// Report status
    String? status,

    /// Rejection reason
    String? rejectionReason,
  }) = _UpdateDailyReportModel;

  factory UpdateDailyReportModel.fromJson(Map<String, dynamic> json) =>
      _$UpdateDailyReportModelFromJson(json);
}
