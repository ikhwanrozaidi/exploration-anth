import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'dropdown_option.dart';

part 'quantity_field.g.dart';

@JsonSerializable()
class QuantityField extends Equatable {
  final int id;
  final String uid;
  final String name;
  final String code;
  final String fieldType;
  final String? unit;
  final String? validationRules;
  final int displayOrder;
  final bool isRequired;
  final bool isForSegment;
  final String? defaultValue;
  final String? placeholder;
  final String? helpText;
  final List<DropdownOption> dropdownOptions;

  const QuantityField({
    required this.id,
    required this.uid,
    required this.name,
    required this.code,
    required this.fieldType,
    this.unit,
    this.validationRules,
    required this.displayOrder,
    required this.isRequired,
    required this.isForSegment,
    this.defaultValue,
    this.placeholder,
    this.helpText,
    required this.dropdownOptions,
  });

  @override
  List<Object?> get props => [
    id,
    uid,
    name,
    code,
    fieldType,
    unit,
    validationRules,
    displayOrder,
    isRequired,
    isForSegment,
    defaultValue,
    placeholder,
    helpText,
    dropdownOptions,
  ];

  factory QuantityField.fromJson(Map<String, dynamic> json) =>
      _$QuantityFieldFromJson(json);
  Map<String, dynamic> toJson() => _$QuantityFieldToJson(this);
}
