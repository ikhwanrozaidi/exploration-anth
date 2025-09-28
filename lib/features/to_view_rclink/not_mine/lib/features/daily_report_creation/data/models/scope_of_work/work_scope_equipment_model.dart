import 'package:freezed_annotation/freezed_annotation.dart';
import 'work_equipment_model.dart';

part 'work_scope_equipment_model.freezed.dart';
part 'work_scope_equipment_model.g.dart';

@freezed
abstract class WorkScopeEquipmentModel with _$WorkScopeEquipmentModel {
  const WorkScopeEquipmentModel._();

  const factory WorkScopeEquipmentModel({
    required int id,
    required int workScopeID,
    required int workEquipmentID,
    required int companyID,
    required DateTime createdAt,
    required DateTime updatedAt,
    required WorkEquipmentModel workEquipment,
  }) = _WorkScopeEquipmentModel;

  factory WorkScopeEquipmentModel.fromJson(Map<String, dynamic> json) =>
      _$WorkScopeEquipmentModelFromJson(json);
}
