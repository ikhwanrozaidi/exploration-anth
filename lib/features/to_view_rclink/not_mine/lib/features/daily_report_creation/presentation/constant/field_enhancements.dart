import 'package:flutter/material.dart';
import '../constant/report_model.dart';
import '../widgets/tips_page.dart';

/// UI enhancement mappings for API fields
class FieldEnhancements {
  // Static map for UI enhancements based on field codes
  static const Map<String, FieldUIEnhancement> _enhancements = {
    // Direction fields
    'direction': FieldUIEnhancement(
      icon: Icons.navigation,
      description: "Select the direction of work",
      isTips: false,
    ),
    'arah': FieldUIEnhancement(
      icon: Icons.navigation,
      description: "Pilih arah kerja",
      isTips: false,
    ),

    // Patching method fields
    'patching_method': FieldUIEnhancement(
      icon: Icons.construction,
      description: "Choose the patching method",
      isTips: true,
      tipsTitle: "Patching Method Guidelines",
    ),
    'cara_tampalan': FieldUIEnhancement(
      icon: Icons.construction,
      description: "Pilih cara tampalan",
      isTips: true,
      tipsTitle: "Panduan Cara Tampalan",
    ),

    // Photo fields
    'photos_before': FieldUIEnhancement(
      icon: Icons.camera_alt,
      description: "Take photos before work starts",
      isTips: true,
      tipsTitle: "Photo Guidelines",
    ),
    'photos_after': FieldUIEnhancement(
      icon: Icons.camera,
      description: "Take photos after work completion",
      isTips: true,
      tipsTitle: "Photo Guidelines",
    ),
    'condition_snapshot': FieldUIEnhancement(
      icon: Icons.camera,
      description: "Capture current road condition",
      isTips: true,
      tipsTitle: "Condition Photo Tips",
    ),
    'images': FieldUIEnhancement(
      icon: Icons.camera_alt,
      description: "Take multiple images",
      isTips: true,
      tipsTitle: "Photo Guidelines",
    ),

    // Measurement fields
    'length': FieldUIEnhancement(
      icon: Icons.straighten,
      description: "Enter the length measurement",
      isTips: false,
    ),
    'width': FieldUIEnhancement(
      icon: Icons.width_wide,
      description: "Enter the width measurement",
      isTips: false,
    ),
    'depth': FieldUIEnhancement(
      icon: Icons.height,
      description: "Enter the depth measurement",
      isTips: false,
    ),
    'area': FieldUIEnhancement(
      icon: Icons.crop_square,
      description: "Enter the area measurement",
      isTips: false,
    ),
    'quantity': FieldUIEnhancement(
      icon: Icons.numbers,
      description: "Enter the quantity",
      isTips: false,
    ),

    // Worker and equipment fields
    'workers': FieldUIEnhancement(
      icon: Icons.groups,
      description: "Number of workers",
      isTips: false,
    ),
    'equipment': FieldUIEnhancement(
      icon: Icons.construction,
      description: "Select equipment used",
      isTips: false,
    ),

    // Notes and description fields
    'notes': FieldUIEnhancement(
      icon: Icons.note_alt,
      description: "Additional notes",
      isTips: false,
    ),
    'remarks': FieldUIEnhancement(
      icon: Icons.comment,
      description: "Additional remarks",
      isTips: false,
    ),
    'description': FieldUIEnhancement(
      icon: Icons.description,
      description: "Detailed description",
      isTips: false,
    ),
  };

  static FieldUIEnhancement? getEnhancement(String fieldCode) {
    return _enhancements[fieldCode.toLowerCase()];
  }

  /// Get default icon based on field type
  static IconData getDefaultIconForType(String fieldType) {
    switch (fieldType.toUpperCase()) {
      case 'DROPDOWN':
        return Icons.arrow_drop_down;
      case 'TEXT':
        return Icons.text_fields;
      case 'TEXTAREA':
        return Icons.subject;
      case 'NUMBER':
      case 'DECIMAL':
        return Icons.numbers;
      case 'DATE':
        return Icons.calendar_today;
      case 'CHECKBOX':
        return Icons.check_box;
      default:
        return Icons.input;
    }
  }

