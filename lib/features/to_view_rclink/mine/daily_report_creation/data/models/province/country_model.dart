import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/province/country_entity.dart';

part 'country_model.freezed.dart';
part 'country_model.g.dart';

@freezed
abstract class CountryrModel with _$CountryrModel {
  const CountryrModel._();

  const factory CountryrModel({
    int? id,
    String? uid,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) = _CountryrModel;

  factory CountryrModel.fromJson(Map<String, dynamic> json) =>
      _$CountryrModelFromJson(json);

  /// Convert model -> entity
  Countryr toEntity() {
    return Countryr(
      id: id,
      uid: uid,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Convert entity -> model
  factory CountryrModel.fromEntity(Countryr entity) {
    return CountryrModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
