import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/road_category_entity.dart';

part 'road_category_model.freezed.dart';
part 'road_category_model.g.dart';

@freezed
abstract class RoadCategoryModel with _$RoadCategoryModel {
  const RoadCategoryModel._();

  const factory RoadCategoryModel({
    int? id,
    String? uid,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) = _RoadCategoryModel;

  factory RoadCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$RoadCategoryModelFromJson(json);

  RoadCategory toEntity() {
    return RoadCategory(
      id: id,
      uid: uid,
      name: name,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  factory RoadCategoryModel.fromEntity(RoadCategory entity) {
    return RoadCategoryModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
    );
  }
}
