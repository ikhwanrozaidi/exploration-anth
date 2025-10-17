import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'quantityfield_response_entity.dart';

part 'quantityvalue_response_entity.g.dart';

@JsonSerializable()
class QuantityValueResponse extends Equatable {
  final String? value;
  final QuantityFieldResponse? quantityField;

  const QuantityValueResponse({this.value, this.quantityField});

  factory QuantityValueResponse.fromJson(Map<String, dynamic> json) =>
      _$QuantityValueResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuantityValueResponseToJson(this);

  QuantityValueResponse copyWith({
    String? value,
    QuantityFieldResponse? quantityField,
  }) {
    return QuantityValueResponse(
      value: value ?? this.value,
      quantityField: quantityField ?? this.quantityField,
    );
  }

  @override
  List<Object?> get props => [value, quantityField];
}
