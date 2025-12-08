import 'package:intl/intl.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_quantity_type.dart';
import '../models/update_daily_report_model.dart';
import '../models/create_daily_report_model.dart';
import '../models/create_daily_report_quantity_field_model.dart';
import '../models/create_daily_report_quantity_model.dart';
import '../../presentation/bloc/daily_report_create/daily_report_create_state.dart';

class ReportDataToUpdateModelMapper {
  /// Convert ReportData to UpdateDailyReportModel
  /// All fields are optional for partial updates
  static UpdateDailyReportModel fromReportData(
    ReportData data, {
    String? existingReportUID,
  }) {
    return UpdateDailyReportModel(
      // Report name
      name: _generateReportName(data),

      // Weather condition
      weatherCondition: data.selections.selectedWeather != null
          ? _mapWeatherToEnum(data.selections.selectedWeather)
          : null,

      // Work performed (always true if submitting)
      workPerformed: true,

      // Work scope UID
      workScopeUID: data.selections.selectedScope?.uid,

      // Road UID
      roadUID: data.selections.selectedRoad?.uid,

      // Total workers
      totalWorkers: data.selections.workerCount > 0
          ? data.selections.workerCount
          : null,

      // Section range
      fromSection: _parseSection(data.selections.section, isFrom: true),
      toSection: _parseSection(data.selections.section, isFrom: false),

      // Location coordinates from field values
      longitude: _parseDouble(data.formData.fieldValues['longitude']),
      latitude: _parseDouble(data.formData.fieldValues['latitude']),

      // Notes
      notes: _extractNotes(data),

      // Equipments (array of UIDs only)
      // NOTE: Backend replaces all equipment, so send complete list
      equipments: data.selections.selectedEquipment.isNotEmpty
          ? data.selections.selectedEquipment.map((e) => e.uid).toList()
          : [],

      // Quantities (complete array with nested structure)
      // NOTE: Backend replaces all quantities, so send complete list
      quantities: _mapQuantities(
        data.selections.selectedQuantityTypes,
        data.selections.quantityFieldData,
        data.selections.segmentData,
      ),

      // Status and rejection reason not modified during edit
      status: null,
      rejectionReason: null,
    );
  }

  /// Generate report name from scope and date
  static String _generateReportName(ReportData data) {
    final scopeName = data.selections.selectedScope?.name ?? 'Daily Report';
    final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return '$scopeName - $date';
  }

  /// Map weather string to enum
  static WeatherCondition? _mapWeatherToEnum(String? weather) {
    if (weather == null) return null;

    switch (weather.toLowerCase()) {
      case 'sunny':
        return WeatherCondition.sunny;
      case 'rainy':
        return WeatherCondition.rainy;
      case 'cloudy':
        return WeatherCondition.cloudy;
      case 'foggy':
        return WeatherCondition.foggy;
      case 'windy':
        return WeatherCondition.windy;
      default:
        return null;
    }
  }

  /// Parse section input (e.g., "10.5" or "10.5-15.2")
  static double? _parseSection(String? section, {required bool isFrom}) {
    if (section == null || section.isEmpty) return null;

    try {
      if (section.contains('-')) {
        final parts = section.split('-');
        if (parts.length == 2) {
          return isFrom
              ? double.tryParse(parts[0].trim())
              : double.tryParse(parts[1].trim());
        }
      }
      // Single value - return as fromSection only
      return isFrom ? double.tryParse(section.trim()) : null;
    } catch (e) {
      print('Error parsing section: $e');
      return null;
    }
  }

  /// Parse double value from dynamic field value (String or double)
  static double? _parseDouble(dynamic value) {
    if (value == null) return null;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) {
      return double.tryParse(value.trim());
    }
    return null;
  }

  /// Extract notes from selections
  static String? _extractNotes(ReportData data) {
    final notes = data.selections.notes;
    return (notes.isNotEmpty) ? notes : null;
  }

  /// Map quantities from selected types and quantity field data from BLoC
  /// Returns empty list if no quantities (backend will replace all)
  static List<CreateDailyReportQuantityModel>? _mapQuantities(
    List<WorkQuantityType> selectedQuantityTypes,
    Map<String, Map<String, dynamic>> quantityFieldData,
    Map<String, List<Map<String, dynamic>>> segmentData,
  ) {
    if (quantityFieldData.isEmpty) return [];

    final quantities = <CreateDailyReportQuantityModel>[];

    // Iterate over each quantity instance (composite keys)
    for (final entry in quantityFieldData.entries) {
      final compositeKey = entry.key; // Format: "quantityTypeUID_sequenceNo"
      final typeFieldData = entry.value;

      if (typeFieldData.isEmpty) continue;

      // Parse composite key to extract quantityTypeUID and sequenceNo
      final parts = compositeKey.split('_');
      final quantityTypeUID = parts.length >= 2
          ? parts
                .sublist(0, parts.length - 1)
                .join('_') // Handle UIDs with underscores
          : compositeKey;
      final sequenceNo = parts.length >= 2 ? int.tryParse(parts.last) ?? 1 : 1;

      // Find the corresponding quantity type
      final quantityType = selectedQuantityTypes.firstWhere(
        (qt) => qt.uid == quantityTypeUID,
        orElse: () =>
            selectedQuantityTypes.first, // Fallback (shouldn't happen)
      );

      // Extract field values for this quantity instance
      final quantityValues = <CreateDailyReportQuantityFieldModel>[];

      // Extract totalLength if available
      double? totalLength;

      for (final field in quantityType.quantityFields) {
        // Check if this field has a value in the instance's field data
        final fieldValue = typeFieldData[field.uid];

        // Track total_length for segment-based quantities
        if (field.code.toLowerCase() == 'total_length' && fieldValue != null) {
          totalLength = double.tryParse(fieldValue.toString());
        }

        if (fieldValue != null &&
            fieldValue.toString().isNotEmpty &&
            !field.uid.endsWith('_images')) {
          // Skip image fields
          quantityValues.add(
            CreateDailyReportQuantityFieldModel(
              quantityFieldUID: field.uid,
              value: fieldValue.toString(),
            ),
          );
        }
      }

      // Get segment data for this quantity instance using composite key
      final typeSegments = segmentData[compositeKey];

      // Only add quantity if it has at least one value
      if (quantityValues.isNotEmpty || typeSegments != null) {
        quantities.add(
          CreateDailyReportQuantityModel(
            quantityTypeUID: quantityTypeUID, // Use extracted UID
            sequenceNo: sequenceNo, // Use extracted sequence number
            totalLength: totalLength,
            notes: null, // Quantity-specific notes not yet implemented
            quantityValues: quantityValues,
            segments: null, // TODO: Convert typeSegments to proper model format
          ),
        );
      }
    }

    return quantities;
  }
}
