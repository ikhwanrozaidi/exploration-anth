import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/road/data/models/country_model.dart';
import 'package:rclink_app/features/road/domain/entities/province_entity.dart';

part 'province_model.freezed.dart';
part 'province_model.g.dart';

@freezed
abstract class ProvinceModel with _$ProvinceModel {
  const ProvinceModel._();

  const factory ProvinceModel({
    int? id,
    String? uid,
    String? name,
    int? countryID,
    String? countryUID,
    String? createdAt,
    String? updatedAt,
    CountryModel? country,
  }) = _ProvinceModel;

  factory ProvinceModel.fromJson(Map<String, dynamic> json) =>
      _$ProvinceModelFromJson(json);

  /// Model → Entity
  Province toEntity() {
    return Province(
      id: id,
      uid: uid,
      name: name,
      countryID: countryID,
      createdAt: createdAt,
      updatedAt: updatedAt,
      country: country?.toEntity(),
    );
  }

  /// Entity → Model
  factory ProvinceModel.fromEntity(Province entity) {
    return ProvinceModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      countryID: entity.countryID,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      country: entity.country != null
          ? CountryModel.fromEntity(entity.country!)
          : null,
    );
  }
}
