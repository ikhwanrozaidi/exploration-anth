import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'quantityfield_response_entity.g.dart';

@JsonSerializable()
class QuantityFieldResponse extends Equatable {
  final String? name;
  final String? fieldType;
  final String? unit;
  final String? validationRules;
  final int? displayOrder;
  final bool? isRequired;
  final bool? isForSegment;
  final String? defaultValue;
  final String? uid;
  final List<String>? dropdownOptions;

  const QuantityFieldResponse({
    this.name,
    this.fieldType,
    this.unit,
    this.validationRules,
    this.displayOrder,
    this.isRequired,
    this.isForSegment,
    this.defaultValue,
    this.uid,
    this.dropdownOptions,
  });

  factory QuantityFieldResponse.fromJson(Map<String, dynamic> json) =>
      _$QuantityFieldResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuantityFieldResponseToJson(this);

  QuantityFieldResponse copyWith({
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
  }) {
    return QuantityFieldResponse(
      name: name ?? this.name,
      fieldType: fieldType ?? this.fieldType,
      unit: unit ?? this.unit,
      validationRules: validationRules ?? this.validationRules,
      displayOrder: displayOrder ?? this.displayOrder,
      isRequired: isRequired ?? this.isRequired,
      isForSegment: isForSegment ?? this.isForSegment,
      defaultValue: defaultValue ?? this.defaultValue,
      uid: uid ?? this.uid,
      dropdownOptions: dropdownOptions ?? this.dropdownOptions,
    );
  }

  @override
  List<Object?> get props => [
    name,
    fieldType,
    unit,
    validationRules,
    displayOrder,
    isRequired,
    isForSegment,
    defaultValue,
    uid,
    dropdownOptions,
  ];
}
