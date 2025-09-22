import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'country_entity.dart';

part 'province_entity.g.dart';

@JsonSerializable()
class ProvinceEntity extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final int? countryId;
  final String? createdAt;
  final String? updatedAt;
  final CountryEntity? country;

  const ProvinceEntity({
    this.id,
    this.uid,
    this.name,
    this.countryId,
    this.createdAt,
    this.updatedAt,
    this.country,
  });

  factory ProvinceEntity.fromJson(Map<String, dynamic> json) =>
      _$ProvinceEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceEntityToJson(this);

  @override
  List<Object?> get props => [
    id,
    uid,
    name,
    countryId,
    createdAt,
    updatedAt,
    country,
  ];
}
