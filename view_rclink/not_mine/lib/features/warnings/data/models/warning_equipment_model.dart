import 'package:freezed_annotation/freezed_annotation.dart';
import 'work_equipment_model.dart';

part 'warning_equipment_model.freezed.dart';
part 'warning_equipment_model.g.dart';

@freezed
abstract class WarningEquipmentModel with _$WarningEquipmentModel {
  const factory WarningEquipmentModel({
    required WorkEquipmentModel workEquipment,
  }) = _WarningEquipmentModel;

  factory WarningEquipmentModel.fromJson(Map<String, dynamic> json) =>
      _$WarningEquipmentModelFromJson(json);
}
