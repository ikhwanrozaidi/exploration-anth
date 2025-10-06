import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_report_filter_model.freezed.dart';
part 'daily_report_filter_model.g.dart';

@freezed
abstract class DailyReportFilterModel with _$DailyReportFilterModel {
  const factory DailyReportFilterModel({
    /// Page number for pagination
    @Default(1) int page,

    /// Number of items per page
    @Default(10) int limit,

    /// Filter by report status
    String? status,

    /// Filter by work scope UID
    String? workScopeUID,

    /// Filter by road UID
    String? roadUID,

    /// Filter by created by admin ID
    int? createdByID,

    /// Filter by date range - start date
    DateTime? startDate,

    /// Filter by date range - end date
    DateTime? endDate,

    /// Search term for report name
    String? search,

    /// Sort field
    String? sortBy,

    /// Sort order (asc/desc)
    String? sortOrder,

    /// Expand relations
    List<String>? expand,
  }) = _DailyReportFilterModel;

  factory DailyReportFilterModel.fromJson(Map<String, dynamic> json) =>
      _$DailyReportFilterModelFromJson(json);
}
