import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_entity.g.dart';

@JsonSerializable()
class CountryEntity extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  const CountryEntity({
    this.id,
    this.uid,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory CountryEntity.fromJson(Map<String, dynamic> json) =>
      _$CountryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$CountryEntityToJson(this);

  @override
  List<Object?> get props => [id, uid, name, createdAt, updatedAt];
}
