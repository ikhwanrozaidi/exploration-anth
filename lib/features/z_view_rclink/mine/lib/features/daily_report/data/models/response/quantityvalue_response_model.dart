import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rclink_app/features/daily_report/domain/entities/response/quantityvalue_response_entity.dart';
import 'quantityfield_response_model.dart';

part 'quantityvalue_response_model.freezed.dart';
part 'quantityvalue_response_model.g.dart';

@freezed
abstract class QuantityValueResponseModel with _$QuantityValueResponseModel {
  const QuantityValueResponseModel._();

  const factory QuantityValueResponseModel({
    String? value,
    QuantityFieldResponseModel? quantityField,
  }) = _QuantityValueResponseModel;

  factory QuantityValueResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuantityValueResponseModelFromJson(json);

  QuantityValueResponse toEntity() {
    return QuantityValueResponse(
      value: value,
      quantityField: quantityField?.toEntity(),
    );
  }

  factory QuantityValueResponseModel.fromEntity(QuantityValueResponse entity) {
    return QuantityValueResponseModel(
      value: entity.value,
      quantityField: entity.quantityField != null
          ? QuantityFieldResponseModel.fromEntity(entity.quantityField!)
          : null,
    );
  }
}
