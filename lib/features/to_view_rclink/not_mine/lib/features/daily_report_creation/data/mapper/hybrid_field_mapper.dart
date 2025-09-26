import 'package:flutter/material.dart';
import 'dart:convert';

import '../../domain/entities/scope_of_work/quantity_field.dart';
import '../../presentation/constant/report_model.dart';
import '../../presentation/constant/scope_configurations.dart';
import '../models/scope_of_work/quantity_field_model.dart';

class HybridFieldMapper {
  // Keep your existing scope configurations for fallback lookup
  static final Map<String, ScopeConfig> _existingConfigs =
      ScopeConfigurations.all;

  static FieldConfig fromQuantityField(
    QuantityField quantityField,
    String scopeId,
  ) {
    // Try to find existing field config for fallback
    final existingField = _findExistingField(quantityField.code, scopeId);

    return FieldConfig(
      // Direct API mappings
      id: quantityField.uid,
      title: quantityField.name,
      type: _mapFieldType(quantityField.fieldType),
      units: quantityField.unit,
      isRequired: quantityField.isRequired,

      // Hybrid mappings (API first, then fallback, then default)
      description:
          quantityField.helpText ??
          existingField?.description ??
          _generateDescription(quantityField.name),

      hintText:
          quantityField.placeholder ??
          existingField?.hintText ??
          _generateHintText(quantityField.name),

      icon:
          existingField?.icon ??
          _getIconForField(quantityField.code, quantityField.fieldType),

      // Process dropdown options from your existing DropdownOptionModel
      dropdownOptions:
          _getDropdownOptions(quantityField) ?? existingField?.dropdownOptions,

      // Numeric validation from API or existing config
      numericMin:
          _extractNumericMin(quantityField.validationRules) ??
          existingField?.numericMin,
      numericMax:
          _extractNumericMax(quantityField.validationRules) ??
          existingField?.numericMax,

      // Special features only from existing config (API doesn't have these)
      isTips: existingField?.isTips ?? false,
      pageNavigate: existingField?.pageNavigate,
      tipsTitle: existingField?.tipsTitle,
    );
  }

  static FieldConfig? _findExistingField(String fieldCode, String scopeId) {
    final scopeConfig = _existingConfigs[scopeId];
    if (scopeConfig == null) return null;

    // Search in all quantity options for this field code/id
    for (final quantityOption in scopeConfig.quantityOptions) {
      for (final field in quantityOption.fields) {
        if (field.id == fieldCode) {
          return field;
        }
      }
    }

    return null;
  }

  static List<String>? _getDropdownOptions(QuantityField quantityField) {
    if (quantityField.dropdownOptions == null ||
        quantityField.dropdownOptions!.isEmpty) {
      return null;
    }

    // final filteredOptions = quantityField.dropdownOptions!
    //     .where((option) => option.isActive)
    //     .toList();
    // filteredOptions.sort((a, b) => a.displayOrder.compareTo(b.displayOrder));
    // return filteredOptions.map((option) => option.value).toList();

    // sort by displayOrder
    final options = quantityField.dropdownOptions!;
    options.sort((a, b) => a.displayOrder.compareTo(b.displayOrder));

    return options.map((option) => option.value).toList();
  }

  static FieldType _mapFieldType(String apiFieldType) {
    switch (apiFieldType.toUpperCase()) {
      case 'DROPDOWN':
        return FieldType.dropdown;
      case 'TEXT':
        return FieldType.textField;
      case 'DECIMAL':
      case 'NUMERIC':
        return FieldType.numericField;
      case 'MULTIPLE_IMAGES':
        return FieldType.multipleImages;
      case 'NOTES':
        return FieldType.notes;
      default:
        return FieldType.textField;
    }
  }

  static IconData _getIconForField(String code, String fieldType) {
    switch (code.toLowerCase()) {
      case 'direction':
        return Icons.navigation;
      case 'method':
        return Icons.build;
      case 'length':
      case 'total_length':
        return Icons.straighten;
      case 'width':
        return Icons.width_normal;
      case 'thickness':
      case 'depth':
        return Icons.height;
      default:
        return _getDefaultIconForType(fieldType);
    }
  }

  static IconData _getDefaultIconForType(String fieldType) {
    switch (fieldType.toUpperCase()) {
      case 'DROPDOWN':
        return Icons.arrow_drop_down;
      case 'DECIMAL':
      case 'NUMERIC':
        return Icons.numbers;
      case 'MULTIPLE_IMAGES':
        return Icons.camera_alt;
      case 'NOTES':
        return Icons.note;
      default:
        return Icons.text_fields;
    }
  }

  static String _generateDescription(String name) {
    final lowerName = name.toLowerCase();
    if (lowerName.contains('direction')) {
      return 'Choose a direction of work';
    } else if (lowerName.contains('method')) {
      return 'Choose a working method';
    } else if (lowerName.contains('length')) {
      return 'Enter length';
    }
    return 'Enter $name';
  }

  static String _generateHintText(String name) {
    final lowerName = name.toLowerCase();
    if (lowerName.contains('length')) {
      return 'Type total length';
    } else if (lowerName.contains('direction')) {
      return 'Choose direction';
    } else if (lowerName.contains('method')) {
      return 'Choose method';
    }
    return 'Enter $lowerName';
  }

  static double? _extractNumericMin(String? validationRules) {
    if (validationRules == null || validationRules.isEmpty) return null;
    try {
      final Map<String, dynamic> rules = jsonDecode(validationRules);
      return rules['min']?.toDouble();
    } catch (e) {
      return null;
    }
  }

  static double? _extractNumericMax(String? validationRules) {
    if (validationRules == null || validationRules.isEmpty) return null;
    try {
      final Map<String, dynamic> rules = jsonDecode(validationRules);
      return rules['max']?.toDouble();
    } catch (e) {
      return null;
    }
  }
}
