import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/program_view/state_nested_entity.dart';
import 'country_nested_model.dart';

part 'state_nested_model.freezed.dart';
part 'state_nested_model.g.dart';

@freezed
abstract class StateNestedModel with _$StateNestedModel {
  const factory StateNestedModel({
    int? id,
    String? uid,
    String? name,
    String? code,
    int? countryID,
    String? createdAt,
    String? updatedAt,
    CountryNestedModel? country,
  }) = _StateNestedModel;

  factory StateNestedModel.fromJson(Map<String, dynamic> json) =>
      _$StateNestedModelFromJson(json);
}

extension StateNestedModelX on StateNestedModel {
  StateNested toEntity() {
    return StateNested(
      id: id,
      uid: uid,
      name: name,
      code: code,
      countryID: countryID,
      createdAt: createdAt,
      updatedAt: updatedAt,
      country: country?.toEntity(),
    );
  }

  static StateNestedModel fromEntity(StateNested entity) {
    return StateNestedModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      code: entity.code,
      countryID: entity.countryID,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      country: entity.country != null
          ? CountryNestedModelX.fromEntity(entity.country!)
          : null,
    );
  }
}
