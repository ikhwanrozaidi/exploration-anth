import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../contractor_relation/data/models/contractor_relation_model.dart';
import '../../../../road/data/models/road_model.dart';
import '../../../domain/entities/program_view/program_list_item_entity.dart';
import '../created_by_nested_model.dart';
import '../work_scope_nested_model.dart';

part 'program_list_item_model.freezed.dart';
part 'program_list_item_model.g.dart';

@freezed
abstract class ProgramListItemModel with _$ProgramListItemModel {
  const factory ProgramListItemModel({
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
    WorkScopeNestedModel? workScope,
    RoadModel? road,
    ContractorRelationModel? contractRelation,
    CreatedByNestedModel? createdBy,
    @JsonKey(name: '_count') ProgramCountModel? count,
  }) = _ProgramListItemModel;

  factory ProgramListItemModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramListItemModelFromJson(json);
}

@freezed
abstract class ProgramCountModel with _$ProgramCountModel {
  const factory ProgramCountModel({int? dailyReports}) = _ProgramCountModel;

  factory ProgramCountModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramCountModelFromJson(json);
}

extension ProgramListItemModelX on ProgramListItemModel {
  ProgramListItem toEntity() {
    return ProgramListItem(
      id: id,
      uid: uid,
      name: name,
      description: description,
      companyID: companyID,
      workScopeID: workScopeID,
      roadID: roadID,
      periodStart: periodStart,
      periodEnd: periodEnd,
      contractRelationID: contractRelationID,
      requiredReportsCount: requiredReportsCount,
      totalReports: totalReports,
      calculationType: calculationType,
      fromSection: fromSection,
      toSection: toSection,
      dividerValue: dividerValue,
      inputValue: inputValue,
      longitude: longitude,
      latitude: latitude,
      status: status,
      createdByID: createdByID,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      workScope: workScope?.toEntity(),
      road: road?.toEntity(),
      contractRelation: contractRelation?.toEntity(),
      createdBy: createdBy?.toEntity(),
      count: count?.toEntity(),
    );
  }

  static ProgramListItemModel fromEntity(ProgramListItem entity) {
    return ProgramListItemModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      description: entity.description,
      companyID: entity.companyID,
      workScopeID: entity.workScopeID,
      roadID: entity.roadID,
      periodStart: entity.periodStart,
      periodEnd: entity.periodEnd,
      contractRelationID: entity.contractRelationID,
      requiredReportsCount: entity.requiredReportsCount,
      totalReports: entity.totalReports,
      calculationType: entity.calculationType,
      fromSection: entity.fromSection,
      toSection: entity.toSection,
      dividerValue: entity.dividerValue,
      inputValue: entity.inputValue,
      longitude: entity.longitude,
      latitude: entity.latitude,
      status: entity.status,
      createdByID: entity.createdByID,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
      workScope: entity.workScope != null
          ? WorkScopeNestedModelX.fromEntity(entity.workScope!)
          : null,
      road: entity.road != null ? RoadModelX.fromEntity(entity.road!) : null,
      contractRelation: entity.contractRelation != null
          ? ContractorRelationModelX.fromEntity(entity.contractRelation!)
          : null,
      createdBy: entity.createdBy != null
          ? CreatedByNestedModelX.fromEntity(entity.createdBy!)
          : null,
      count: entity.count != null
          ? ProgramCountModelX.fromEntity(entity.count!)
          : null,
    );
  }
}

extension ProgramCountModelX on ProgramCountModel {
  ProgramCount toEntity() {
    return ProgramCount(dailyReports: dailyReports);
  }

  static ProgramCountModel fromEntity(ProgramCount entity) {
    return ProgramCountModel(dailyReports: entity.dailyReports);
  }
}
