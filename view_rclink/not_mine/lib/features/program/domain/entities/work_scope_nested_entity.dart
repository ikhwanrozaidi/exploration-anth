import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'work_scope_nested_entity.g.dart';

@JsonSerializable()
class WorkScopeNested extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? code;
  final String? description;
  final bool? allowMultipleQuantities;
  final int? companyID;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  const WorkScopeNested({
    this.id,
    this.uid,
    this.name,
    this.code,
    this.description,
    this.allowMultipleQuantities,
    this.companyID,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory WorkScopeNested.fromJson(Map<String, dynamic> json) =>
      _$WorkScopeNestedFromJson(json);

  Map<String, dynamic> toJson() => _$WorkScopeNestedToJson(this);

  WorkScopeNested copyWith({
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
  }) {
    return WorkScopeNested(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      code: code ?? this.code,
      description: description ?? this.description,
      allowMultipleQuantities:
          allowMultipleQuantities ?? this.allowMultipleQuantities,
      companyID: companyID ?? this.companyID,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    uid,
    name,
    code,
    description,
    allowMultipleQuantities,
    companyID,
    createdAt,
    updatedAt,
    deletedAt,
  ];
}
