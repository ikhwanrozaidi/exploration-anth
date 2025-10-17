import 'package:freezed_annotation/freezed_annotation.dart';

part 'daily_report_filter_model.freezed.dart';
part 'daily_report_filter_model.g.dart';

@Freezed(toJson: true)
abstract class DailyReportFilterModel with _$DailyReportFilterModel {
  const factory DailyReportFilterModel({
    /// Page number for pagination
    @Default(1) int page,

    /// Number of items per page
    @Default(10) int limit,

    /// Filter by report status
    @JsonKey(includeIfNull: false) String? status,

    /// Filter by work scope UID
    @JsonKey(includeIfNull: false) String? workScopeUID,

    /// Filter by road UID
    @JsonKey(includeIfNull: false) String? roadUID,

    /// Filter by created by admin ID
    @JsonKey(includeIfNull: false) int? createdByID,

    /// Filter by date range - start date
    @JsonKey(includeIfNull: false) DateTime? startDate,

    /// Filter by date range - end date
    @JsonKey(includeIfNull: false) DateTime? endDate,

    /// Search term for report name
    @JsonKey(includeIfNull: false) String? search,

    /// Sort field
    @JsonKey(includeIfNull: false) String? sortBy,

    /// Sort order (asc/desc)
    @JsonKey(includeIfNull: false) String? sortOrder,

    /// Expand relations
    @JsonKey(includeIfNull: false) List<String>? expand,
  }) = _DailyReportFilterModel;

  factory DailyReportFilterModel.fromJson(Map<String, dynamic> json) =>
      _$DailyReportFilterModelFromJson(json);
}
