import 'package:freezed_annotation/freezed_annotation.dart';

import 'district_model.dart';
import 'road_category_model.dart';

part 'road_model.freezed.dart';
part 'road_model.g.dart';

@freezed
abstract class RoadModel with _$RoadModel {
  factory RoadModel({
    int? id,
    String? uid,
    String? name,
    String? roadNo,
    String? sectionStart,
    String? sectionFinish,
    @JsonKey(name: 'mainCategoryID') int? mainCategoryId,
    @JsonKey(name: 'secondaryCategoryID') int? secondaryCategoryId,
    @JsonKey(name: 'districtID') int? districtId,
    String? createdAt,
    String? updatedAt,
    DistrictModel? district,
    RoadCategoryModel? mainCategory,
    RoadCategoryModel? secondaryCategory,
  }) = _RoadModel;

  factory RoadModel.fromJson(Map<String, dynamic> json) =>
      _$RoadModelFromJson(json);
}
