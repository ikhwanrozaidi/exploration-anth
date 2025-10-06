import 'package:equatable/equatable.dart';
import 'daily_report_equipment.dart';

class DailyReport extends Equatable {
  final int id;
  final String uid;
  final String name;
  final String? notes;
  final String weatherCondition;
  final bool workPerformed;
  final int companyID;
  final String status;
  final int? contractRelationID;
  final int? approvedByID;
  final DateTime? approvedAt;
  final String? rejectionReason;
  final int workScopeID;
  final int roadID;
  final int? totalWorkers;
  final String? fromSection;
  final String? toSection;
  final String? longitude;
  final String? latitude;
  final int createdByID;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<DailyReportEquipment> equipments;

  const DailyReport({
    required this.id,
    required this.uid,
    required this.name,
    this.notes,
    required this.weatherCondition,
    required this.workPerformed,
    required this.companyID,
    required this.status,
    this.contractRelationID,
    this.approvedByID,
    this.approvedAt,
    this.rejectionReason,
    required this.workScopeID,
    required this.roadID,
    this.totalWorkers,
    this.fromSection,
    this.toSection,
    this.longitude,
    this.latitude,
    required this.createdByID,
    required this.createdAt,
    required this.updatedAt,
    required this.equipments,
  });

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
    equipments,
  ];
}
