import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'district_entity.dart';
import 'road_category_entity.dart';

part 'road_entity.g.dart';

@JsonSerializable()
class Road extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? roadNo;
  final String? sectionStart;
  final String? sectionFinish;
  final int? mainCategoryID;
  final int? secondaryCategoryID;
  final int? districtID;
  final String? createdAt;
  final String? updatedAt;
  final District? district;
  final RoadCategory? mainCategory;
  final RoadCategory? secondaryCategory;

  const Road({
    this.id,
    this.uid,
    this.name,
    this.roadNo,
    this.sectionStart,
    this.sectionFinish,
    this.mainCategoryID,
    this.secondaryCategoryID,
    this.districtID,
    this.createdAt,
    this.updatedAt,
    this.district,
    this.mainCategory,
    this.secondaryCategory,
  });

  factory Road.fromJson(Map<String, dynamic> json) => _$RoadFromJson(json);

  Map<String, dynamic> toJson() => _$RoadToJson(this);

  @override
  List<Object?> get props => [
    id,
    uid,
    name,
    roadNo,
    sectionStart,
    sectionFinish,
    mainCategoryID,
    secondaryCategoryID,
    districtID,
    createdAt,
    updatedAt,
    district,
    mainCategory,
    secondaryCategory,
  ];
}
