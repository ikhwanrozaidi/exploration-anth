import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'work_scope.g.dart';

@JsonSerializable()
class WorkScope extends Equatable {
  final int id;
  final String uid;
  final String name;
  final String code;
  final String description;
  final bool allowMultipleQuantities;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int companyID;

  const WorkScope({
    required this.id,
    required this.uid,
    required this.name,
    required this.code,
    required this.description,
    required this.allowMultipleQuantities,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.companyID,
  });

  @override
  List<Object?> get props => [
    id,
    uid,
    name,
    code,
    description,
    allowMultipleQuantities,
    createdAt,
    updatedAt,
    deletedAt,
    companyID,
  ];

  factory WorkScope.fromJson(Map<String, dynamic> json) =>
      _$WorkScopeFromJson(json);
  Map<String, dynamic> toJson() => _$WorkScopeToJson(this);
}
