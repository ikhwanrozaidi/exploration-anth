import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/daily_report/domain/entities/response/quantityfield_response_entity.dart';

part 'quantityfield_response_model.freezed.dart';
part 'quantityfield_response_model.g.dart';

@freezed
abstract class QuantityFieldResponseModel with _$QuantityFieldResponseModel {
  const QuantityFieldResponseModel._();

  const factory QuantityFieldResponseModel({
    String? name,
    String? fieldType,
    String? unit,
    String? validationRules,
    int? displayOrder,
    bool? isRequired,
    bool? isForSegment,
    String? defaultValue,
    String? uid,
    List<String>? dropdownOptions,
  }) = _QuantityFieldResponseModel;

  factory QuantityFieldResponseModel.fromJson(Map<String, dynamic> json) =>
      _$QuantityFieldResponseModelFromJson(json);

  QuantityFieldResponse toEntity() {
    return QuantityFieldResponse(
      name: name,
      fieldType: fieldType,
      unit: unit,
      validationRules: validationRules,
      displayOrder: displayOrder,
      isRequired: isRequired,
      isForSegment: isForSegment,
      defaultValue: defaultValue,
      uid: uid,
      dropdownOptions: dropdownOptions,
    );
  }

  factory QuantityFieldResponseModel.fromEntity(QuantityFieldResponse entity) {
    return QuantityFieldResponseModel(
      name: entity.name,
      fieldType: entity.fieldType,
      unit: entity.unit,
      validationRules: entity.validationRules,
      displayOrder: entity.displayOrder,
      isRequired: entity.isRequired,
      isForSegment: entity.isForSegment,
      defaultValue: entity.defaultValue,
      uid: entity.uid,
      dropdownOptions: entity.dropdownOptions,
    );
  }
}
