import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/quantity_type_nested_entity.dart';
import 'quantity_field_nested_model.dart';

part 'quantity_type_nested_model.freezed.dart';
part 'quantity_type_nested_model.g.dart';

@freezed
abstract class QuantityTypeNestedModel with _$QuantityTypeNestedModel {
  const factory QuantityTypeNestedModel({
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
    List<QuantityFieldNestedModel>? quantityFields,
  }) = _QuantityTypeNestedModel;

  factory QuantityTypeNestedModel.fromJson(Map<String, dynamic> json) =>
      _$QuantityTypeNestedModelFromJson(json);
}

extension QuantityTypeNestedModelX on QuantityTypeNestedModel {
  QuantityTypeNested toEntity() {
    return QuantityTypeNested(
      id: id,
      uid: uid,
      name: name,
      code: code,
      description: description,
      workScopeID: workScopeID,
      companyID: companyID,
      displayOrder: displayOrder,
      isActive: isActive,
      hasSegmentBreakdown: hasSegmentBreakdown,
      segmentSize: segmentSize,
      maxSegmentLength: maxSegmentLength,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      quantityFields: quantityFields?.map((field) => field.toEntity()).toList(),
    );
  }

  static QuantityTypeNestedModel fromEntity(QuantityTypeNested entity) {
    return QuantityTypeNestedModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      code: entity.code,
      description: entity.description,
      workScopeID: entity.workScopeID,
      companyID: entity.companyID,
      displayOrder: entity.displayOrder,
      isActive: entity.isActive,
      hasSegmentBreakdown: entity.hasSegmentBreakdown,
      segmentSize: entity.segmentSize,
      maxSegmentLength: entity.maxSegmentLength,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
      quantityFields: entity.quantityFields
          ?.map((field) => QuantityFieldNestedModelX.fromEntity(field))
          .toList(),
    );
  }
}
