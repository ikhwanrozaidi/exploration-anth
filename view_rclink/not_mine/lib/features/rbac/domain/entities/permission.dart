import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'permission.g.dart';

@JsonSerializable()
class Permission extends Equatable {
  final int id;
  final String uid;
  final String code; // COMPANY_VIEW, USER_CREATE, etc.
  final String name;
  final String? description;
  final String category; // Company, User, Role, Program, etc.
  final String scope; // COMPANY, PROJECT, etc.

  const Permission({
    required this.id,
    required this.uid,
    required this.code,
    required this.name,
    this.description,
    required this.category,
    required this.scope,
  });

  // Helper getters
  String get module => category.toLowerCase().replaceAll(' ', '_');
  String get action {
    final parts = code.split('_');
    return parts.length > 1 ? parts.last.toLowerCase() : '';
  }

  @override
  List<Object?> get props => [id, uid, code, name, description, category, scope];

  Permission copyWith({
    int? id,
    String? uid,
    String? code,
    String? name,
    String? description,
    String? category,
    String? scope,
  }) {
    return Permission(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      code: code ?? this.code,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      scope: scope ?? this.scope,
    );
  }

  factory Permission.fromJson(Map<String, dynamic> json) => 
      _$PermissionFromJson(json);
  
  Map<String, dynamic> toJson() => _$PermissionToJson(this);
}