import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/quantity_field_nested_entity.dart';
import 'dropdown_option_nested_model.dart';

part 'quantity_field_nested_model.freezed.dart';
part 'quantity_field_nested_model.g.dart';

@freezed
abstract class QuantityFieldNestedModel with _$QuantityFieldNestedModel {
  const factory QuantityFieldNestedModel({
    int? id,
    String? uid,
    int? quantityTypeID,
    String? name,
    String? code,
    String? fieldType, // DROPDOWN, DECIMAL, TEXT, etc.
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
    List<DropdownOptionNestedModel>? dropdownOptions,
  }) = _QuantityFieldNestedModel;

  factory QuantityFieldNestedModel.fromJson(Map<String, dynamic> json) =>
      _$QuantityFieldNestedModelFromJson(json);
}

extension QuantityFieldNestedModelX on QuantityFieldNestedModel {
  QuantityFieldNested toEntity() {
    return QuantityFieldNested(
      id: id,
      uid: uid,
      quantityTypeID: quantityTypeID,
      name: name,
      code: code,
      fieldType: fieldType,
      unit: unit,
      unitMeasurement: unitMeasurement,
      minValue: minValue,
      maxValue: maxValue,
      minLength: minLength,
      maxLength: maxLength,
      displayOrder: displayOrder,
      isRequired: isRequired,
      isForSegment: isForSegment,
      defaultValue: defaultValue,
      placeholder: placeholder,
      helpText: helpText,
      createdAt: createdAt,
      updatedAt: updatedAt,
      dropdownOptions: dropdownOptions
          ?.map((option) => option.toEntity())
          .toList(),
    );
  }

  static QuantityFieldNestedModel fromEntity(QuantityFieldNested entity) {
    return QuantityFieldNestedModel(
      id: entity.id,
      uid: entity.uid,
      quantityTypeID: entity.quantityTypeID,
      name: entity.name,
      code: entity.code,
      fieldType: entity.fieldType,
      unit: entity.unit,
      unitMeasurement: entity.unitMeasurement,
      minValue: entity.minValue,
      maxValue: entity.maxValue,
      minLength: entity.minLength,
      maxLength: entity.maxLength,
      displayOrder: entity.displayOrder,
      isRequired: entity.isRequired,
      isForSegment: entity.isForSegment,
      defaultValue: entity.defaultValue,
      placeholder: entity.placeholder,
      helpText: entity.helpText,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      dropdownOptions: entity.dropdownOptions
          ?.map((option) => DropdownOptionNestedModelX.fromEntity(option))
          .toList(),
    );
  }
}
