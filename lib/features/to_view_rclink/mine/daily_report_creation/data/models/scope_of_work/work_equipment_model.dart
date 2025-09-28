import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/scope_of_work/work_equipment.dart';

part 'work_equipment_model.freezed.dart';
part 'work_equipment_model.g.dart';

@freezed
abstract class WorkEquipmentModel with _$WorkEquipmentModel {
  const WorkEquipmentModel._();

  const factory WorkEquipmentModel({
    required int id,
    required String uid,
    required String name,
    required String code,
  }) = _WorkEquipmentModel;

  factory WorkEquipmentModel.fromJson(Map<String, dynamic> json) =>
      _$WorkEquipmentModelFromJson(json);

  WorkEquipment toEntity() {
    return WorkEquipment(id: id, uid: uid, name: name, code: code);
  }

  factory WorkEquipmentModel.fromEntity(WorkEquipment entity) {
    return WorkEquipmentModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      code: entity.code,
    );
  }
}
