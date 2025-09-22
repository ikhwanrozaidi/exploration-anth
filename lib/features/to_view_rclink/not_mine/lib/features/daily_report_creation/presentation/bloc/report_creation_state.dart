import '../constant/report_model.dart';

// BLoC State
class ReportCreationState {
  final String? selectedScopeId;
  final List<String> selectedQuantityIds;
  final Map<String, dynamic> fieldValues;
  final Map<String, List<String>> imageFields;
  final Map<String, String?> fieldErrors;
  final bool isValid;

  ReportCreationState({
    this.selectedScopeId,
    this.selectedQuantityIds = const [],
    this.fieldValues = const {},
    this.imageFields = const {},
    this.fieldErrors = const {},
    this.isValid = false,
  });

  ReportCreationState copyWith({
    String? selectedScopeId,
    List<String>? selectedQuantityIds,
    Map<String, dynamic>? fieldValues,
    Map<String, List<String>>? imageFields,
    Map<String, String?>? fieldErrors,
    bool? isValid,
  }) {
    return ReportCreationState(
      selectedScopeId: selectedScopeId ?? this.selectedScopeId,
      selectedQuantityIds: selectedQuantityIds ?? this.selectedQuantityIds,
      fieldValues: fieldValues ?? this.fieldValues,
      imageFields: imageFields ?? this.imageFields,
      fieldErrors: fieldErrors ?? this.fieldErrors,
      isValid: isValid ?? this.isValid,
    );
  }

  // Convert to JSON for API
  Map<String, dynamic> toJson(Map<String, ScopeConfig> scopeConfigs) {
    if (selectedScopeId == null) return {};

    final scopeConfig = scopeConfigs[selectedScopeId!];
    if (scopeConfig == null) return {};

    Map<String, dynamic> commonFields = {};
    Map<String, dynamic> quantities = {};

    // Process common fields
    for (final field in scopeConfig.commonFields) {
      if (field.type == FieldType.multipleImages) {
        commonFields[field.id] = imageFields[field.id] ?? [];
      } else {
        commonFields[field.id] = fieldValues[field.id];
      }
    }

    // Process quantity fields
    for (final quantityId in selectedQuantityIds) {
      final quantityOption = scopeConfig.quantityOptions.firstWhere(
        (q) => q.id == quantityId,
      );

      Map<String, dynamic> quantityData = {};
      for (final field in quantityOption.fields) {
        if (field.type == FieldType.multipleImages) {
          quantityData[field.id] =
              imageFields['${quantityId}_${field.id}'] ?? [];
        } else {
          quantityData[field.id] = fieldValues['${quantityId}_${field.id}'];
        }
      }
      quantities[quantityId] = quantityData;
    }

    return {
      'scope': selectedScopeId,
      'commonFields': commonFields,
      'quantities': quantities,
    };
  }
}
