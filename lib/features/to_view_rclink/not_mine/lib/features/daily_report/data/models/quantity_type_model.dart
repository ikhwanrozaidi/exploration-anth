import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/quantity_value.dart';

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

  QuantityType toEntity() {
    return QuantityType(name: name, code: code, uid: uid);
  }
}
