import 'package:freezed_annotation/freezed_annotation.dart';

part 'road_category_model.freezed.dart';
part 'road_category_model.g.dart';

@freezed
abstract class RoadCategoryModel with _$RoadCategoryModel {
  factory RoadCategoryModel({
    int? id,
    String? uid,
    String? name,
    String? createdAt,
    String? updatedAt,
  }) = _RoadCategoryModel;

  factory RoadCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$RoadCategoryModelFromJson(json);
}
