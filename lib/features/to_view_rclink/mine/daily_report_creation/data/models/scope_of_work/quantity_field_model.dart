import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/scope_of_work/quantity_field.dart';
import 'dropdown_option_model.dart';

part 'quantity_field_model.freezed.dart';
part 'quantity_field_model.g.dart';

@freezed
abstract class QuantityFieldModel with _$QuantityFieldModel {
  const QuantityFieldModel._();

  const factory QuantityFieldModel({
    required int id,
    required String uid,
    required String name,
    required String code,
    required String fieldType,
    String? unit,
    String? validationRules,
    required int displayOrder,
    required bool isRequired,
    required bool isForSegment,
    String? defaultValue,
    String? placeholder,
    String? helpText,
    @Default([]) List<DropdownOptionModel> dropdownOptions,
  }) = _QuantityFieldModel;

  factory QuantityFieldModel.fromJson(Map<String, dynamic> json) =>
      _$QuantityFieldModelFromJson(json);

  QuantityField toEntity() {
    return QuantityField(
      id: id,
      uid: uid,
      name: name,
      code: code,
      fieldType: fieldType,
      unit: unit,
      validationRules: validationRules,
      displayOrder: displayOrder,
      isRequired: isRequired,
      isForSegment: isForSegment,
      defaultValue: defaultValue,
      placeholder: placeholder,
      helpText: helpText,
      dropdownOptions: dropdownOptions.map((e) => e.toEntity()).toList(),
    );
  }

  factory QuantityFieldModel.fromEntity(QuantityField entity) {
    return QuantityFieldModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      code: entity.code,
      fieldType: entity.fieldType,
      unit: entity.unit,
      validationRules: entity.validationRules,
      displayOrder: entity.displayOrder,
      isRequired: entity.isRequired,
      isForSegment: entity.isForSegment,
      defaultValue: entity.defaultValue,
      placeholder: entity.placeholder,
      helpText: entity.helpText,
      dropdownOptions: entity.dropdownOptions
          .map((e) => DropdownOptionModel.fromEntity(e))
          .toList(),
    );
  }
}
