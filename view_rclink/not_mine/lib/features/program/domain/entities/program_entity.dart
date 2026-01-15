import 'package:json_annotation/json_annotation.dart';

part 'program_entity.g.dart';

@JsonSerializable()
class Program {
  final int? id;
  final String? uid;
  final String? name;
  final String? description;
  final int? companyID;
  final int? workScopeID;
  final int? contractRelationID;
  final String? status;
  final int? totalReports;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  Program({
    this.id,
    this.uid,
    this.name,
    this.description,
    this.companyID,
    this.workScopeID,
    this.contractRelationID,
    this.status,
    this.totalReports,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Program.fromJson(Map<String, dynamic> json) =>
      _$ProgramFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramToJson(this);

  Program copyWith({
    int? id,
    String? uid,
    String? name,
    String? description,
    int? companyID,
    int? workScopeID,
    int? contractRelationID,
    String? status,
    int? totalReports,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
  }) {
    return Program(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      description: description ?? this.description,
      companyID: companyID ?? this.companyID,
      workScopeID: workScopeID ?? this.workScopeID,
      contractRelationID: contractRelationID ?? this.contractRelationID,
      status: status ?? this.status,
      totalReports: totalReports ?? this.totalReports,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }
}
