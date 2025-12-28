import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/road/domain/entities/country_entity.dart';

part 'country_model.freezed.dart';
part 'country_model.g.dart';

@freezed
abstract class CountryModel with _$CountryModel {
  const CountryModel._();

  const factory CountryModel({
    int? id,
    String? uid,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) = _CountryModel;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);

  /// Convert model -> entity
  Country toEntity() {
    return Country(
      id: id,
      uid: uid,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  /// Convert entity -> model
  factory CountryModel.fromEntity(Country entity) {
    return CountryModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
