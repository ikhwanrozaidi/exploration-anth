import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/warning_daily_report.dart';
import 'warning_equipment_model.dart';
import '../../../daily_report/data/models/report_quantities_model.dart';

part 'warning_daily_report_model.freezed.dart';
part 'warning_daily_report_model.g.dart';

@freezed
abstract class WarningDailyReportModel with _$WarningDailyReportModel {
  const WarningDailyReportModel._();

  const factory WarningDailyReportModel({
    required int id,
    required String uid,
    required String name,
    required DateTime createdAt,
    required String status,
    required bool workPerformed,
    @Default([]) List<WarningEquipmentModel> reportEquipments,
    @Default([]) List<ReportQuantitiesModel> reportQuantities,
  }) = _WarningDailyReportModel;

  factory WarningDailyReportModel.fromJson(Map<String, dynamic> json) =>
      _$WarningDailyReportModelFromJson(json);

  WarningDailyReport toEntity() {
    return WarningDailyReport(
      id: id,
      uid: uid,
      name: name,
      createdAt: createdAt,
      status: status,
      workPerformed: workPerformed,
      equipmentNames: reportEquipments
          .map((e) => e.workEquipment.name)
          .toList(),
      reportQuantities: reportQuantities.map((q) => q.toEntity()).toList(),
    );
  }
}
