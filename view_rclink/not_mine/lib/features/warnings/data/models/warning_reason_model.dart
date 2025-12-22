import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/warning_reason.dart';
import '../../domain/entities/warning_type.dart';
import 'warning_category_model.dart';

part 'warning_reason_model.freezed.dart';
part 'warning_reason_model.g.dart';

@freezed
abstract class WarningReasonModel with _$WarningReasonModel {
  const WarningReasonModel._();

  const factory WarningReasonModel({
    required int id,
    required String uid,
    required String name,
    required String warningType, // Stored as string in API/DB
    required int categoryID,
    required int workScopeID,
    @Default(true) bool requiresAction,
    @Default(true) bool isActive,
    @Default(0) int displayOrder,
    DateTime? createdAt,
    DateTime? updatedAt,
    // Optional nested category
    WarningCategoryModel? category,
  }) = _WarningReasonModel;

  factory WarningReasonModel.fromJson(Map<String, dynamic> json) =>
      _$WarningReasonModelFromJson(json);

  WarningReason toEntity() {
    return WarningReason(
      id: id,
      uid: uid,
      name: name,
      warningType: WarningType.fromString(warningType),
      categoryID: categoryID,
      workScopeID: workScopeID,
      requiresAction: requiresAction,
      isActive: isActive,
      displayOrder: displayOrder,
      createdAt: createdAt ?? DateTime.now(),
      updatedAt: updatedAt ?? DateTime.now(),
      category: category?.toEntity(),
    );
  }
}
