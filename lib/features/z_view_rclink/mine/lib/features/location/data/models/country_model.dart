import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/country_entity.dart';

part 'country_model.freezed.dart';
part 'country_model.g.dart';

@freezed
abstract class CountryLocationModel with _$CountryLocationModel {
  const CountryLocationModel._();

  const factory CountryLocationModel({
    int? id,
    String? uid,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) = _CountryLocationModel;

  factory CountryLocationModel.fromJson(Map<String, dynamic> json) =>
      _$CountryLocationModelFromJson(json);

  CountryLocation toEntity() {
    return CountryLocation(
      id: id,
      uid: uid,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory CountryLocationModel.fromEntity(CountryLocation entity) {
    return CountryLocationModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
