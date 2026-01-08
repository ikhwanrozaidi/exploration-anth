import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/program_setting_entity.dart';
import 'created_by_nested_model.dart';
import 'quantity_type_nested_model.dart';
import 'work_scope_nested_model.dart';

part 'program_setting_model.freezed.dart';
part 'program_setting_model.g.dart';

@freezed
abstract class ProgramSettingModel with _$ProgramSettingModel {
  const factory ProgramSettingModel({
    int? id,
    String? uid,
    int? companyID,
    int? workScopeID,
    String? calculationType, // SECTION_BASED, FIXED_COUNT
    String? inputLabel,
    String? inputValue,
    String? dividerValue,
    String? dividerLabel,
    String? unitMeasurement, // METER, NUMBER
    bool? photoRequired,
    bool? isActive,
    int? createdByID,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    WorkScopeNestedModel? workScope,
    CreatedByNestedModel? createdBy,
    List<QuantityTypeNestedModel>? quantityTypes,
  }) = _ProgramSettingModel;

  factory ProgramSettingModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramSettingModelFromJson(json);
}

extension ProgramSettingModelX on ProgramSettingModel {
  ProgramSetting toEntity() {
    return ProgramSetting(
      id: id,
      uid: uid,
      companyID: companyID,
      workScopeID: workScopeID,
      calculationType: calculationType,
      inputLabel: inputLabel,
      inputValue: inputValue,
      dividerValue: dividerValue,
      dividerLabel: dividerLabel,
      unitMeasurement: unitMeasurement,
      photoRequired: photoRequired,
      isActive: isActive,
      createdByID: createdByID,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      workScope: workScope?.toEntity(),
      createdBy: createdBy?.toEntity(),
      quantityTypes: quantityTypes?.map((qt) => qt.toEntity()).toList(),
    );
  }

  static ProgramSettingModel fromEntity(ProgramSetting entity) {
    return ProgramSettingModel(
      id: entity.id,
      uid: entity.uid,
      companyID: entity.companyID,
      workScopeID: entity.workScopeID,
      calculationType: entity.calculationType,
      inputLabel: entity.inputLabel,
      inputValue: entity.inputValue,
      dividerValue: entity.dividerValue,
      dividerLabel: entity.dividerLabel,
      unitMeasurement: entity.unitMeasurement,
      photoRequired: entity.photoRequired,
      isActive: entity.isActive,
      createdByID: entity.createdByID,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
      workScope: entity.workScope != null
          ? WorkScopeNestedModelX.fromEntity(entity.workScope!)
          : null,
      createdBy: entity.createdBy != null
          ? CreatedByNestedModelX.fromEntity(entity.createdBy!)
          : null,
      quantityTypes: entity.quantityTypes
          ?.map((qt) => QuantityTypeNestedModelX.fromEntity(qt))
          .toList(),
    );
  }
}
