import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_scope.dart';

import 'work_equipment_model.dart';
import 'work_quantity_type_model.dart';

part 'work_scope_model.freezed.dart';
part 'work_scope_model.g.dart';

@freezed
abstract class WorkScopeModel with _$WorkScopeModel {
  const WorkScopeModel._();

  const factory WorkScopeModel({
    required int id,
    required String uid,
    required String name,
    required String code,
    required String description,
    required bool allowMultipleQuantities,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    required int companyID,
    @Default([]) List<WorkQuantityTypeModel> workQuantityTypes,
    @Default([]) List<WorkEquipmentModel> workEquipments,
  }) = _WorkScopeModel;

  factory WorkScopeModel.fromJson(Map<String, dynamic> json) =>
      _$WorkScopeModelFromJson(json);

  WorkScope toEntity() {
    return WorkScope(
      id: id,
      uid: uid,
      name: name,
      code: code,
      description: description,
      allowMultipleQuantities: allowMultipleQuantities,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      companyID: companyID,
      workQuantityTypes: workQuantityTypes.map((e) => e.toEntity()).toList(),
      workEquipments: workEquipments.map((e) => e.toEntity()).toList(),
    );
  }

  factory WorkScopeModel.fromEntity(WorkScope entity) {
    return WorkScopeModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      code: entity.code,
      description: entity.description,
      allowMultipleQuantities: entity.allowMultipleQuantities,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
      companyID: entity.companyID,
      workQuantityTypes: entity.workQuantityTypes
          .map((e) => WorkQuantityTypeModel.fromEntity(e))
          .toList(),
      workEquipments: entity.workEquipments
          .map((e) => WorkEquipmentModel.fromEntity(e))
          .toList(),
    );
  }
}
