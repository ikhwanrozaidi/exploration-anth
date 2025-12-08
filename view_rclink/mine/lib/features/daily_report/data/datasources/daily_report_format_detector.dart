/// Helper class to detect the format of daily report data stored in local database.
///
/// We handle two different JSON formats for equipment and quantities:
///
/// **1. Draft Format** (from auto-save):
/// - Minimal data with UID-only references
/// - Saved during auto-save before report submission
/// - Example Equipment: `{"workEquipmentUID": "uid-123"}`
/// - Example Quantity: `{"quantityTypeUID": "qty-456", "sequenceNo": 1, "quantityValues": [...]}`
///
/// **2. Server Format** (after submission):
/// - Complete data with full objects including names and codes
/// - Returned from API after successful report submission
/// - Example Equipment: `{"uid": "uid-123", "name": "Excavator", "code": "EXC-001"}`
/// - Example Quantity: `{"quantityType": {...}, "quantityValues": [...]}`
///
/// This dual format handling maintains backward compatibility with existing drafts
/// while supporting server responses. See the equipment parsing (line ~551) and
/// quantity parsing (line ~586) in `daily_report_local_datasource.dart` for usage.
///
/// ## Future Migration Plan
/// This is temporary technical debt. Post-launch, migrate to versioned schema:
/// ```dart
/// {"v": 2, "data": [...]}  // Explicit version instead of format detection
/// ```
class DailyReportFormatDetector {
  // Private constructor to prevent instantiation
  DailyReportFormatDetector._();

  /// Detects if equipment JSON is in draft format vs server format.
  ///
  /// **Draft format** (from auto-save):
  /// - Contains `"workEquipmentUID"` key
  /// - Minimal data (UID only, no name/code)
  ///
  /// **Server format** (from API):
  /// - Contains `"uid"` key (not "workEquipmentUID")
  /// - Complete data (uid, name, code)
  ///
  /// Example:
  /// ```dart
  /// final json = {"workEquipmentUID": "abc-123"};
  /// final isDraft = DailyReportFormatDetector.isDraftEquipmentFormat(json);
  /// // Returns: true
  /// ```
  static bool isDraftEquipmentFormat(Map<String, dynamic> json) {
    return json.containsKey('workEquipmentUID');
  }

  /// Detects if quantity JSON is in draft format vs server format.
  ///
  /// **Draft format** (from auto-save):
  /// - Contains `"quantityTypeUID"` key (string)
  /// - Quantity values have `"quantityFieldUID"` keys (strings)
  ///
  /// **Server format** (from API):
  /// - Contains `"quantityType"` key (object with uid/name/code)
  /// - Quantity values have `"quantityField"` keys (objects)
  ///
  /// Example:
  /// ```dart
  /// final json = {
  ///   "quantityTypeUID": "qty-789",
  ///   "quantityValues": [{"quantityFieldUID": "field-1", "value": "10"}]
  /// };
  /// final isDraft = DailyReportFormatDetector.isDraftQuantityFormat(json);
  /// // Returns: true
  /// ```
  static bool isDraftQuantityFormat(Map<String, dynamic> json) {
    return json.containsKey('quantityTypeUID');
  }
}
