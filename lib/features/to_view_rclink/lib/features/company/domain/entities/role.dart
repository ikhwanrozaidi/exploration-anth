import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'permission.dart';

part 'role.g.dart';

@JsonSerializable()
class Role extends Equatable {
  final int id;
  final String uid;
  final String name;
  final String description;
  final int companyID;
  final bool isSystemRole;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final List<Permission> permissions;

  const Role({
    required this.id,
    required this.uid,
    required this.name,
    required this.description,
    required this.companyID,
    required this.isSystemRole,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.permissions,
  });

  @override
  List<Object?> get props => [
    id,
    uid,
    name,
    description,
    companyID,
    isSystemRole,
    isActive,
    createdAt,
    updatedAt,
    deletedAt,
    permissions,
  ];

  Role copyWith({
    int? id,
    String? uid,
    String? name,
    String? description,
    int? companyID,
    bool? isSystemRole,
    bool? isActive,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    List<Permission>? permissions,
  }) {
    return Role(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      description: description ?? this.description,
      companyID: companyID ?? this.companyID,
      isSystemRole: isSystemRole ?? this.isSystemRole,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      permissions: permissions ?? this.permissions,
    );
  }

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);
  Map<String, dynamic> toJson() => _$RoleToJson(this);
}
