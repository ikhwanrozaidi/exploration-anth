import 'package:freezed_annotation/freezed_annotation.dart';
import 'daily_report_model.dart';

part 'daily_report_response_model.freezed.dart';
part 'daily_report_response_model.g.dart';

/// Custom wrapper for the daily report API response
/// The API returns: { statusCode, message, data: [...], meta: {...} }
/// But ApiResponse only handles: { statusCode, message, data }
/// So we create this wrapper to include both data array and meta
@freezed
abstract class DailyReportResponseModel with _$DailyReportResponseModel {
  const factory DailyReportResponseModel({
    required int statusCode,
    required String message,
    required List<DailyReportModel> data,
    required DailyReportMetaModel meta,
  }) = _DailyReportResponseModel;

  factory DailyReportResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DailyReportResponseModelFromJson(json);
}

@freezed
abstract class DailyReportMetaModel with _$DailyReportMetaModel {
  const factory DailyReportMetaModel({
    required int page,
    required int limit,
    required int totalCount,
    required int totalPages,
    required bool hasNext,
    required bool hasPrev,
  }) = _DailyReportMetaModel;

  factory DailyReportMetaModel.fromJson(Map<String, dynamic> json) =>
      _$DailyReportMetaModelFromJson(json);
}
