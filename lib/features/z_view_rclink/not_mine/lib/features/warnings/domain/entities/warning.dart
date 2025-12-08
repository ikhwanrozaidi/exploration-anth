import 'package:equatable/equatable.dart';
import '../../../daily_report/domain/entities/company_response.dart';
import '../../../daily_report/domain/entities/created_by_response.dart';
import '../../../daily_report/domain/entities/road_response.dart';
import '../../../daily_report/domain/entities/work_scope_response.dart';
import '../../../../core/domain/entities/file_entity.dart';
import 'warning_daily_report.dart';
import 'warning_type.dart';
import 'warning_item.dart';

class Warning extends Equatable {
  final int? id;
  final String uid;
  final WarningType warningType;
  final int? dailyReportID;

  // Core data
  final int? companyID;
  final int? roadID;
  final int? workScopeID;
  final int? contractRelationID;

  final String? fromSection;
  final String? toSection;

  final List<WarningItem> warningItems;
  final WarningDailyReport? dailyReport;

  final bool requiresAction;
  final bool isResolved;
  final int? resolvedByID;
  final DateTime? resolvedAt;
  final String? resolutionNotes;
  final String? longitude;
  final String? latitude;
  final String? description;
  final int? createdByID;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final List<FileEntity>? files;
  final CompanyResponse? company;
  final RoadResponse? road;
  final WorkScopeResponse? workScope;
  final CreatedByResponse? createdBy;
  final CreatedByResponse? resolvedBy;

  const Warning({
    required this.id,
    required this.uid,
    required this.warningType,
    this.dailyReportID,
    this.companyID,
    this.roadID,
    this.workScopeID,
    this.contractRelationID,
    required this.fromSection,
    required this.toSection,
    required this.warningItems,
    this.dailyReport,
    required this.requiresAction,
    required this.isResolved,
    this.resolvedByID,
    this.resolvedAt,
    this.resolutionNotes,
    this.longitude,
    this.latitude,
    this.description,
    this.createdByID,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    this.files,
    this.company,
    this.road,
    this.workScope,
    this.createdBy,
    this.resolvedBy,
  });

  @override
  List<Object?> get props => [
    id,
    uid,
    warningType,
    dailyReportID,
    companyID,
    roadID,
    workScopeID,
    contractRelationID,
    fromSection,
    toSection,
    warningItems,
    dailyReport,
    requiresAction,
    isResolved,
    resolvedByID,
    resolvedAt,
    resolutionNotes,
    longitude,
    latitude,
    description,
    createdByID,
    createdAt,
    updatedAt,
    deletedAt,
    files,
    company,
    road,
    workScope,
    createdBy,
    resolvedBy,
  ];
}
