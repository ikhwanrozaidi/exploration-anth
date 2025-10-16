import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/road_entity.dart';
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

  Road toEntity() {
    return Road(
      id: id,
      uid: uid,
      name: name,
      roadNo: roadNo,
      sectionStart: sectionStart,
      sectionFinish: sectionFinish,
      mainCategoryId: mainCategoryId,
      secondaryCategoryId: secondaryCategoryId,
      districtId: districtId,
      createdAt: createdAt,
      updatedAt: updatedAt,
      district: district?.toEntity(),
      mainCategory: mainCategory?.toEntity(),
      secondaryCategory: secondaryCategory?.toEntity(),
    );
  }

  factory RoadModel.fromEntity(Road entity) {
    return RoadModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      roadNo: entity.roadNo,
      sectionStart: entity.sectionStart,
      sectionFinish: entity.sectionFinish,
      mainCategoryId: entity.mainCategoryId,
      secondaryCategoryId: entity.secondaryCategoryId,
      districtId: entity.districtId,
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
