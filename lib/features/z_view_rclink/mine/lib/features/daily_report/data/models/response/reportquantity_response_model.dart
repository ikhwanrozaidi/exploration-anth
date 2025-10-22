import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/daily_report/domain/entities/response/reportquantity_response_entity.dart';

import 'quantitytype_response_model.dart';
import 'quantityvalue_response_model.dart';

part 'reportquantity_response_model.freezed.dart';
part 'reportquantity_response_model.g.dart';

@freezed
abstract class ReportQuantityResponseModel with _$ReportQuantityResponseModel {
  const ReportQuantityResponseModel._();

  const factory ReportQuantityResponseModel({
    QuantityTypeResponseModel? quantityType,
    List<QuantityValueResponseModel>? quantityValues,
  }) = _ReportQuantityResponseModel;

  factory ReportQuantityResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ReportQuantityResponseModelFromJson(json);

  ReportQuantityResponse toEntity() {
    return ReportQuantityResponse(
      quantityType: quantityType?.toEntity(),
      quantityValues: quantityValues?.map((e) => e.toEntity()).toList(),
    );
  }

  factory ReportQuantityResponseModel.fromEntity(
    ReportQuantityResponse entity,
  ) {
    return ReportQuantityResponseModel(
      quantityType: entity.quantityType != null
          ? QuantityTypeResponseModel.fromEntity(entity.quantityType!)
          : null,
      quantityValues: entity.quantityValues
          ?.map((e) => QuantityValueResponseModel.fromEntity(e))
          .toList(),
    );
  }
}
