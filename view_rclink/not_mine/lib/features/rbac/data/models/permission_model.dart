import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/permission.dart';

part 'permission_model.g.dart';

@JsonSerializable()
class PermissionModel {
  final int id;
  final String uid;
  final String code;
  final String name;
  final String? description;
  final String category;
  final String scope;

  const PermissionModel({
    required this.id,
    required this.uid,
    required this.code,
    required this.name,
    this.description,
    required this.category,
    required this.scope,
  });

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      _$PermissionModelFromJson(json);

  Map<String, dynamic> toJson() => _$PermissionModelToJson(this);

  // Convert to domain entity
  Permission toEntity() => Permission(
    id: id,
    uid: uid,
    code: code,
    name: name,
    description: description,
    category: category,
    scope: scope,
  );

  // Create from domain entity
  factory PermissionModel.fromEntity(Permission entity) => PermissionModel(
    id: entity.id,
    uid: entity.uid,
    code: entity.code,
    name: entity.name,
    description: entity.description,
    category: entity.category,
    scope: entity.scope,
  );
}
