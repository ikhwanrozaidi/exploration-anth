import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_field_model.freezed.dart';
part 'api_field_model.g.dart';

@freezed
abstract class ApiFieldModel with _$ApiFieldModel {
  const factory ApiFieldModel({
    required int id,
    required String uid,
    required int quantityTypeID,
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
    List<ApiDropdownOption>? dropdownOptions,
  }) = _ApiFieldModel;

  factory ApiFieldModel.fromJson(Map<String, dynamic> json) =>
      _$ApiFieldModelFromJson(json);
}

@freezed
abstract class ApiDropdownOption with _$ApiDropdownOption {
  const factory ApiDropdownOption({
    required int id,
    required String uid,
    required int fieldID,
    required String value,
    required int displayOrder,
    required bool isActive,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _ApiDropdownOption;

  factory ApiDropdownOption.fromJson(Map<String, dynamic> json) =>
      _$ApiDropdownOptionFromJson(json);
}
