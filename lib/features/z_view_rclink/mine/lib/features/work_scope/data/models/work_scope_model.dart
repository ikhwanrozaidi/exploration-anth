import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/work_scope.dart';

part 'work_scope_model.freezed.dart';
part 'work_scope_model.g.dart';

@freezed
abstract class WorkScopeModel with _$WorkScopeModel {
  const WorkScopeModel._();

  const factory WorkScopeModel({
    required int id,
    required String uid,
    required String name,
    required String code,
    required String description,
    required bool allowMultipleQuantities,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    required int companyID,
  }) = _WorkScopeModel;

  factory WorkScopeModel.fromJson(Map<String, dynamic> json) =>
      _$WorkScopeModelFromJson(json);

  WorkScope toEntity() {
    return WorkScope(
      id: id,
      uid: uid,
      name: name,
      code: code,
      description: description,
      allowMultipleQuantities: allowMultipleQuantities,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      companyID: companyID,
    );
  }

  factory WorkScopeModel.fromEntity(WorkScope entity) {
    return WorkScopeModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      code: entity.code,
      description: entity.description,
      allowMultipleQuantities: entity.allowMultipleQuantities,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
      companyID: entity.companyID,
    );
  }
}
