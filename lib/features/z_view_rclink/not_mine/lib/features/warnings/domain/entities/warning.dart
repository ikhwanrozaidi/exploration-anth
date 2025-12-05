import 'package:equatable/equatable.dart';
import '../../../daily_report/domain/entities/company_response.dart';
import '../../../daily_report/domain/entities/created_by_response.dart';
import '../../../daily_report/domain/entities/daily_report.dart';
import '../../../daily_report/domain/entities/road_response.dart';
import '../../../daily_report/domain/entities/work_scope_response.dart';
import '../../../../core/domain/entities/file_entity.dart';
import 'warning_daily_report.dart';
import 'warning_type.dart';
import 'warning_item.dart';

class Warning extends Equatable {
  // Primary keys
  final int? id; // Nullable for draft state (offline support)
  final String uid;

  // Warning type discriminator
  final WarningType warningType;

  // Optional linkage (null for SITE_WARNING)
  final int? dailyReportID;

  // Core data - foreign keys
  final int? companyID;
  final int? roadID;
  final int? workScopeID;
  final int? contractRelationID; // Optional for in-house work

  // Section information
  final String? fromSection;
  final String? toSection;

  // Warning items (stored as JSON in database)
  final List<WarningItem> warningItems;
  final WarningDailyReport? dailyReport;

  // Completion tracking
  final bool requiresAction;
  final bool isResolved;
  final int? resolvedByID;
  final DateTime? resolvedAt;
  final String? resolutionNotes;

  // Location (optional GPS coordinates)
  final String? longitude;
  final String? latitude;

  // Additional notes
  final String? description;

  // Creation tracking
  final int? createdByID;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  // Nested/expanded entities for UI display
  final List<FileEntity>? files;
  final CompanyResponse? company;
  final RoadResponse? road;
  final WorkScopeResponse? workScope;
  final CreatedByResponse? createdBy;
  final CreatedByResponse?
  resolvedBy; // Reuse CreatedByResponse for resolved admin

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
