import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/scope_of_work/dropdown_option.dart';

part 'dropdown_option_model.freezed.dart';
part 'dropdown_option_model.g.dart';

@freezed
abstract class DropdownOptionModel with _$DropdownOptionModel {
  const DropdownOptionModel._();

  const factory DropdownOptionModel({
    required int id,
    required String uid,
    required String value,
    required int displayOrder,
  }) = _DropdownOptionModel;

  factory DropdownOptionModel.fromJson(Map<String, dynamic> json) =>
      _$DropdownOptionModelFromJson(json);

  DropdownOption toEntity() {
    return DropdownOption(
      id: id,
      uid: uid,
      value: value,
      displayOrder: displayOrder,
    );
  }

  factory DropdownOptionModel.fromEntity(DropdownOption entity) {
    return DropdownOptionModel(
      id: entity.id,
      uid: entity.uid,
      value: entity.value,
      displayOrder: entity.displayOrder,
    );
  }
}
