import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/daily_report_equipment.dart';

part 'daily_report_equipment_model.freezed.dart';
part 'daily_report_equipment_model.g.dart';

@freezed
abstract class DailyReportEquipmentModel with _$DailyReportEquipmentModel {
  const DailyReportEquipmentModel._();

  const factory DailyReportEquipmentModel({
    required String name,
    required String uid,
  }) = _DailyReportEquipmentModel;

  factory DailyReportEquipmentModel.fromJson(Map<String, dynamic> json) =>
      _$DailyReportEquipmentModelFromJson(json);

  DailyReportEquipment toEntity() {
    return DailyReportEquipment(name: name, uid: uid);
  }
}
