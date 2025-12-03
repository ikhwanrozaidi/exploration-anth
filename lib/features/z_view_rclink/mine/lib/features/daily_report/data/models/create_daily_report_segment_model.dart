import 'package:freezed_annotation/freezed_annotation.dart';
import 'create_daily_report_quantity_field_model.dart';

part 'create_daily_report_segment_model.freezed.dart';
part 'create_daily_report_segment_model.g.dart';

@freezed
abstract class CreateDailyReportSegmentModel
    with _$CreateDailyReportSegmentModel {
  const factory CreateDailyReportSegmentModel({
    /// Segment number (1, 2, 3...)
    required int segmentNumber,

    /// Start distance in meters
    required double startDistance,

    /// End distance in meters
    required double endDistance,

    /// Segment field values
    required List<CreateDailyReportQuantityFieldModel> segmentValues,
  }) = _CreateDailyReportSegmentModel;

  factory CreateDailyReportSegmentModel.fromJson(Map<String, dynamic> json) =>
      _$CreateDailyReportSegmentModelFromJson(json);
}
