import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'dropdown_option.g.dart';

@JsonSerializable()
class DropdownOption extends Equatable {
  final int id;
  final String uid;
  final String value;
  final int displayOrder;

  const DropdownOption({
    required this.id,
    required this.uid,
    required this.value,
    required this.displayOrder,
  });

  @override
  List<Object?> get props => [id, uid, value, displayOrder];

  factory DropdownOption.fromJson(Map<String, dynamic> json) =>
      _$DropdownOptionFromJson(json);
  Map<String, dynamic> toJson() => _$DropdownOptionToJson(this);
}
