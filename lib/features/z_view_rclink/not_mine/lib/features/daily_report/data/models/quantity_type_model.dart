import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/quantity_value_response.dart';

part 'quantity_type_model.freezed.dart';
part 'quantity_type_model.g.dart';

@freezed
abstract class QuantityTypeModel with _$QuantityTypeModel {
  const QuantityTypeModel._();

  const factory QuantityTypeModel({
    required String name,
    required String code,
    required String uid,
  }) = _QuantityTypeModel;

  factory QuantityTypeModel.fromJson(Map<String, dynamic> json) =>
      _$QuantityTypeModelFromJson(json);

  QuantityTypeResponse toEntity() {
    return QuantityTypeResponse(name: name, code: code, uid: uid);
  }
}
