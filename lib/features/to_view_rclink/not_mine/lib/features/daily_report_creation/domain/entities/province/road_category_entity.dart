import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'road_category_entity.g.dart';

@JsonSerializable()
class RoadCategory extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? createdAt;
  final String? updatedAt;

  const RoadCategory({
    this.id,
    this.uid,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory RoadCategory.fromJson(Map<String, dynamic> json) =>
      _$RoadCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$RoadCategoryToJson(this);

  @override
  List<Object?> get props => [id, uid, name, createdAt, updatedAt];
}
