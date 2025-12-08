import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/report_quantity.dart';
import 'quantity_type_model.dart';
import 'quantity_value_model.dart';

part 'report_quantities_model.freezed.dart';
part 'report_quantities_model.g.dart';

@freezed
abstract class ReportQuantitiesModel with _$ReportQuantitiesModel {
  const ReportQuantitiesModel._();

  const factory ReportQuantitiesModel({
    required QuantityTypeModel quantityType,
    required List<QuantityValueModel> quantityValues,
  }) = _ReportQuantitiesModel;

  factory ReportQuantitiesModel.fromJson(Map<String, dynamic> json) =>
      _$ReportQuantitiesModelFromJson(json);

  ReportQuantity toEntity() {
    return ReportQuantity(
      quantityType: quantityType.toEntity(),
      quantityValues: quantityValues.map((v) => v.toEntity()).toList(),
    );
  }
}
