import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/work_quantity_type.dart';
import 'quantity_field_model.dart';

part 'work_quantity_type_model.freezed.dart';
part 'work_quantity_type_model.g.dart';

@freezed
abstract class WorkQuantityTypeModel with _$WorkQuantityTypeModel {
  const WorkQuantityTypeModel._();

  const factory WorkQuantityTypeModel({
    required int id,
    required String uid,
    required String name,
    required String code,
    required int displayOrder,
    required bool hasSegmentBreakdown,
    int? segmentSize,
    int? maxSegmentLength,
    @Default([]) List<QuantityFieldModel> quantityFields,
  }) = _WorkQuantityTypeModel;

  factory WorkQuantityTypeModel.fromJson(Map<String, dynamic> json) =>
      _$WorkQuantityTypeModelFromJson(json);

  WorkQuantityType toEntity() {
    return WorkQuantityType(
      id: id,
      uid: uid,
      name: name,
      code: code,
      displayOrder: displayOrder,
      hasSegmentBreakdown: hasSegmentBreakdown,
      segmentSize: segmentSize,
      maxSegmentLength: maxSegmentLength,
      quantityFields: quantityFields.map((e) => e.toEntity()).toList(),
    );
  }

  factory WorkQuantityTypeModel.fromEntity(WorkQuantityType entity) {
    return WorkQuantityTypeModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      code: entity.code,
      displayOrder: entity.displayOrder,
      hasSegmentBreakdown: entity.hasSegmentBreakdown,
      segmentSize: entity.segmentSize,
      maxSegmentLength: entity.maxSegmentLength,
      quantityFields: entity.quantityFields
          .map((e) => QuantityFieldModel.fromEntity(e))
          .toList(),
    );
  }
}
