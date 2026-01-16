import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dropdown_option_nested_entity.g.dart';

@JsonSerializable()
class DropdownOptionNested extends Equatable {
  final int? id;
  final String? uid;
  final int? fieldID;
  final String? value;
  final int? displayOrder;
  final bool? isActive;
  final String? createdAt;
  final String? updatedAt;

  const DropdownOptionNested({
    this.id,
    this.uid,
    this.fieldID,
    this.value,
    this.displayOrder,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory DropdownOptionNested.fromJson(Map<String, dynamic> json) =>
      _$DropdownOptionNestedFromJson(json);

  Map<String, dynamic> toJson() => _$DropdownOptionNestedToJson(this);

  DropdownOptionNested copyWith({
    int? id,
    String? uid,
    int? fieldID,
    String? value,
    int? displayOrder,
    bool? isActive,
    String? createdAt,
    String? updatedAt,
  }) {
    return DropdownOptionNested(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      fieldID: fieldID ?? this.fieldID,
      value: value ?? this.value,
      displayOrder: displayOrder ?? this.displayOrder,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id,
    uid,
    fieldID,
    value,
    displayOrder,
    isActive,
    createdAt,
    updatedAt,
  ];
}
