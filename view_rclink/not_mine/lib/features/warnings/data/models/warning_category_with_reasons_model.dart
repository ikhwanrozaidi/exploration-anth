import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/warning_category.dart';
import '../../domain/entities/warning_type.dart';
import 'warning_reason_with_work_scope_model.dart';

part 'warning_category_with_reasons_model.freezed.dart';
part 'warning_category_with_reasons_model.g.dart';

/// Model for warning category with nested reasons (used in API responses)
@freezed
abstract class WarningCategoryWithReasonsModel
    with _$WarningCategoryWithReasonsModel {
  const WarningCategoryWithReasonsModel._();

  const factory WarningCategoryWithReasonsModel({
    required int id,
    required String uid,
    required String name,
    required String warningType,
    DateTime? createdAt,
    DateTime? updatedAt,
    // Nested reasons array
    @Default([]) List<WarningReasonWithWorkScopeModel> reasons,
  }) = _WarningCategoryWithReasonsModel;

  factory WarningCategoryWithReasonsModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      _$WarningCategoryWithReasonsModelFromJson(json);

  WarningCategory toEntity() {
    return WarningCategory(
      id: id,
      uid: uid,
      name: name,
      warningType: WarningType.fromString(warningType),
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt ?? DateTime.now(),
    );
  }
}
