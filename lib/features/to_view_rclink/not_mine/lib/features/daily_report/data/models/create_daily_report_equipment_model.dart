import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_daily_report_equipment_model.freezed.dart';
part 'create_daily_report_equipment_model.g.dart';

@freezed
abstract class CreateDailyReportEquipmentModel
    with _$CreateDailyReportEquipmentModel {
  const factory CreateDailyReportEquipmentModel({
    /// Work equipment UID
    required String workEquipmentUID,
  }) = _CreateDailyReportEquipmentModel;

  factory CreateDailyReportEquipmentModel.fromJson(Map<String, dynamic> json) =>
      _$CreateDailyReportEquipmentModelFromJson(json);
}
