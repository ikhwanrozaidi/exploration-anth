import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_entity.g.dart';

@JsonSerializable()
class Countryr extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  const Countryr({
    this.id,
    this.uid,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory Countryr.fromJson(Map<String, dynamic> json) =>
      _$CountryrFromJson(json);

  Map<String, dynamic> toJson() => _$CountryrToJson(this);

  @override
  List<Object?> get props => [id, uid, name, createdAt, updatedAt];
}
