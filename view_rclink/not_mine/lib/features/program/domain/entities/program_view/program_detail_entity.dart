import 'package:json_annotation/json_annotation.dart';
import '../../../../../core/domain/entities/file_entity.dart';
import '../../../../contractor_relation/domain/entities/contractor_relation_entity.dart';
import '../../../../daily_report/domain/entities/daily_report.dart';
import '../../../../road/domain/entities/road_entity.dart';
import '../created_by_nested_entity.dart';
import '../work_scope_nested_entity.dart';
import 'program_list_item_entity.dart';
import 'program_quantity_entity.dart';

part 'program_detail_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ProgramDetail {
  final int? id;
  final String? uid;
  final String? name;
  final String? description;
  final int? companyID;
  final int? workScopeID;
  final int? roadID;
  final String? periodStart;
  final String? periodEnd;
  final int? contractRelationID;
  final int? requiredReportsCount;
  final int? totalReports;
  final String? calculationType;
  final String? fromSection;
  final String? toSection;
  final String? dividerValue;
  final String? inputValue;
  final double? longitude;
  final double? latitude;
  final String? status;
  final int? createdByID;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt;

  // Nested entities for detail view
  final WorkScopeNested? workScope;
  final Road? road;
  final ContractorRelation? contractRelation;
  final CreatedByNested? createdBy;
  final List<ProgramQuantity>? quantities;
  final List<FileEntity>? files;
  final List<DailyReport>? dailyReports;
  final ProgramCount? count;

  const ProgramDetail({
    this.id,
    this.uid,
    this.name,
    this.description,
    this.companyID,
    this.workScopeID,
    this.roadID,
    this.periodStart,
    this.periodEnd,
    this.contractRelationID,
    this.requiredReportsCount,
    this.totalReports,
    this.calculationType,
    this.fromSection,
    this.toSection,
    this.dividerValue,
    this.inputValue,
    this.longitude,
    this.latitude,
    this.status,
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
    this.count,
  });

  factory ProgramDetail.fromJson(Map<String, dynamic> json) =>
      _$ProgramDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramDetailToJson(this);

  ProgramDetail copyWith({
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
    int? totalReports,
    String? calculationType,
    String? fromSection,
    String? toSection,
    String? dividerValue,
    String? inputValue,
    double? longitude,
    double? latitude,
    String? status,
    int? createdByID,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    WorkScopeNested? workScope,
    Road? road,
    ContractorRelation? contractRelation,
    CreatedByNested? createdBy,
    List<ProgramQuantity>? quantities,
    List<FileEntity>? files,
    List<DailyReport>? dailyReports,
    ProgramCount? count,
  }) {
    return ProgramDetail(
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
      totalReports: totalReports ?? this.totalReports,
      calculationType: calculationType ?? this.calculationType,
      fromSection: fromSection ?? this.fromSection,
      toSection: toSection ?? this.toSection,
      dividerValue: dividerValue ?? this.dividerValue,
      inputValue: inputValue ?? this.inputValue,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      status: status ?? this.status,
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
      count: count ?? this.count,
    );
  }
}
