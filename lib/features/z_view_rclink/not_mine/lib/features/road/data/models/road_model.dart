import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/road/domain/entities/road_entity.dart';
import 'district_model.dart';
import 'road_category_model.dart';

part 'road_model.freezed.dart';
part 'road_model.g.dart';

@freezed
abstract class RoadModel with _$RoadModel {
  const RoadModel._();

  const factory RoadModel({
    int? id,
    String? uid,
    String? name,
    String? roadNo,
    double? sectionStart,
    double? sectionFinish,
    int? mainCategoryID,
    int? secondaryCategoryID,
    int? districtID,
    String? createdAt,
    String? updatedAt,
    DistrictModel? district,
    RoadCategoryModel? mainCategory,
    RoadCategoryModel? secondaryCategory,
  }) = _RoadModel;

  factory RoadModel.fromJson(Map<String, dynamic> json) =>
      _$RoadModelFromJson(json);

  /// Convert model -> entity
  Road toEntity() {
    return Road(
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
      mainCategory: mainCategory?.toEntity(),
      secondaryCategory: secondaryCategory?.toEntity(),
    );
  }

  /// Convert entity -> model
  factory RoadModel.fromEntity(Road entity) {
    return RoadModel(
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
          ? DistrictModel.fromEntity(entity.district!)
          : null,
      mainCategory: entity.mainCategory != null
          ? RoadCategoryModel.fromEntity(entity.mainCategory!)
          : null,
      secondaryCategory: entity.secondaryCategory != null
          ? RoadCategoryModel.fromEntity(entity.secondaryCategory!)
          : null,
    );
  }
}
