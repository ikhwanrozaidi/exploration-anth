import 'package:json_annotation/json_annotation.dart';

import '../../../../contractor_relation/domain/entities/contractor_relation_entity.dart';
import '../../../../road/domain/entities/road_entity.dart';
import '../created_by_nested_entity.dart';
import '../work_scope_nested_entity.dart';

part 'program_list_item_entity.g.dart';

@JsonSerializable(explicitToJson: true)
class ProgramListItem {
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

  // Nested entities for list view
  final WorkScopeNested? workScope;
  final Road? road;
  final ContractorRelation? contractRelation;
  final CreatedByNested? createdBy;
  final ProgramCount? count;

  const ProgramListItem({
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
    this.count,
  });

  factory ProgramListItem.fromJson(Map<String, dynamic> json) =>
      _$ProgramListItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramListItemToJson(this);

  ProgramListItem copyWith({
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
    ProgramCount? count,
  }) {
    return ProgramListItem(
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
      count: count ?? this.count,
    );
  }
}

// Count entity for _count field
@JsonSerializable()
class ProgramCount {
  final int? dailyReports;

  const ProgramCount({this.dailyReports});

  factory ProgramCount.fromJson(Map<String, dynamic> json) =>
      _$ProgramCountFromJson(json);

  Map<String, dynamic> toJson() => _$ProgramCountToJson(this);
}
