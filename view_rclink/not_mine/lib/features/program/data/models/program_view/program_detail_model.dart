import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/domain/models/file_model.dart';
import '../../../../contractor_relation/data/models/contractor_relation_model.dart';
import '../../../../daily_report/data/models/daily_report_model.dart';
import '../../../../road/data/models/road_model.dart';
import '../../../domain/entities/program_view/program_detail_entity.dart';
import '../created_by_nested_model.dart';
import '../work_scope_nested_model.dart';
import 'program_list_item_model.dart';
import 'program_quantity_model.dart';

part 'program_detail_model.freezed.dart';
part 'program_detail_model.g.dart';

@freezed
abstract class ProgramDetailModel with _$ProgramDetailModel {
  const factory ProgramDetailModel({
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
    List<ProgramQuantityModel>? quantities,
    List<FileModel>? files,
    List<DailyReportModel>? dailyReports,
    @JsonKey(name: '_count') ProgramCountModel? count,
  }) = _ProgramDetailModel;

  factory ProgramDetailModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramDetailModelFromJson(json);
}

extension ProgramDetailModelX on ProgramDetailModel {
  ProgramDetail toEntity() {
    return ProgramDetail(
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
      quantities: quantities?.map((q) => q.toEntity()).toList(),
      files: files?.map((f) => f.toEntity()).toList(),
      dailyReports: dailyReports?.map((d) => d.toEntity()).toList(),
      count: count?.toEntity(),
    );
  }

  static ProgramDetailModel fromEntity(ProgramDetail entity) {
    return ProgramDetailModel(
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
      quantities: entity.quantities
          ?.map((q) => ProgramQuantityModelX.fromEntity(q))
          .toList(),
      files: entity.files?.map((f) => FileModelX.fromEntity(f)).toList(),
      dailyReports: entity.dailyReports
          ?.map((d) => DailyReportModelX.fromEntity(d))
          .toList(),
      count: entity.count != null
          ? ProgramCountModelX.fromEntity(entity.count!)
          : null,
    );
  }
}
