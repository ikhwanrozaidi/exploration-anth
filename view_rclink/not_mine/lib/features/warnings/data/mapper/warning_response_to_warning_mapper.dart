import '../../../daily_report/domain/entities/warning_response.dart';
import '../../domain/entities/warning.dart';
import '../../domain/entities/warning_type.dart';

/// Maps WarningResponse (from daily report API) to Warning entity
/// for use with presentation widgets that expect the full Warning entity.
///
/// Note: WarningResponse contains a subset of Warning fields.
/// Fields not available in WarningResponse are set to sensible defaults.
class WarningResponseToWarningMapper {
  /// Convert WarningResponse to Warning entity
  static Warning fromWarningResponse(WarningResponse response) {
    return Warning(
      // Primary keys
      id: response.id,
      uid: response.uid,

      // Warning type - reportWarning since it comes from a daily report
      warningType: WarningType.reportWarning,

      // Optional linkage - not available in response
      dailyReportID: null,

      // Foreign keys - not available in response, use placeholder values
      // These are not used by ExpandableWarningCard widget
      companyID: 0,
      roadID: 0,
      workScopeID: 0,
      contractRelationID: null,

      // Section information
      fromSection: response.fromSection,
      toSection: response.toSection,

      // Warning items - CRITICAL: This is what the widget actually uses
      warningItems: response.warningItems,
      dailyReport: null,

      // Completion tracking - not available in response
      requiresAction: true, // Default to requiring action
      isResolved: false, // Default to unresolved
      resolvedByID: null,
      resolvedAt: null,
      resolutionNotes: null,

      // Location (GPS coordinates)
      longitude: response.longitude,
      latitude: response.latitude,

      // Additional notes
      description: response.description,

      // Creation tracking
      createdByID: 0, // Not available in response (only has uid)
      createdAt: response.createdAt,
      updatedAt: response.updatedAt,
      deletedAt: null,

      // Nested/expanded entities
      files: null,
      company: null,
      road: null,
      workScope: null,
      createdBy: response.createdBy,
      resolvedBy: null,
    );
  }
}
