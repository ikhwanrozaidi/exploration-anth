import 'package:json_annotation/json_annotation.dart';

import '../../../../core/domain/entities/file_entity.dart';
import '../../../daily_report/domain/entities/daily_report.dart';
import 'program_settings/created_by_nested_entity.dart';
import 'program_settings/work_scope_nested_entity.dart';
import 'program_view/contract_relation_nested_entity.dart';
import 'program_view/program_quantity_entity.dart';
import 'program_view/road_nested_entity.dart';

part 'program_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class Program {
  final int id;
  final String uid;
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

  final int? roadID;
  final String? periodStart;
  final String? periodEnd;
  final int? requiredReportsCount;
  final String? calculationType;
  final String? fromSection;
  final String? toSection;
  final String? dividerValue;
  final int? inputValue;
  final String? longitude;
  final String? latitude;
  final int? createdByID;

  // Nested objects
  final WorkScopeNested? workScope;
  final RoadNested? road;
  final ContractRelationNested? contractRelation;
  final CreatedByNested? createdBy;
  final List<ProgramQuantity>? quantities;

  // These fields cannot be auto-serialized, handle manually in model layer
  @JsonKey(includeFromJson: false, includeToJson: false)
  final List<FileEntity>? files;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final List<DailyReport>? dailyReports;

  Program({
    required this.id,
    required this.uid,
    this.name,
    this.description,
    this.companyID,
    this.workScopeID,
    this.roadID,
    this.periodStart,
    this.periodEnd,
    this.contractRelationID,
    this.requiredReportsCount,
    this.calculationType,
    this.fromSection,
    this.toSection,
    this.dividerValue,
    this.inputValue,
    this.longitude,
    this.latitude,
    this.status,
    this.totalReports,
    this.createdByID,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.workScope,
    this.road,
    this.contractRelation,
    this.createdBy,
    this.quantities,
    this.files,
    this.dailyReports,
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
    int? roadID,
    String? periodStart,
    String? periodEnd,
    int? contractRelationID,
    int? requiredReportsCount,
    String? calculationType,
    String? fromSection,
    String? toSection,
    String? dividerValue,
    int? inputValue,
    String? longitude,
    String? latitude,
    String? status,
    int? totalReports,
    int? createdByID,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    WorkScopeNested? workScope,
    RoadNested? road,
    ContractRelationNested? contractRelation,
    CreatedByNested? createdBy,
    List<ProgramQuantity>? quantities,
    List<FileEntity>? files,
    List<DailyReport>? dailyReports,
  }) {
    return Program(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      description: description ?? this.description,
      companyID: companyID ?? this.companyID,
      workScopeID: workScopeID ?? this.workScopeID,
      roadID: roadID ?? this.roadID,
      periodStart: periodStart ?? this.periodStart,
      periodEnd: periodEnd ?? this.periodEnd,
      contractRelationID: contractRelationID ?? this.contractRelationID,
      requiredReportsCount: requiredReportsCount ?? this.requiredReportsCount,
      calculationType: calculationType ?? this.calculationType,
      fromSection: fromSection ?? this.fromSection,
      toSection: toSection ?? this.toSection,
      dividerValue: dividerValue ?? this.dividerValue,
      inputValue: inputValue ?? this.inputValue,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      status: status ?? this.status,
      totalReports: totalReports ?? this.totalReports,
      createdByID: createdByID ?? this.createdByID,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      workScope: workScope ?? this.workScope,
      road: road ?? this.road,
      contractRelation: contractRelation ?? this.contractRelation,
      createdBy: createdBy ?? this.createdBy,
      quantities: quantities ?? this.quantities,
      files: files ?? this.files,
      dailyReports: dailyReports ?? this.dailyReports,
    );
  }
}
