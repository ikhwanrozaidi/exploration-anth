import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/program_view/country_nested_entity.dart';

part 'country_nested_model.freezed.dart';
part 'country_nested_model.g.dart';

@freezed
abstract class CountryNestedModel with _$CountryNestedModel {
  const factory CountryNestedModel({
    int? id,
    String? uid,
    String? name,
    String? code,
    String? createdAt,
    String? updatedAt,
  }) = _CountryNestedModel;

  factory CountryNestedModel.fromJson(Map<String, dynamic> json) =>
      _$CountryNestedModelFromJson(json);
}

extension CountryNestedModelX on CountryNestedModel {
  CountryNested toEntity() {
    return CountryNested(
      id: id,
      uid: uid,
      name: name,
      code: code,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  static CountryNestedModel fromEntity(CountryNested entity) {
    return CountryNestedModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      code: entity.code,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
