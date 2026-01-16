import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_settings_filter_model.freezed.dart';
part 'program_settings_filter_model.g.dart';

@Freezed(toJson: true)
abstract class ProgramSettingsFilterModel with _$ProgramSettingsFilterModel {
  const factory ProgramSettingsFilterModel({
    /// Page number for pagination
    @Default(1) int page,

    /// Number of items per page
    @Default(10) int limit,

    /// Filter by report status
    @JsonKey(includeIfNull: false) String? sortOrder,

    /// Filter by work scope UID
    @JsonKey(includeIfNull: false) String? sortBy,

    /// Filter by road UID
    @JsonKey(includeIfNull: false) String? workScopeUID,

    /// Filter by created by admin ID
    @JsonKey(includeIfNull: false) String? calculationType,

    /// Filter by date range - start date
    @JsonKey(includeIfNull: false) bool? isActive,

    /// Expand relations
    @JsonKey(includeIfNull: false) List<String>? expand,
  }) = _ProgramSettingsFilterModel;

  factory ProgramSettingsFilterModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramSettingsFilterModelFromJson(json);
}
