import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'road_category_entity.g.dart';

@JsonSerializable()
class RoadCategoryEntity extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  const RoadCategoryEntity({
    this.id,
    this.uid,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory RoadCategoryEntity.fromJson(Map<String, dynamic> json) =>
      _$RoadCategoryEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RoadCategoryEntityToJson(this);

  @override
  List<Object?> get props => [id, uid, name, createdAt, updatedAt];
}
