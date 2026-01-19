import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/program_view/road_nested_entity.dart';
import 'district_nested_model.dart';

part 'road_nested_model.freezed.dart';
part 'road_nested_model.g.dart';

@freezed
abstract class RoadNestedModel with _$RoadNestedModel {
  const factory RoadNestedModel({
    int? id,
    String? uid,
    String? name,
    String? roadNo,
    String? sectionStart,
    String? sectionFinish,
    int? mainCategoryID,
    int? secondaryCategoryID,
    int? districtID,
    String? createdAt,
    String? updatedAt,
    DistrictNestedModel? district,
  }) = _RoadNestedModel;

  factory RoadNestedModel.fromJson(Map<String, dynamic> json) =>
      _$RoadNestedModelFromJson(json);
}

extension RoadNestedModelX on RoadNestedModel {
  RoadNested toEntity() {
    return RoadNested(
      id: id,
      uid: uid,
      name: name,
      roadNo: roadNo,
      sectionStart: sectionStart,
      sectionFinish: sectionFinish,
      mainCategoryID: mainCategoryID,
      secondaryCategoryID: secondaryCategoryID,
      districtID: districtID,
      createdAt: createdAt,
      updatedAt: updatedAt,
      district: district?.toEntity(),
    );
  }

  static RoadNestedModel fromEntity(RoadNested entity) {
    return RoadNestedModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      roadNo: entity.roadNo,
      sectionStart: entity.sectionStart,
      sectionFinish: entity.sectionFinish,
      mainCategoryID: entity.mainCategoryID,
      secondaryCategoryID: entity.secondaryCategoryID,
      districtID: entity.districtID,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      district: entity.district != null
          ? DistrictNestedModelX.fromEntity(entity.district!)
          : null,
    );
  }
}
