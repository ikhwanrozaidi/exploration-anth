import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'quantity_field.dart';

part 'work_quantity_type.g.dart';

@JsonSerializable()
class WorkQuantityType extends Equatable {
  final int id;
  final String uid;
  final String name;
  final String code;
  final int displayOrder;
  final bool hasSegmentBreakdown;
  final int? segmentSize;
  final int? maxSegmentLength;
  final List<QuantityField> quantityFields;

  const WorkQuantityType({
    required this.id,
    required this.uid,
    required this.name,
    required this.code,
    required this.displayOrder,
    required this.hasSegmentBreakdown,
    this.segmentSize,
    this.maxSegmentLength,
    required this.quantityFields,
  });

  @override
  List<Object?> get props => [
    id,
    uid,
    name,
    code,
    displayOrder,
    hasSegmentBreakdown,
    segmentSize,
    maxSegmentLength,
    quantityFields,
  ];

  factory WorkQuantityType.fromJson(Map<String, dynamic> json) =>
      _$WorkQuantityTypeFromJson(json);
  Map<String, dynamic> toJson() => _$WorkQuantityTypeToJson(this);
}
