import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/daily_report_response_entity.dart';
import 'response/equipment_response_model.dart';
import 'response/reportquantity_response_model.dart';
import 'response/road_response_model.dart';
import 'response/workscope_response_model.dart';

part 'daily_report_response_model.freezed.dart';
part 'daily_report_response_model.g.dart';

@freezed
abstract class DailyReportResponseModel with _$DailyReportResponseModel {
  const DailyReportResponseModel._();

  const factory DailyReportResponseModel({
    int? id,
    String? uid,
    String? name,
    String? notes,
    String? weatherCondition,
    bool? workPerformed,
    int? companyID,
    String? status,
    int? contractRelationID,
    int? approvedByID,
    DateTime? approvedAt,
    String? rejectionReason,
    int? workScopeID,
    int? roadID,
    int? totalWorkers,
    String? fromSection,
    String? toSection,
    String? longitude,
    String? latitude,
    int? createdByID,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? deletedAt,
    WorkScopeResponseModel? workScope,
    RoadResponseModel? road,
    List<EquipmentResponseModel>? equipments,
    List<ReportQuantityResponseModel>? reportQuantities,
  }) = _DailyReportResponseModel;

  factory DailyReportResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DailyReportResponseModelFromJson(json);

  DailyReportResponse toEntity() {
    return DailyReportResponse(
      id: id,
      uid: uid,
      name: name,
      notes: notes,
      weatherCondition: weatherCondition,
      workPerformed: workPerformed,
      companyID: companyID,
      status: status,
      contractRelationID: contractRelationID,
      approvedByID: approvedByID,
      approvedAt: approvedAt,
      rejectionReason: rejectionReason,
      workScopeID: workScopeID,
      roadID: roadID,
      totalWorkers: totalWorkers,
      fromSection: fromSection,
      toSection: toSection,
      longitude: longitude,
      latitude: latitude,
      createdByID: createdByID,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      workScope: workScope?.toEntity(),
      road: road?.toEntity(),
      equipments: equipments?.map((e) => e.toEntity()).toList(),
      reportQuantities: reportQuantities?.map((e) => e.toEntity()).toList(),
    );
  }

  factory DailyReportResponseModel.fromEntity(DailyReportResponse entity) {
    return DailyReportResponseModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      notes: entity.notes,
      weatherCondition: entity.weatherCondition,
      workPerformed: entity.workPerformed,
      companyID: entity.companyID,
      status: entity.status,
      contractRelationID: entity.contractRelationID,
      approvedByID: entity.approvedByID,
      approvedAt: entity.approvedAt,
      rejectionReason: entity.rejectionReason,
      workScopeID: entity.workScopeID,
      roadID: entity.roadID,
      totalWorkers: entity.totalWorkers,
      fromSection: entity.fromSection,
      toSection: entity.toSection,
      longitude: entity.longitude,
      latitude: entity.latitude,
      createdByID: entity.createdByID,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
      workScope: entity.workScope != null
          ? WorkScopeResponseModel.fromEntity(entity.workScope!)
          : null,
      road: entity.road != null
          ? RoadResponseModel.fromEntity(entity.road!)
          : null,
      equipments: entity.equipments
          ?.map((e) => EquipmentResponseModel.fromEntity(e))
          .toList(),
      reportQuantities: entity.reportQuantities
          ?.map((e) => ReportQuantityResponseModel.fromEntity(e))
          .toList(),
    );
  }
}
