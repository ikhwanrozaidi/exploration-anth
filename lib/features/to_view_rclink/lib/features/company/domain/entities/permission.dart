import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'permission.g.dart';

@JsonSerializable()
class Permission extends Equatable {
  final int id;
  final String uid;
  final String code;
  final String name;
  final String description;
  final String category;
  final String scope;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Permission({
    required this.id,
    required this.uid,
    required this.code,
    required this.name,
    required this.description,
    required this.category,
    required this.scope,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
    id,
    uid,
    code,
    name,
    description,
    category,
    scope,
    createdAt,
    updatedAt,
  ];

  Permission copyWith({
    int? id,
    String? uid,
    String? code,
    String? name,
    String? description,
    String? category,
    String? scope,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Permission(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      scope: scope ?? this.scope,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  factory Permission.fromJson(Map<String, dynamic> json) =>
      _$PermissionFromJson(json);
  Map<String, dynamic> toJson() => _$PermissionToJson(this);
}
