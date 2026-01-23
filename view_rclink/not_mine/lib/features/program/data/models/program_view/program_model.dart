import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/daily_report/data/models/daily_report_model.dart';
import 'package:rclink_app/core/domain/models/file_model.dart';
import '../../../domain/entities/program_entity.dart';
import '../program_settings/created_by_nested_model.dart';
import '../program_settings/work_scope_nested_model.dart';
import 'road_nested_model.dart';
import 'contract_relation_nested_model.dart';
import 'program_quantity_model.dart';

part 'program_model.freezed.dart';
part 'program_model.g.dart';

@freezed
abstract class ProgramModel with _$ProgramModel {
  const ProgramModel._();

  const factory ProgramModel({
    required int id,
    required String uid,
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
    @JsonKey(fromJson: _parseNullableInt) int? inputValue,

    String? longitude,
    String? latitude,
    String? status,
    int? createdByID,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
    WorkScopeNestedModel? workScope,
    RoadNestedModel? road,
    ContractRelationNestedModel? contractRelation,
    CreatedByNestedModel? createdBy,
    List<ProgramQuantityModel>? quantities,
    List<FileModel>? files,
    List<DailyReportModel>? dailyReports,
    // Sync fields
    @Default(false) bool isSynced,
    String? syncAction,
    @Default(0) int syncRetryCount,
    String? syncError,
    DateTime? lastSyncAttempt,
  }) = _ProgramModel;

  factory ProgramModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramModelFromJson(json);
}

extension ProgramModelX on ProgramModel {
  Program toEntity() {
    return Program(
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
      dailyReports: dailyReports?.map((dr) => dr.toEntity()).toList(),
    );
  }

  static ProgramModel fromEntity(Program entity) {
    return ProgramModel(
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
      road: entity.road != null
          ? RoadNestedModelX.fromEntity(entity.road!)
          : null,
      contractRelation: entity.contractRelation != null
          ? ContractRelationNestedModelX.fromEntity(entity.contractRelation!)
          : null,
      createdBy: entity.createdBy != null
          ? CreatedByNestedModelX.fromEntity(entity.createdBy!)
          : null,
      quantities: entity.quantities
          ?.map((q) => ProgramQuantityModelX.fromEntity(q))
          .toList(),
      files: entity.files?.map((f) => FileModel.fromEntity(f)).toList(),
      dailyReports: null, // Daily reports not included in fromEntity conversion
    );
  }
}

int? _parseNullableInt(dynamic value) {
  if (value == null) return null;
  if (value is int) return value;
  if (value is num) return value.toInt();
  if (value is String) return int.tryParse(value);
  return null;
}
