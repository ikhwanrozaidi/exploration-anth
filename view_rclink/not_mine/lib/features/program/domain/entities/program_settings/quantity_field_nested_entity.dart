import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dropdown_option_nested_entity.dart';

part 'quantity_field_nested_entity.g.dart';

@JsonSerializable()
class QuantityFieldNested extends Equatable {
  final int? id;
  final String? uid;
  final int? quantityTypeID;
  final String? name;
  final String? code;
  final String? fieldType; // DROPDOWN, DECIMAL, TEXT, etc.
  final String? unit;
  final String? unitMeasurement;
  final double? minValue;
  final double? maxValue;
  final int? minLength;
  final int? maxLength;
  final int? displayOrder;
  final bool? isRequired;
  final bool? isForSegment;
  final String? defaultValue;
  final String? placeholder;
  final String? helpText;
  final String? createdAt;
  final String? updatedAt;
  final List<DropdownOptionNested>? dropdownOptions;

  const QuantityFieldNested({
    this.id,
    this.uid,
    this.quantityTypeID,
    this.name,
    this.code,
    this.fieldType,
    this.unit,
    this.unitMeasurement,
    this.minValue,
    this.maxValue,
    this.minLength,
    this.maxLength,
    this.displayOrder,
    this.isRequired,
    this.isForSegment,
    this.defaultValue,
    this.placeholder,
    this.helpText,
    this.createdAt,
    this.updatedAt,
    this.dropdownOptions,
  });

  factory QuantityFieldNested.fromJson(Map<String, dynamic> json) =>
      _$QuantityFieldNestedFromJson(json);

  Map<String, dynamic> toJson() => _$QuantityFieldNestedToJson(this);

  QuantityFieldNested copyWith({
    int? id,
    String? uid,
    int? quantityTypeID,
    String? name,
    String? code,
    String? fieldType,
    String? unit,
    String? unitMeasurement,
    double? minValue,
    double? maxValue,
    int? minLength,
    int? maxLength,
    int? displayOrder,
    bool? isRequired,
    bool? isForSegment,
    String? defaultValue,
    String? placeholder,
    String? helpText,
    String? createdAt,
    String? updatedAt,
    List<DropdownOptionNested>? dropdownOptions,
  }) {
    return QuantityFieldNested(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      quantityTypeID: quantityTypeID ?? this.quantityTypeID,
      name: name ?? this.name,
      code: code ?? this.code,
      fieldType: fieldType ?? this.fieldType,
      unit: unit ?? this.unit,
      unitMeasurement: unitMeasurement ?? this.unitMeasurement,
      minValue: minValue ?? this.minValue,
      maxValue: maxValue ?? this.maxValue,
      minLength: minLength ?? this.minLength,
      maxLength: maxLength ?? this.maxLength,
      displayOrder: displayOrder ?? this.displayOrder,
      isRequired: isRequired ?? this.isRequired,
      isForSegment: isForSegment ?? this.isForSegment,
      defaultValue: defaultValue ?? this.defaultValue,
      placeholder: placeholder ?? this.placeholder,
      helpText: helpText ?? this.helpText,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      dropdownOptions: dropdownOptions ?? this.dropdownOptions,
    );
  }

  @override
  List<Object?> get props => [
    id,
    uid,
    quantityTypeID,
    name,
    code,
    fieldType,
    unit,
    unitMeasurement,
    minValue,
    maxValue,
    minLength,
    maxLength,
    displayOrder,
    isRequired,
    isForSegment,
    defaultValue,
    placeholder,
    helpText,
    createdAt,
    updatedAt,
    dropdownOptions,
  ];
}
