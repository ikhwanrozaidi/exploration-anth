import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/created_by_nested_entity.dart';

part 'created_by_nested_model.freezed.dart';
part 'created_by_nested_model.g.dart';

@freezed
abstract class CreatedByNestedModel with _$CreatedByNestedModel {
  const factory CreatedByNestedModel({
    int? id,
    String? uid,
    String? firstName,
    String? lastName,
    String? phone,
    String? email,
  }) = _CreatedByNestedModel;

  factory CreatedByNestedModel.fromJson(Map<String, dynamic> json) =>
      _$CreatedByNestedModelFromJson(json);
}

extension CreatedByNestedModelX on CreatedByNestedModel {
  CreatedByNested toEntity() {
    return CreatedByNested(
      id: id,
      uid: uid,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: email,
    );
  }

  static CreatedByNestedModel fromEntity(CreatedByNested entity) {
    return CreatedByNestedModel(
      id: entity.id,
      uid: entity.uid,
      firstName: entity.firstName,
      lastName: entity.lastName,
      phone: entity.phone,
      email: entity.email,
    );
  }
}
