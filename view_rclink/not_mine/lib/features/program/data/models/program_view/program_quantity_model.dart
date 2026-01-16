import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/program_view/program_quantity_entity.dart';
import '../quantity_field_nested_model.dart';
import '../quantity_type_nested_model.dart';

part 'program_quantity_model.freezed.dart';
part 'program_quantity_model.g.dart';

@freezed
abstract class ProgramQuantityModel with _$ProgramQuantityModel {
  const factory ProgramQuantityModel({
    int? id,
    String? uid,
    int? programID,
    int? quantityTypeID,
    int? sequenceNo,
    String? totalLength,
    String? notes,
    String? createdAt,
    String? updatedAt,
    QuantityTypeNestedModel? quantityType,
    List<ProgramQuantityValueModel>? quantityValues,
    List<ProgramQuantitySegmentModel>? segments,
  }) = _ProgramQuantityModel;

  factory ProgramQuantityModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramQuantityModelFromJson(json);
}

@freezed
abstract class ProgramQuantityValueModel with _$ProgramQuantityValueModel {
  const factory ProgramQuantityValueModel({
    int? id,
    int? programQuantityID,
    int? segmentID,
    int? quantityFieldID,
    String? value,
    String? createdAt,
    String? updatedAt,
    QuantityFieldNestedModel? quantityField,
  }) = _ProgramQuantityValueModel;

  factory ProgramQuantityValueModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramQuantityValueModelFromJson(json);
}

@freezed
abstract class ProgramQuantitySegmentModel with _$ProgramQuantitySegmentModel {
  const factory ProgramQuantitySegmentModel({
    int? id,
    int? programQuantityID,
    int? segmentNumber,
    String? startDistance,
    String? endDistance,
    String? createdAt,
    String? updatedAt,
    List<ProgramQuantityValueModel>? segmentValues,
  }) = _ProgramQuantitySegmentModel;

  factory ProgramQuantitySegmentModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramQuantitySegmentModelFromJson(json);
}

extension ProgramQuantityModelX on ProgramQuantityModel {
  ProgramQuantity toEntity() {
    return ProgramQuantity(
      id: id,
      uid: uid,
      programID: programID,
      quantityTypeID: quantityTypeID,
      sequenceNo: sequenceNo,
      totalLength: totalLength,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
      quantityType: quantityType?.toEntity(),
      quantityValues: quantityValues?.map((v) => v.toEntity()).toList(),
      segments: segments?.map((s) => s.toEntity()).toList(),
    );
  }

  static ProgramQuantityModel fromEntity(ProgramQuantity entity) {
    return ProgramQuantityModel(
      id: entity.id,
      uid: entity.uid,
      programID: entity.programID,
      quantityTypeID: entity.quantityTypeID,
      sequenceNo: entity.sequenceNo,
      totalLength: entity.totalLength,
      notes: entity.notes,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      quantityType: entity.quantityType != null
          ? QuantityTypeNestedModelX.fromEntity(entity.quantityType!)
          : null,
      quantityValues: entity.quantityValues
          ?.map((v) => ProgramQuantityValueModelX.fromEntity(v))
          .toList(),
      segments: entity.segments
          ?.map((s) => ProgramQuantitySegmentModelX.fromEntity(s))
          .toList(),
    );
  }
}

extension ProgramQuantityValueModelX on ProgramQuantityValueModel {
  ProgramQuantityValue toEntity() {
    return ProgramQuantityValue(
      id: id,
      programQuantityID: programQuantityID,
      segmentID: segmentID,
      quantityFieldID: quantityFieldID,
      value: value,
      createdAt: createdAt,
      updatedAt: updatedAt,
      quantityField: quantityField?.toEntity(),
    );
  }

  static ProgramQuantityValueModel fromEntity(ProgramQuantityValue entity) {
    return ProgramQuantityValueModel(
      id: entity.id,
      programQuantityID: entity.programQuantityID,
      segmentID: entity.segmentID,
      quantityFieldID: entity.quantityFieldID,
      value: entity.value,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      quantityField: entity.quantityField != null
          ? QuantityFieldNestedModelX.fromEntity(entity.quantityField!)
          : null,
    );
  }
}

extension ProgramQuantitySegmentModelX on ProgramQuantitySegmentModel {
  ProgramQuantitySegment toEntity() {
    return ProgramQuantitySegment(
      id: id,
      programQuantityID: programQuantityID,
      segmentNumber: segmentNumber,
      startDistance: startDistance,
      endDistance: endDistance,
      createdAt: createdAt,
      updatedAt: updatedAt,
      segmentValues: segmentValues?.map((v) => v.toEntity()).toList(),
    );
  }

  static ProgramQuantitySegmentModel fromEntity(ProgramQuantitySegment entity) {
    return ProgramQuantitySegmentModel(
      id: entity.id,
      programQuantityID: entity.programQuantityID,
      segmentNumber: entity.segmentNumber,
      startDistance: entity.startDistance,
      endDistance: entity.endDistance,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      segmentValues: entity.segmentValues
          ?.map((v) => ProgramQuantityValueModelX.fromEntity(v))
          .toList(),
    );
  }
}
