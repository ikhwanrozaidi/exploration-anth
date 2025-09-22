import 'package:flutter/material.dart';

// Field Configuration Model
class FieldConfig {
  final String id;
  final String title;
  final String description;
  final IconData? icon;
  final FieldType type;
  final String? hintText;
  final double? numericMin;
  final double? numericMax;
  final String? units;
  final List<String>? dropdownOptions;
  final bool isRequired;
  final bool? isTips;
  final Widget? pageNavigate;
  final String? tipsTitle;

  FieldConfig({
    required this.id,
    required this.title,
    required this.description,
    this.icon,
    required this.type,
    this.hintText,
    this.numericMin,
    this.numericMax,
    this.units,
    this.dropdownOptions,
    this.isRequired = false,
    this.isTips,
    this.pageNavigate,
    this.tipsTitle,
  });
}

enum FieldType { multipleImages, textField, numericField, dropdown, notes }

// Quantity Option Model
class QuantityOption {
  final String id;
  final String name;
  final List<FieldConfig> fields;

  QuantityOption({required this.id, required this.name, required this.fields});
}

// Scope Configuration Model
class ScopeConfig {
  final String id;
  final String name;
  final List<FieldConfig> commonFields;
  final List<QuantityOption> quantityOptions;

  ScopeConfig({
    required this.id,
    required this.name,
    required this.commonFields,
    required this.quantityOptions,
  });
}
