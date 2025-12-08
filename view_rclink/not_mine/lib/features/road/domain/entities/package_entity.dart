import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package_entity.g.dart';

@JsonSerializable()
class Package extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? description;
  final String? createdAt;
  final String? updatedAt;

  const Package({
    this.id,
    this.uid,
    this.name,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);

  Map<String, dynamic> toJson() => _$PackageToJson(this);

  Package copyWith({
    int? id,
    String? uid,
    String? name,
    String? description,
    String? createdAt,
    String? updatedAt,
  }) {
    return Package(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [id, uid, name, description, createdAt, updatedAt];
}
