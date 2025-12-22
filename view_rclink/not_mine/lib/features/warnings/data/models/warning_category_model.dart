import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/warning_category.dart';
import '../../domain/entities/warning_type.dart';

part 'warning_category_model.freezed.dart';
part 'warning_category_model.g.dart';

@freezed
abstract class WarningCategoryModel with _$WarningCategoryModel {
  const WarningCategoryModel._();

  const factory WarningCategoryModel({
    required int id,
    required String uid,
    required String name,
    required String warningType, // Stored as string in API/DB
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _WarningCategoryModel;

  factory WarningCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$WarningCategoryModelFromJson(json);

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
