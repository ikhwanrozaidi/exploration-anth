import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quantitytype_response_entity.g.dart';

@JsonSerializable()
class QuantityTypeResponse extends Equatable {
  final String? name;
  final String? code;
  final String? uid;
  final int? displayOrder;
  final bool? hasSegmentBreakdown;
  final double? segmentSize;
  final double? maxSegmentLength;

  const QuantityTypeResponse({
    this.name,
    this.code,
    this.uid,
    this.displayOrder,
    this.hasSegmentBreakdown,
    this.segmentSize,
    this.maxSegmentLength,
  });

  factory QuantityTypeResponse.fromJson(Map<String, dynamic> json) =>
      _$QuantityTypeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuantityTypeResponseToJson(this);

  QuantityTypeResponse copyWith({
    String? name,
    String? code,
    String? uid,
    int? displayOrder,
    bool? hasSegmentBreakdown,
    double? segmentSize,
    double? maxSegmentLength,
  }) {
    return QuantityTypeResponse(
      name: name ?? this.name,
      code: code ?? this.code,
      uid: uid ?? this.uid,
      displayOrder: displayOrder ?? this.displayOrder,
      hasSegmentBreakdown: hasSegmentBreakdown ?? this.hasSegmentBreakdown,
      segmentSize: segmentSize ?? this.segmentSize,
      maxSegmentLength: maxSegmentLength ?? this.maxSegmentLength,
    );
  }

  @override
  List<Object?> get props => [
    name,
    code,
    uid,
    displayOrder,
    hasSegmentBreakdown,
    segmentSize,
    maxSegmentLength,
  ];
}
