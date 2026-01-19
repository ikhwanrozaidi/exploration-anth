import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_nested_entity.g.dart';

@JsonSerializable()
class CountryNested extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? code;
  final String? createdAt;
  final String? updatedAt;

  const CountryNested({
    this.id,
    this.uid,
    this.name,
    this.code,
    this.createdAt,
    this.updatedAt,
  });

  factory CountryNested.fromJson(Map<String, dynamic> json) =>
      _$CountryNestedFromJson(json);

  Map<String, dynamic> toJson() => _$CountryNestedToJson(this);

  CountryNested copyWith({
    int? id,
    String? uid,
    String? name,
    String? code,
    String? createdAt,
    String? updatedAt,
  }) {
    return CountryNested(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      code: code ?? this.code,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [id, uid, name, code, createdAt, updatedAt];
}
