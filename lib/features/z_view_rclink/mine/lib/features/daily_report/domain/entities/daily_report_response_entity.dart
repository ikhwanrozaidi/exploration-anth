import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rclink_app/features/daily_report/domain/entities/response/equipment_response_entity.dart';
import 'package:rclink_app/features/daily_report/domain/entities/response/road_response_entity.dart';

import 'response/reportquantity_response_entity.dart';
import 'response/workscope_response_entity.dart';

part 'daily_report_response_entity.g.dart';

@JsonSerializable()
class DailyReportResponse extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? notes;
  final String? weatherCondition;
  final bool? workPerformed;
  final int? companyID;
  final String? status;
  final int? contractRelationID;
  final int? approvedByID;
  final DateTime? approvedAt;
  final String? rejectionReason;
  final int? workScopeID;
  final int? roadID;
  final int? totalWorkers;
  final String? fromSection;
  final String? toSection;
  final String? longitude;
  final String? latitude;
  final int? createdByID;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deletedAt;
  final WorkScopeResponse? workScope;
  final RoadResponse? road;
  final List<EquipmentResponse>? equipments;
  final List<ReportQuantityResponse>? reportQuantities;

  const DailyReportResponse({
    this.id,
    this.uid,
    this.name,
    this.notes,
    this.weatherCondition,
    this.workPerformed,
    this.companyID,
    this.status,
    this.contractRelationID,
    this.approvedByID,
    this.approvedAt,
    this.rejectionReason,
    this.workScopeID,
    this.roadID,
    this.totalWorkers,
    this.fromSection,
    this.toSection,
    this.longitude,
    this.latitude,
    this.createdByID,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.workScope,
    this.road,
    this.equipments,
    this.reportQuantities,
  });

  factory DailyReportResponse.fromJson(Map<String, dynamic> json) =>
      _$DailyReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DailyReportResponseToJson(this);

  DailyReportResponse copyWith({
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
    WorkScopeResponse? workScope,
    RoadResponse? road,
    List<EquipmentResponse>? equipments,
    List<ReportQuantityResponse>? reportQuantities,
  }) {
    return DailyReportResponse(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      notes: notes ?? this.notes,
      weatherCondition: weatherCondition ?? this.weatherCondition,
      workPerformed: workPerformed ?? this.workPerformed,
      companyID: companyID ?? this.companyID,
      status: status ?? this.status,
      contractRelationID: contractRelationID ?? this.contractRelationID,
      approvedByID: approvedByID ?? this.approvedByID,
      approvedAt: approvedAt ?? this.approvedAt,
      rejectionReason: rejectionReason ?? this.rejectionReason,
      workScopeID: workScopeID ?? this.workScopeID,
      roadID: roadID ?? this.roadID,
      totalWorkers: totalWorkers ?? this.totalWorkers,
      fromSection: fromSection ?? this.fromSection,
      toSection: toSection ?? this.toSection,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      createdByID: createdByID ?? this.createdByID,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      workScope: workScope ?? this.workScope,
      road: road ?? this.road,
      equipments: equipments ?? this.equipments,
      reportQuantities: reportQuantities ?? this.reportQuantities,
    );
  }

  @override
  List<Object?> get props => [
    id,
    uid,
    name,
    notes,
    weatherCondition,
    workPerformed,
    companyID,
    status,
    contractRelationID,
    approvedByID,
    approvedAt,
    rejectionReason,
    workScopeID,
    roadID,
    totalWorkers,
    fromSection,
    toSection,
    longitude,
    latitude,
    createdByID,
    createdAt,
    updatedAt,
    deletedAt,
    workScope,
    road,
    equipments,
    reportQuantities,
  ];
}
