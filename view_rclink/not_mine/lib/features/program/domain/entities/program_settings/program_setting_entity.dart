import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'created_by_nested_entity.dart';
import 'quantity_type_nested_entity.dart';
import 'work_scope_nested_entity.dart';

part 'program_setting_entity.g.dart';

@JsonSerializable()
class ProgramSetting extends Equatable {
  final int? id;
  final String? uid;
  final int? companyID;
  final int? workScopeID;
  final String? calculationType; // SECTION_BASED, FIXED_COUNT
  final String? inputLabel;
  final String? inputValue;
  final String? dividerValue;
  final String? dividerLabel;
  final String? unitMeasurement; // METER, NUMBER
  final bool? photoRequired;
  final bool? isActive;
  final int? createdByID;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final WorkScopeNested? workScope;
  final CreatedByNested? createdBy;
  final List<QuantityTypeNested>? quantityTypes;

  const ProgramSetting({
    this.id,
    this.uid,
    this.companyID,
    this.workScopeID,
    this.calculationType,
    this.inputLabel,
    this.inputValue,
    this.dividerValue,
    this.dividerLabel,
    this.unitMeasurement,
    this.photoRequired,
    this.isActive,
    this.createdByID,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.workScope,
    this.createdBy,
    this.quantityTypes,
  });

  factory ProgramSetting.fromJson(Map<String, dynamic> json) =>
      _$ProgramSettingFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramSettingToJson(this);

  ProgramSetting copyWith({
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
    WorkScopeNested? workScope,
    CreatedByNested? createdBy,
    List<QuantityTypeNested>? quantityTypes,
  }) {
    return ProgramSetting(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      companyID: companyID ?? this.companyID,
      workScopeID: workScopeID ?? this.workScopeID,
      calculationType: calculationType ?? this.calculationType,
      inputLabel: inputLabel ?? this.inputLabel,
      inputValue: inputValue ?? this.inputValue,
      dividerValue: dividerValue ?? this.dividerValue,
      dividerLabel: dividerLabel ?? this.dividerLabel,
      unitMeasurement: unitMeasurement ?? this.unitMeasurement,
      photoRequired: photoRequired ?? this.photoRequired,
      isActive: isActive ?? this.isActive,
      createdByID: createdByID ?? this.createdByID,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      workScope: workScope ?? this.workScope,
      createdBy: createdBy ?? this.createdBy,
      quantityTypes: quantityTypes ?? this.quantityTypes,
    );
  }

  @override
  List<Object?> get props => [
    id,
    uid,
    companyID,
    workScopeID,
    calculationType,
    inputLabel,
    inputValue,
    dividerValue,
    dividerLabel,
    unitMeasurement,
    photoRequired,
    isActive,
    createdByID,
    createdAt,
    updatedAt,
    deletedAt,
    workScope,
    createdBy,
    quantityTypes,
  ];
}
