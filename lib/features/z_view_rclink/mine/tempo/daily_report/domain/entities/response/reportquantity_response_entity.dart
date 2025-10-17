import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'quantitytype_response_entity.dart';
import 'quantityvalue_response_entity.dart';

part 'reportquantity_response_entity.g.dart';

@JsonSerializable()
class ReportQuantityResponse extends Equatable {
  final QuantityTypeResponse? quantityType;
  final List<QuantityValueResponse>? quantityValues;

  const ReportQuantityResponse({this.quantityType, this.quantityValues});

  factory ReportQuantityResponse.fromJson(Map<String, dynamic> json) =>
      _$ReportQuantityResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReportQuantityResponseToJson(this);

  ReportQuantityResponse copyWith({
    QuantityTypeResponse? quantityType,
    List<QuantityValueResponse>? quantityValues,
  }) {
    return ReportQuantityResponse(
      quantityType: quantityType ?? this.quantityType,
      quantityValues: quantityValues ?? this.quantityValues,
    );
  }

  @override
  List<Object?> get props => [quantityType, quantityValues];
}
