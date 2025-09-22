import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/scope_of_work.dart';
import 'work_equipment_model.dart';
import 'work_quantity_type_model.dart';

part 'scope_of_work_model.freezed.dart';
part 'scope_of_work_model.g.dart';

@freezed
abstract class ScopeOfWorkModel with _$ScopeOfWorkModel {
  const ScopeOfWorkModel._();

  const factory ScopeOfWorkModel({
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
  }) = _ScopeOfWorkModel;

  factory ScopeOfWorkModel.fromJson(Map<String, dynamic> json) =>
      _$ScopeOfWorkModelFromJson(json);

  ScopeOfWork toEntity() {
    return ScopeOfWork(
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

  factory ScopeOfWorkModel.fromEntity(ScopeOfWork entity) {
    return ScopeOfWorkModel(
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
