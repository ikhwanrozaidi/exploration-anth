import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_entity.g.dart';

@JsonSerializable()
class Country extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  const Country({this.id, this.uid, this.name, this.createdAt, this.updatedAt});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);

  @override
  List<Object?> get props => [id, uid, name, createdAt, updatedAt];
}
