import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_equipment_model.freezed.dart';
part 'work_equipment_model.g.dart';

@freezed
abstract class WorkEquipmentModel with _$WorkEquipmentModel {
  const factory WorkEquipmentModel({
    required String name,
    required String uid,
  }) = _WorkEquipmentModel;

  factory WorkEquipmentModel.fromJson(Map<String, dynamic> json) =>
      _$WorkEquipmentModelFromJson(json);
}