  /// Convert API field to UI FieldConfig
  static FieldConfig createFieldConfigFromAPI(dynamic apiField) {
    final enhancement = getEnhancement(apiField.code);
    final fieldType = _mapFieldType(apiField.fieldType);

    return FieldConfig(
      id: apiField.code,
      title: apiField.name,
      description: enhancement?.description ?? apiField.helpText ?? '',
      icon: enhancement?.icon ?? getDefaultIconForType(apiField.fieldType),
      type: fieldType,
      hintText: apiField.placeholder,
      isRequired: apiField.isRequired ?? false,
      isTips: enhancement?.isTips ?? false,
      tipsTitle: enhancement?.tipsTitle,
      pageNavigate: enhancement?.pageNavigate,
      dropdownOptions: apiField.dropdownOptions
          ?.map<String>((option) => option.value)
          .toList(),
      units: _getUnitsFromField(apiField),
      numericMin: _getNumericMin(apiField),
      numericMax: _getNumericMax(apiField),
    );
  }

  /// Map API field type to UI field type
  static FieldType _mapFieldType(String apiFieldType) {
    switch (apiFieldType.toUpperCase()) {
      case 'TEXT':
        return FieldType.textField;
      case 'TEXTAREA':
        return FieldType.notes;
      case 'NUMBER':
      case 'DECIMAL':
        return FieldType.numericField;
      case 'DROPDOWN':
        return FieldType.dropdown;
      case 'CHECKBOX':
        return FieldType.dropdown; // Can be handled as single-option dropdown
      case 'DATE':
        return FieldType.textField; // Date picker will be handled in UI
      default:
        return FieldType.textField;
    }
  }

  /// Extract units from API field
  static String? _getUnitsFromField(dynamic apiField) {
    return apiField.unit;
  }

  /// Extract numeric minimum from validation rules
  static double? _getNumericMin(dynamic apiField) {
    // Parse validation rules if they exist
    // This would depend on how validation rules are structured in API
    return null;
  }

  /// Extract numeric maximum from validation rules
  static double? _getNumericMax(dynamic apiField) {
    // Parse validation rules if they exist
    // This would depend on how validation rules are structured in API
    return null;
  }
}

/// UI enhancement data class
class FieldUIEnhancement {
  final IconData? icon;
  final String? description;
  final bool isTips;
  final String? tipsTitle;
  final Widget? pageNavigate;

  const FieldUIEnhancement({
    this.icon,
    this.description,
    this.isTips = false,
    this.tipsTitle,
    this.pageNavigate,
  });
}

/// Weather condition mapping
class WeatherEnhancements {
  static const Map<String, WeatherUIData> _weatherData = {
    'SUNNY': WeatherUIData(
      displayName: 'Sunny',
      icon: Icons.wb_sunny,
      description: 'Clear and sunny weather',
    ),
    'CLOUDY': WeatherUIData(
      displayName: 'Cloudy',
      icon: Icons.cloud,
      description: 'Cloudy weather conditions',
    ),
    'RAIN': WeatherUIData(
      displayName: 'Rain',
      icon: Icons.water_drop,
      description: 'Rainy weather conditions',
    ),
    'FOG': WeatherUIData(
      displayName: 'Fog',
      icon: Icons.foggy,
      description: 'Foggy weather conditions',
    ),
    'HAZE': WeatherUIData(
      displayName: 'Haze',
      icon: Icons.blur_on,
      description: 'Hazy weather conditions',
    ),
  };

  static Map<String, WeatherUIData> get weatherData => _weatherData;

  static WeatherUIData? getWeatherData(String weatherCondition) {
    return _weatherData[weatherCondition.toUpperCase()];
  }

  static List<String> getAllWeatherOptions() {
    return _weatherData.keys.toList();
  }

  static List<String> getAllWeatherDisplayNames() {
    return _weatherData.values.map((data) => data.displayName).toList();
  }
}

class WeatherUIData {
  final String displayName;
  final IconData icon;
  final String description;

  const WeatherUIData({
    required this.displayName,
    required this.icon,
    required this.description,
  });
}
