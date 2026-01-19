import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'district_nested_entity.dart';

part 'road_nested_entity.g.dart';

@JsonSerializable()
class RoadNested extends Equatable {
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
  final DistrictNested? district;

  const RoadNested({
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
  });

  factory RoadNested.fromJson(Map<String, dynamic> json) =>
      _$RoadNestedFromJson(json);

  Map<String, dynamic> toJson() => _$RoadNestedToJson(this);

  RoadNested copyWith({
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
    DistrictNested? district,
  }) {
    return RoadNested(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      roadNo: roadNo ?? this.roadNo,
      sectionStart: sectionStart ?? this.sectionStart,
      sectionFinish: sectionFinish ?? this.sectionFinish,
      mainCategoryID: mainCategoryID ?? this.mainCategoryID,
      secondaryCategoryID: secondaryCategoryID ?? this.secondaryCategoryID,
      districtID: districtID ?? this.districtID,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      district: district ?? this.district,
    );
  }

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
  ];
}
