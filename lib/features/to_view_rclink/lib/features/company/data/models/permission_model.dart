import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/permission.dart';

part 'permission_model.freezed.dart';
part 'permission_model.g.dart';

@freezed
abstract class PermissionModel with _$PermissionModel {
  const PermissionModel._();

  const factory PermissionModel({
    required int id,
    required String uid,
    required String code,
    required String name,
    required String description,
    required String category,
    required String scope,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _PermissionModel;

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionModelFromJson(json);

  // Convert model to entity
  Permission toEntity() {
    return Permission(
      id: id,
      uid: uid,
      code: code,
      name: name,
      description: description,
      category: category,
      scope: scope,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  // Create model from entity
  factory PermissionModel.fromEntity(Permission entity) {
    return PermissionModel(
      id: entity.id,
      uid: entity.uid,
      code: entity.code,
      name: entity.name,
      description: entity.description,
      category: entity.category,
      scope: entity.scope,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
