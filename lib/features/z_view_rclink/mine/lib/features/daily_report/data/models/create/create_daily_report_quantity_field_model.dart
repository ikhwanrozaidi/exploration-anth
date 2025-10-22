import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_daily_report_quantity_field_model.freezed.dart';
part 'create_daily_report_quantity_field_model.g.dart';

@freezed
abstract class CreateDailyReportQuantityFieldModel
    with _$CreateDailyReportQuantityFieldModel {
  const factory CreateDailyReportQuantityFieldModel({
    /// Quantity field UID
    required String quantityFieldUID,

    /// Field value
    required String value,
  }) = _CreateDailyReportQuantityFieldModel;

  factory CreateDailyReportQuantityFieldModel.fromJson(
    Map<String, dynamic> json,
  ) => _$CreateDailyReportQuantityFieldModelFromJson(json);
}
