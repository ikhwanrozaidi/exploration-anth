import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import '../program_settings/quantity_type_nested_entity.dart';

part 'program_quantity_entity.g.dart';

@JsonSerializable()
class ProgramQuantity extends Equatable {
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
  final List<Map<String, dynamic>>? quantityValues;
  final List<Map<String, dynamic>>? segments;

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
    List<Map<String, dynamic>>? quantityValues,
    List<Map<String, dynamic>>? segments,
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

  @override
  List<Object?> get props => [
    id,
    uid,
    programID,
    quantityTypeID,
    sequenceNo,
    totalLength,
    notes,
    createdAt,
    updatedAt,
    quantityType,
    quantityValues,
    segments,
  ];
}
