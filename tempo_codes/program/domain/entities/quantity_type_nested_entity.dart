import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'quantity_field_nested_entity.dart';

part 'quantity_type_nested_entity.g.dart';

@JsonSerializable()
class QuantityTypeNested extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? code;
  final String? description;
  final int? workScopeID;
  final int? companyID;
  final int? displayOrder;
  final bool? isActive;
  final bool? hasSegmentBreakdown;
  final int? segmentSize;
  final int? maxSegmentLength;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;
  final List<QuantityFieldNested>? quantityFields;

  // Additional fields from program setting relationship
  final int? programSettingID;
  final int? quantityTypeID;
  final int? settingDisplayOrder;
  final bool? isRequiredInSetting;

  const QuantityTypeNested({
    this.id,
    this.uid,
    this.name,
    this.code,
    this.description,
    this.workScopeID,
    this.companyID,
    this.displayOrder,
    this.isActive,
    this.hasSegmentBreakdown,
    this.segmentSize,
    this.maxSegmentLength,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.quantityFields,
    this.programSettingID,
    this.quantityTypeID,
    this.settingDisplayOrder,
    this.isRequiredInSetting,
  });

  factory QuantityTypeNested.fromJson(Map<String, dynamic> json) =>
      _$QuantityTypeNestedFromJson(json);

  Map<String, dynamic> toJson() => _$QuantityTypeNestedToJson(this);

  QuantityTypeNested copyWith({
    int? id,
    String? uid,
    String? name,
    String? code,
    String? description,
    int? workScopeID,
    int? companyID,
    int? displayOrder,
    bool? isActive,
    bool? hasSegmentBreakdown,
    int? segmentSize,
    int? maxSegmentLength,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    List<QuantityFieldNested>? quantityFields,
    int? programSettingID,
    int? quantityTypeID,
    int? settingDisplayOrder,
    bool? isRequiredInSetting,
  }) {
    return QuantityTypeNested(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      workScopeID: workScopeID ?? this.workScopeID,
      companyID: companyID ?? this.companyID,
      displayOrder: displayOrder ?? this.displayOrder,
      isActive: isActive ?? this.isActive,
      hasSegmentBreakdown: hasSegmentBreakdown ?? this.hasSegmentBreakdown,
      segmentSize: segmentSize ?? this.segmentSize,
      maxSegmentLength: maxSegmentLength ?? this.maxSegmentLength,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      quantityFields: quantityFields ?? this.quantityFields,
      programSettingID: programSettingID ?? this.programSettingID,
      quantityTypeID: quantityTypeID ?? this.quantityTypeID,
      settingDisplayOrder: settingDisplayOrder ?? this.settingDisplayOrder,
      isRequiredInSetting: isRequiredInSetting ?? this.isRequiredInSetting,
    );
  }

  @override
  List<Object?> get props => [
    id,
    uid,
    name,
    code,
    description,
    workScopeID,
    companyID,
    displayOrder,
    isActive,
    hasSegmentBreakdown,
    segmentSize,
    maxSegmentLength,
    createdAt,
    updatedAt,
    deletedAt,
    quantityFields,
    programSettingID,
    quantityTypeID,
    settingDisplayOrder,
    isRequiredInSetting,
  ];
}
