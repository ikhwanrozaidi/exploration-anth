import 'package:freezed_annotation/freezed_annotation.dart';

import 'country_model.dart';

part 'province_model.freezed.dart';
part 'province_model.g.dart';

@freezed
abstract class ProvinceModel with _$ProvinceModel {
  factory ProvinceModel({
    int? id,
    String? uid,
    String? name,
    @JsonKey(name: 'countryID') int? countryId,
    String? createdAt,
    String? updatedAt,
    CountryModel? country,
  }) = _ProvinceModel;

  factory ProvinceModel.fromJson(Map<String, dynamic> json) =>
      _$ProvinceModelFromJson(json);
}
