import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/quantity_value.dart';

part 'quantity_field_model.freezed.dart';
part 'quantity_field_model.g.dart';

@freezed
abstract class QuantityFieldModel with _$QuantityFieldModel {
  const QuantityFieldModel._();

  const factory QuantityFieldModel({
    required String name,
    required String fieldType,
    String? unit,
    required String uid,
  }) = _QuantityFieldModel;

  factory QuantityFieldModel.fromJson(Map<String, dynamic> json) =>
      _$QuantityFieldModelFromJson(json);

  QuantityField toEntity() {
    return QuantityField(
      name: name,
      fieldType: fieldType,
      unit: unit,
      uid: uid,
    );
  }
}
