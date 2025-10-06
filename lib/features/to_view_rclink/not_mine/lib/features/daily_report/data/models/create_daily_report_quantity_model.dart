import 'package:freezed_annotation/freezed_annotation.dart';
import 'create_daily_report_quantity_field_model.dart';
import 'create_daily_report_segment_model.dart';

part 'create_daily_report_quantity_model.freezed.dart';
part 'create_daily_report_quantity_model.g.dart';

@freezed
abstract class CreateDailyReportQuantityModel
    with _$CreateDailyReportQuantityModel {
  const factory CreateDailyReportQuantityModel({
    /// Work quantity type UID
    required String quantityTypeUID,

    /// Sequence number for multiple entries of same type
    @Default(1) int sequenceNo,

    /// Total length/measurement (for segment-based quantities)
    double? totalLength,

    /// Notes for this quantity entry
    String? notes,

    /// Field values for this quantity
    required List<CreateDailyReportQuantityFieldModel> quantityValues,

    /// Segment breakdowns (for quantities with segment support)
    List<CreateDailyReportSegmentModel>? segments,
  }) = _CreateDailyReportQuantityModel;

  factory CreateDailyReportQuantityModel.fromJson(Map<String, dynamic> json) =>
      _$CreateDailyReportQuantityModelFromJson(json);
}
