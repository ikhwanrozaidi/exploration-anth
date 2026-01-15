import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/dropdown_option_nested_entity.dart';

part 'dropdown_option_nested_model.freezed.dart';
part 'dropdown_option_nested_model.g.dart';

@freezed
abstract class DropdownOptionNestedModel with _$DropdownOptionNestedModel {
  const factory DropdownOptionNestedModel({
    int? id,
    String? uid,
    int? fieldID,
    String? value,
    int? displayOrder,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
  }) = _DropdownOptionNestedModel;

  factory DropdownOptionNestedModel.fromJson(Map<String, dynamic> json) =>
      _$DropdownOptionNestedModelFromJson(json);
}

extension DropdownOptionNestedModelX on DropdownOptionNestedModel {
  DropdownOptionNested toEntity() {
    return DropdownOptionNested(
      id: id,
      uid: uid,
      fieldID: fieldID,
      value: value,
      displayOrder: displayOrder,
      isActive: isActive,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static DropdownOptionNestedModel fromEntity(DropdownOptionNested entity) {
    return DropdownOptionNestedModel(
      id: entity.id,
      uid: entity.uid,
      fieldID: entity.fieldID,
      value: entity.value,
      displayOrder: entity.displayOrder,
      isActive: entity.isActive,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
