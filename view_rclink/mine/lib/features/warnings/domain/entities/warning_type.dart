/// Warning type discriminator
enum WarningType {
  reportWarning,
  inspectionWarning,
  siteWarning;

  /// Convert to backend enum string (SCREAMING_SNAKE_CASE)
  String get value {
    switch (this) {
      case WarningType.reportWarning:
        return 'REPORT_WARNING';
      case WarningType.inspectionWarning:
        return 'INSPECTION_WARNING';
      case WarningType.siteWarning:
        return 'SITE_WARNING';
    }
  }

  /// Parse from backend string
  static WarningType fromString(String value) {
    return WarningType.values.firstWhere(
      (type) => type.value == value,
      orElse: () => throw ArgumentError('Unknown warning type: $value'),
    );
  }
}
