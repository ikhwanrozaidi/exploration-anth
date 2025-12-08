import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../daily_report/data/models/work_scope_response_model.dart';
import '../../domain/entities/warning_type.dart';

part 'warning_reason_with_work_scope_model.freezed.dart';
part 'warning_reason_with_work_scope_model.g.dart';

/// Model for warning reason with nested work scope info (used in API responses)
@freezed
abstract class WarningReasonWithWorkScopeModel
    with _$WarningReasonWithWorkScopeModel {
  const WarningReasonWithWorkScopeModel._();

  const factory WarningReasonWithWorkScopeModel({
    required int id,
    required String uid,
    required String name,
    required String warningType,
    required int categoryID,
    required int workScopeID,
    @Default(true) bool requiresAction,
    @Default(true) bool isActive,
    @Default(0) int displayOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
    // Nested work scope info
    WorkScopeResponseModel? workScope,
  }) = _WarningReasonWithWorkScopeModel;

  factory WarningReasonWithWorkScopeModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$WarningReasonWithWorkScopeModelFromJson(json);
}
