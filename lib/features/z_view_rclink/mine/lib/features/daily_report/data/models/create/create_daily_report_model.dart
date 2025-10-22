import 'package:freezed_annotation/freezed_annotation.dart';
import 'create_daily_report_equipment_model.dart';
import 'create_daily_report_quantity_model.dart';

part 'create_daily_report_model.freezed.dart';
part 'create_daily_report_model.g.dart';

/// Weather condition enum to match backend
enum WeatherCondition {
  @JsonValue('SUNNY')
  sunny,
  @JsonValue('RAINY')
  rainy,
  @JsonValue('CLOUDY')
  cloudy,
  @JsonValue('FOGGY')
  foggy,
  @JsonValue('WINDY')
  windy,
}

@freezed
abstract class CreateDailyReportModel with _$CreateDailyReportModel {
  const factory CreateDailyReportModel({
    /// Report name/title
    required String name,

    /// Additional notes for the report
    String? notes,

    /// Weather condition during work
    required WeatherCondition weatherCondition,

    /// Whether work was performed on this day
    required bool workPerformed,

    /// Work scope UID
    required String workScopeUID,

    /// Road UID where work was performed
    required String roadUID,

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

    /// Equipment used in this report
    List<CreateDailyReportEquipmentModel>? equipments,

    /// Work quantities for this report
    List<CreateDailyReportQuantityModel>? quantities,
  }) = _CreateDailyReportModel;

  factory CreateDailyReportModel.fromJson(Map<String, dynamic> json) =>
      _$CreateDailyReportModelFromJson(json);
}
