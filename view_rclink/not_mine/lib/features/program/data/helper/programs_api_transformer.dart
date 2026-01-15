import 'package:intl/intl.dart';

import '../../domain/entities/quantity_field_nested_entity.dart';
import '../../domain/entities/quantity_type_nested_entity.dart';
import '../models/submit_program_request_model.dart';

class ProgramApiTransformer {
  /// Generate program name: "R02 - Road Shoulder - January 2026"
  static String generateProgramName({
    required String workScopeCode,
    required String workScopeName,
    required DateTime periodStart,
  }) {
    final monthYear = DateFormat('MMMM yyyy').format(periodStart);
    return '$workScopeCode - $workScopeName - $monthYear';
  }

  /// Transform quantities from storage format to API format (R02 ONLY)
  static List<QuantityInputModel> transformQuantitiesForAPI({
    required Map<String, Map<String, dynamic>> quantityFieldData,
    required List<dynamic> quantityTypes,
    String? quantityNotes,
  }) {
    final apiQuantities = <QuantityInputModel>[];

    for (final entry in quantityFieldData.entries) {
      final quantityTypeUID = entry.key;
      final data = entry.value;

      // Find the quantity type definition to get field UIDs
      final quantityType =
          quantityTypes.firstWhere(
                (qt) => (qt as QuantityTypeNested).uid == quantityTypeUID,
                orElse: () => quantityTypes.first,
              )
              as QuantityTypeNested;

      final fields = data['fields'] as Map<String, dynamic>? ?? {};
      final segments = data['segments'] as List<dynamic>? ?? [];

      // Extract totalLength from fields
      final totalLengthStr = fields['total_length']?.toString() ?? '0';
      final totalLength = double.tryParse(totalLengthStr) ?? 0.0;

      // Transform fields to quantityValues (non-segment fields only)
      final quantityValues = <QuantityValueInputModel>[];

      for (final fieldEntry in fields.entries) {
        final fieldCode = fieldEntry.key;
        final fieldValue = fieldEntry.value;

        // Find the field definition to get UID
        QuantityFieldNested? fieldDef;
        try {
          fieldDef = quantityType.quantityFields?.firstWhere(
            (f) => f.code == fieldCode && f.isForSegment == false,
          );
        } catch (e) {
          fieldDef = null;
        }

        if (fieldDef != null && fieldDef.uid != null) {
          quantityValues.add(
            QuantityValueInputModel(
              quantityFieldUID: fieldDef.uid!,
              value: fieldValue.toString(),
            ),
          );
        }
      }

      // Transform segments
      final apiSegments = <QuantitySegmentInputModel>[];

      for (final seg in segments) {
        final segmentMap = seg as Map<String, dynamic>;
        final segmentValues = <QuantityValueInputModel>[];

        // Get all segment field definitions
        final segmentFields =
            quantityType.quantityFields
                ?.where((f) => f.isForSegment == true)
                .toList() ??
            [];

        // Transform each segment field
        for (final fieldDef in segmentFields) {
          final fieldCode = fieldDef.code;
          final fieldValue = segmentMap[fieldCode];

          if (fieldValue != null && fieldDef.uid != null) {
            segmentValues.add(
              QuantityValueInputModel(
                quantityFieldUID: fieldDef.uid!,
                value: fieldValue.toString(),
              ),
            );
          }
        }

        apiSegments.add(
          QuantitySegmentInputModel(
            segmentNumber: segmentMap['segmentNumber'] as int,
            startDistance: (segmentMap['startDistance'] as double).toInt(),
            endDistance: (segmentMap['endDistance'] as double).toInt(),
            segmentValues: segmentValues,
          ),
        );
      }

      apiQuantities.add(
        QuantityInputModel(
          quantityTypeUID: quantityTypeUID,
          sequenceNo: 1,
          totalLength: totalLength,
          notes: quantityNotes ?? '',
          quantityValues: quantityValues,
          segments: apiSegments,
        ),
      );
    }

    return apiQuantities;
  }
}
