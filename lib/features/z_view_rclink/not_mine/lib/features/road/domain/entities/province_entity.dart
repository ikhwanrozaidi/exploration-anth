import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'country_entity.dart';

part 'province_entity.g.dart';

@JsonSerializable()
class Province extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final int? countryID;
  final String? createdAt;
  final String? updatedAt;
  final Country? country;

  const Province({
    this.id,
    this.uid,
    this.name,
    this.countryID,
    this.createdAt,
    this.updatedAt,
    this.country,
  });

  factory Province.fromJson(Map<String, dynamic> json) =>
      _$ProvinceFromJson(json);

  Map<String, dynamic> toJson() => _$ProvinceToJson(this);

  @override
  List<Object?> get props => [
    id,
    uid,
    name,
    countryID,
    createdAt,
    updatedAt,
    country,
  ];
}
