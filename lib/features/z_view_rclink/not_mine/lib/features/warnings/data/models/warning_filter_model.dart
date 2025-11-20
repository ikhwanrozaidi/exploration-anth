import 'package:freezed_annotation/freezed_annotation.dart';

part 'warning_filter_model.freezed.dart';
part 'warning_filter_model.g.dart';

@Freezed(toJson: true)
abstract class WarningFilterModel with _$WarningFilterModel {
  const factory WarningFilterModel({
    /// Filter by warning type
    @JsonKey(includeIfNull: false) List<String>? warningType,

    /// Filter by road ID
    @JsonKey(includeIfNull: false) String? roadID,

    /// Filter by Work Scope ID
    @JsonKey(includeIfNull: false) String? workScopeID,

    /// Filter by Contract Relation ID
    @JsonKey(includeIfNull: false) String? contractRelationID,

    /// Filter by Daily Report ID
    @JsonKey(includeIfNull: false) String? dailyReportID,

    /// Filter by Resolved status
    @JsonKey(includeIfNull: false) bool? isResolved,

    /// Filter by Action status
    @JsonKey(includeIfNull: false) bool? requiresAction,
  }) = _WarningFilterModel;

  factory WarningFilterModel.fromJson(Map<String, dynamic> json) =>
      _$WarningFilterModelFromJson(json);
}
