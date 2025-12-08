import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/quantity_value_response.dart';
import 'quantity_field_model.dart';

part 'quantity_value_model.freezed.dart';
part 'quantity_value_model.g.dart';

@freezed
abstract class QuantityValueModel with _$QuantityValueModel {
  const QuantityValueModel._();

  const factory QuantityValueModel({
    required String value,
    required QuantityFieldModel quantityField,
  }) = _QuantityValueModel;

  factory QuantityValueModel.fromJson(Map<String, dynamic> json) =>
      _$QuantityValueModelFromJson(json);

  QuantityValueResponse toEntity() {
    return QuantityValueResponse(
      value: value,
      quantityField: quantityField.toEntity(),
    );
  }
}
