import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/program_setting_entity.dart';
import 'created_by_nested_model.dart';
import 'work_scope_nested_model.dart';
import 'quantity_type_nested_model.dart';

part 'program_setting_model.freezed.dart';
// part 'program_setting_model.g.dart';

@freezed
abstract class ProgramSettingModel with _$ProgramSettingModel {
  const factory ProgramSettingModel({
    int? id,
    String? uid,
    int? companyID,
    int? workScopeID,
    String? calculationType,
    String? inputLabel,
    String? inputValue,
    String? dividerValue,
    String? dividerLabel,
    String? unitMeasurement,
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

  factory ProgramSettingModel.fromJson(Map<String, dynamic> json) {
    return ProgramSettingModel(
      id: json['id'] as int?,
      uid: json['uid'] as String?,
      companyID: json['companyID'] as int?,
      workScopeID: json['workScopeID'] as int?,
      calculationType: json['calculationType'] as String?,
      inputLabel: json['inputLabel'] as String?,
      inputValue: json['inputValue'] as String?,
      dividerValue: json['dividerValue'] as String?,
      dividerLabel: json['dividerLabel'] as String?,
      unitMeasurement: json['unitMeasurement'] as String?,
      photoRequired: json['photoRequired'] as bool?,
      isActive: json['isActive'] as bool?,
      createdByID: json['createdByID'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      workScope: json['workScope'] != null
          ? WorkScopeNestedModel.fromJson(
              json['workScope'] as Map<String, dynamic>,
            )
          : null,
      createdBy: json['createdBy'] != null
          ? CreatedByNestedModel.fromJson(
              json['createdBy'] as Map<String, dynamic>,
            )
          : null,
      // ✅ FIX: Parse nested quantityType structure
      quantityTypes: json['quantityTypes'] != null
          ? (json['quantityTypes'] as List<dynamic>)
                .map((item) {
                  // Each item is a junction object with nested 'quantityType'
                  if (item is Map<String, dynamic>) {
                    final quantityTypeData = item['quantityType'];
                    if (quantityTypeData != null &&
                        quantityTypeData is Map<String, dynamic>) {
                      return QuantityTypeNestedModel.fromJson(quantityTypeData);
                    }
                  }
                  return null;
                })
                .whereType<QuantityTypeNestedModel>() // Filter out nulls
                .toList()
          : null,
    );
  }
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
