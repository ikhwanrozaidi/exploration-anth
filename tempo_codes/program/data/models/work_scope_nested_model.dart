import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/work_scope_nested_entity.dart';

part 'work_scope_nested_model.freezed.dart';
part 'work_scope_nested_model.g.dart';

@freezed
abstract class WorkScopeNestedModel with _$WorkScopeNestedModel {
  const factory WorkScopeNestedModel({
    int? id,
    String? uid,
    String? name,
    String? code,
    String? description,
    bool? allowMultipleQuantities,
    int? companyID,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
  }) = _WorkScopeNestedModel;

  factory WorkScopeNestedModel.fromJson(Map<String, dynamic> json) =>
      _$WorkScopeNestedModelFromJson(json);
}

extension WorkScopeNestedModelX on WorkScopeNestedModel {
  WorkScopeNested toEntity() {
    return WorkScopeNested(
      id: id,
      uid: uid,
      name: name,
      code: code,
      description: description,
      allowMultipleQuantities: allowMultipleQuantities,
      companyID: companyID,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }

  static WorkScopeNestedModel fromEntity(WorkScopeNested entity) {
    return WorkScopeNestedModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      code: entity.code,
      description: entity.description,
      allowMultipleQuantities: entity.allowMultipleQuantities,
      companyID: entity.companyID,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
    );
  }
}
