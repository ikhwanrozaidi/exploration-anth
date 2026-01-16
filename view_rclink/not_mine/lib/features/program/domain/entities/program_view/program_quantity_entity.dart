import 'package:json_annotation/json_annotation.dart';

import '../quantity_field_nested_entity.dart';
import '../quantity_type_nested_entity.dart';

part 'program_quantity_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ProgramQuantity {
  final int? id;
  final String? uid;
  final int? programID;
  final int? quantityTypeID;
  final int? sequenceNo;
  final String? totalLength;
  final String? notes;
  final String? createdAt;
  final String? updatedAt;

  final QuantityTypeNested? quantityType;
  final List<ProgramQuantityValue>? quantityValues;
  final List<ProgramQuantitySegment>? segments;

  const ProgramQuantity({
    this.id,
    this.uid,
    this.programID,
    this.quantityTypeID,
    this.sequenceNo,
    this.totalLength,
    this.notes,
    this.createdAt,
    this.updatedAt,
    this.quantityType,
    this.quantityValues,
    this.segments,
  });

  factory ProgramQuantity.fromJson(Map<String, dynamic> json) =>
      _$ProgramQuantityFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramQuantityToJson(this);

  ProgramQuantity copyWith({
    int? id,
    String? uid,
    int? programID,
    int? quantityTypeID,
    int? sequenceNo,
    String? totalLength,
    String? notes,
    String? createdAt,
    String? updatedAt,
    QuantityTypeNested? quantityType,
    List<ProgramQuantityValue>? quantityValues,
    List<ProgramQuantitySegment>? segments,
  }) {
    return ProgramQuantity(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      programID: programID ?? this.programID,
      quantityTypeID: quantityTypeID ?? this.quantityTypeID,
      sequenceNo: sequenceNo ?? this.sequenceNo,
      totalLength: totalLength ?? this.totalLength,
      notes: notes ?? this.notes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      quantityType: quantityType ?? this.quantityType,
      quantityValues: quantityValues ?? this.quantityValues,
      segments: segments ?? this.segments,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class ProgramQuantityValue {
  final int? id;
  final int? programQuantityID;
  final int? segmentID;
  final int? quantityFieldID;
  final String? value;
  final String? createdAt;
  final String? updatedAt;

  final QuantityFieldNested? quantityField;

  const ProgramQuantityValue({
    this.id,
    this.programQuantityID,
    this.segmentID,
    this.quantityFieldID,
    this.value,
    this.createdAt,
    this.updatedAt,
    this.quantityField,
  });

  factory ProgramQuantityValue.fromJson(Map<String, dynamic> json) =>
      _$ProgramQuantityValueFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramQuantityValueToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProgramQuantitySegment {
  final int? id;
  final int? programQuantityID;
  final int? segmentNumber;
  final String? startDistance;
  final String? endDistance;
  final String? createdAt;
  final String? updatedAt;

  final List<ProgramQuantityValue>? segmentValues;

  const ProgramQuantitySegment({
    this.id,
    this.programQuantityID,
    this.segmentNumber,
    this.startDistance,
    this.endDistance,
    this.createdAt,
    this.updatedAt,
    this.segmentValues,
  });

  factory ProgramQuantitySegment.fromJson(Map<String, dynamic> json) =>
      _$ProgramQuantitySegmentFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramQuantitySegmentToJson(this);
}
