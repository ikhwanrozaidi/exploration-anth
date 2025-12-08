import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../daily_report/data/models/company_response_model.dart';
import '../../../daily_report/data/models/created_by_response_model.dart';
import '../../../daily_report/data/models/daily_report_model.dart';
import '../../../daily_report/data/models/road_response_model.dart';
import '../../../daily_report/data/models/work_scope_response_model.dart';
import '../../../../core/domain/models/file_model.dart';
import '../../domain/entities/warning.dart';
import '../../domain/entities/warning_type.dart';
import 'warning_daily_report_model.dart';
import 'warning_item_model.dart';

part 'warning_model.freezed.dart';
part 'warning_model.g.dart';

@freezed
abstract class WarningModel with _$WarningModel {
  const WarningModel._();

  const factory WarningModel({
    int? id,
    required String uid,
    required String warningType,
    int? dailyReportID,
    required int companyID,
    required int roadID,
    required int workScopeID,
    int? contractRelationID,
    String? fromSection,
    String? toSection,
    @Default([]) List<WarningItemModel> warningItems,
    WarningDailyReportModel? dailyReport,
    @Default(true) bool requiresAction,
    @Default(false) bool isResolved,
    int? resolvedByID,
    DateTime? resolvedAt,
    String? resolutionNotes,
    String? longitude,
    String? latitude,
    String? description,
    int? createdByID,
    required DateTime createdAt,
    required DateTime updatedAt,
    DateTime? deletedAt,
    List<FileModel>? files,
    CompanyResponseModel? company,
    RoadResponseModel? road,
    WorkScopeResponseModel? workScope,
    CreatedByResponseModel? createdBy,
    CreatedByResponseModel? resolvedBy,
  }) = _WarningModel;

  factory WarningModel.fromJson(Map<String, dynamic> json) =>
      _$WarningModelFromJson(json);

  Warning toEntity() {
    return Warning(
      id: id,
      uid: uid,
      warningType: WarningType.fromString(warningType),
      dailyReportID: dailyReportID,
      companyID: companyID,
      roadID: roadID,
      workScopeID: workScopeID,
      contractRelationID: contractRelationID,
      fromSection: fromSection,
      toSection: toSection,
      warningItems: warningItems.map((item) => item.toEntity()).toList(),
      dailyReport: dailyReport?.toEntity(),
      requiresAction: requiresAction,
      isResolved: isResolved,
      resolvedByID: resolvedByID,
      resolvedAt: resolvedAt,
      resolutionNotes: resolutionNotes,
      longitude: longitude,
      latitude: latitude,
      description: description,
      createdByID: createdByID,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
      files: files?.map((f) => f.toEntity()).toList(),
      company: company?.toEntity(),
      road: road?.toEntity(),
      workScope: workScope?.toEntity(),
      createdBy: createdBy?.toEntity(),
      resolvedBy: resolvedBy?.toEntity(),
    );
  }
}
