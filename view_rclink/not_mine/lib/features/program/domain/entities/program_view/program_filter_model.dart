import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_filter_model.freezed.dart';
part 'program_filter_model.g.dart';

@freezed
abstract class ProgramFilterModel with _$ProgramFilterModel {
  const factory ProgramFilterModel({
    @Default(1) int page,
    @Default(10) int limit,
    @JsonKey(includeIfNull: false) String? search,
    @JsonKey(includeIfNull: false) String? status,
    @JsonKey(includeIfNull: false) String? workScopeUID,
    @JsonKey(includeIfNull: false) String? roadUID,
    @JsonKey(includeIfNull: false) String? contractRelationUID,
    @JsonKey(includeIfNull: false) String? fromDate,
    @JsonKey(includeIfNull: false) String? toDate,
    @Default([]) List<String> expand,
  }) = _ProgramFilterModel;

  factory ProgramFilterModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramFilterModelFromJson(json);
}
