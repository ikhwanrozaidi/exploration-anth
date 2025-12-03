import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package.g.dart';

@JsonSerializable()
class Package extends Equatable {
  final int id;
  final String uid;
  final String name;
  final String? description;
  final DateTime createdAt;
  final DateTime updatedAt;

  const Package({
    required this.id,
    required this.uid,
    required this.name,
    this.description,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [id, uid, name, description, createdAt, updatedAt];

  factory Package.fromJson(Map<String, dynamic> json) =>
      _$PackageFromJson(json);
  Map<String, dynamic> toJson() => _$PackageToJson(this);
}
