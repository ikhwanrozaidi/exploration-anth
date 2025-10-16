import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_entity.g.dart';

@JsonSerializable()
class CountryLocation extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  const CountryLocation({
    this.id,
    this.uid,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory CountryLocation.fromJson(Map<String, dynamic> json) =>
      _$CountryLocationFromJson(json);

  Map<String, dynamic> toJson() => _$CountryLocationToJson(this);

  @override
  List<Object?> get props => [id, uid, name, createdAt, updatedAt];
}
