import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'country_nested_entity.dart';

part 'state_nested_entity.g.dart';

@JsonSerializable()
class StateNested extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? code;
  final int? countryID;
  final String? createdAt;
  final String? updatedAt;
  final CountryNested? country;

  const StateNested({
    this.id,
    this.uid,
    this.name,
    this.code,
    this.countryID,
    this.createdAt,
    this.updatedAt,
    this.country,
  });

  factory StateNested.fromJson(Map<String, dynamic> json) =>
      _$StateNestedFromJson(json);

  Map<String, dynamic> toJson() => _$StateNestedToJson(this);

  StateNested copyWith({
    int? id,
    String? uid,
    String? name,
    String? code,
    int? countryID,
    String? createdAt,
    String? updatedAt,
    CountryNested? country,
  }) {
    return StateNested(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      code: code ?? this.code,
      countryID: countryID ?? this.countryID,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      country: country ?? this.country,
    );
  }

  @override
  List<Object?> get props => [
    id,
    uid,
    name,
    code,
    countryID,
    createdAt,
    updatedAt,
    country,
  ];
}
