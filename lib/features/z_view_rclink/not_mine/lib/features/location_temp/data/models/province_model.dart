import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/province_entity.dart';

part 'province_model.freezed.dart';
part 'province_model.g.dart';

@freezed
abstract class ProvinceModel with _$ProvinceModel {
  const ProvinceModel._();

  const factory ProvinceModel({
    int? id,
    String? uid,
    String? name,
    @JsonKey(name: 'countryID') int? countryId,
    String? createdAt,
    String? updatedAt,
  }) = _ProvinceModel;

  factory ProvinceModel.fromJson(Map<String, dynamic> json) =>
      _$ProvinceModelFromJson(json);

  Province toEntity() {
    return Province(
      id: id,
      uid: uid,
      name: name,
      countryId: countryId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory ProvinceModel.fromEntity(Province entity) {
    return ProvinceModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      countryId: entity.countryId,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
