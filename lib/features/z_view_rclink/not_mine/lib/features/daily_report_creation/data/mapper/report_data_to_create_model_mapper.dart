import 'package:intl/intl.dart';
import '../../../../../../../to_view_rclink/not_mine/lib/features/needrevise_daily_report/data/models/create_daily_report_equipment_model.dart';
import '../../../../../../../to_view_rclink/not_mine/lib/features/needrevise_daily_report/data/models/create_daily_report_model.dart';
import '../../../../../../../to_view_rclink/not_mine/lib/features/needrevise_daily_report/data/models/create_daily_report_quantity_field_model.dart';
import '../../../../../../../to_view_rclink/not_mine/lib/features/needrevise_daily_report/data/models/create_daily_report_quantity_model.dart';
import '../../domain/entities/scope_of_work/work_quantity_type.dart';
import '../../presentation/bloc/report_creation_state.dart';

class ReportDataToCreateModelMapper {
  static CreateDailyReportModel fromReportData(ReportData data) {
    return CreateDailyReportModel(
      // REQUIRED: Generate report name
      name: _generateReportName(data),

      // REQUIRED: Map weather condition to enum
      weatherCondition: _mapWeatherToEnum(data.selections.selectedWeather),

      // REQUIRED: Always true if submitting
      workPerformed: true,

      // REQUIRED: Work scope UID
      workScopeUID: data.selections.selectedScope!.uid,

      // REQUIRED: Road UID
      roadUID: data.selections.selectedRoad!.uid!,

      // OPTIONAL: Total workers
      totalWorkers: data.selections.workerImages.isNotEmpty
          ? data.selections.workerImages.length
          : null,

      // OPTIONAL: Section range
      fromSection: _parseSection(data.selections.section, isFrom: true),
      toSection: _parseSection(data.selections.section, isFrom: false),

      // OPTIONAL: Location coordinates (not captured in current form)
      longitude: null,
      latitude: null,

      // OPTIONAL: Notes
      notes: _extractNotes(data),

      // OPTIONAL: Equipments
      equipments: data.selections.selectedEquipment.isNotEmpty
          ? data.selections.selectedEquipment
                .map(
                  (e) =>
                      CreateDailyReportEquipmentModel(workEquipmentUID: e.uid),
                )
                .toList()
          : null,

      // OPTIONAL: Quantities
      quantities: _mapQuantities(
        data.selections.selectedQuantityTypes,
        data.formData.fieldValues,
      ),
    );
  }

  /// Generate report name from scope and date
  static String _generateReportName(ReportData data) {
    final scopeName = data.selections.selectedScope?.name ?? 'Daily Report';
    final date = DateFormat('yyyy-MM-dd').format(DateTime.now());
    return '$scopeName - $date';
  }

  /// Map weather string to enum
  static WeatherCondition _mapWeatherToEnum(String? weather) {
    if (weather == null) return WeatherCondition.sunny;

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
        return WeatherCondition.sunny;
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

  /// Extract notes from condition snapshots or other fields
  static String? _extractNotes(ReportData data) {
    // TODO: Extract notes from conditionSnapshots or other form fields
    // For now, return null as notes field is not clearly defined in current form
    return null;
  }

  /// Map quantities from selected types and form field values
  static List<CreateDailyReportQuantityModel>? _mapQuantities(
    List<WorkQuantityType> selectedQuantityTypes,
    Map<String, dynamic> fieldValues,
  ) {
    if (selectedQuantityTypes.isEmpty) return null;

    final quantities = <CreateDailyReportQuantityModel>[];

    for (final quantityType in selectedQuantityTypes) {
      // Extract field values for this quantity type
      final quantityValues = <CreateDailyReportQuantityFieldModel>[];

      if (quantityType.quantityFields != null) {
        for (final field in quantityType.quantityFields!) {
          // Check if this field has a value in fieldValues
          final fieldValue = fieldValues[field.uid] ?? fieldValues[field.code];

          if (fieldValue != null && fieldValue.toString().isNotEmpty) {
            quantityValues.add(
              CreateDailyReportQuantityFieldModel(
                quantityFieldUID: field.uid,
                value: fieldValue.toString(),
              ),
            );
          }
        }
      }

      // Only add quantity if it has at least one value
      if (quantityValues.isNotEmpty) {
        quantities.add(
          CreateDailyReportQuantityModel(
            quantityTypeUID: quantityType.uid,
            sequenceNo: 1, // Default sequence number
            totalLength: null, // TODO: Extract from segment data if available
            notes: null, // TODO: Extract quantity-specific notes if available
            quantityValues: quantityValues,
            segments: null, // Segments excluded for now (complex)
          ),
        );
      }
    }

    return quantities.isNotEmpty ? quantities : null;
  }
}
