import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'road_edit_entity.g.dart';

@JsonSerializable()
class RoadEdit extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final String? roadNo;
  final String? sectionStart;
  final String? sectionFinish;
  final int? districtId;
  final String? districtName;

  const RoadEdit({
    this.id,
    this.uid,
    this.name,
    this.roadNo,
    this.sectionStart,
    this.sectionFinish,
    this.districtId,
    this.districtName,
  });

  factory RoadEdit.fromJson(Map<String, dynamic> json) =>
      _$RoadEditFromJson(json);

  Map<String, dynamic> toJson() => _$RoadEditToJson(this);

  RoadEdit copyWith({
    int? id,
    String? uid,
    String? name,
    String? roadNo,
    String? sectionStart,
    String? sectionFinish,
    int? districtId,
    String? districtName,
  }) {
    return RoadEdit(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      roadNo: roadNo ?? this.roadNo,
      sectionStart: sectionStart ?? this.sectionStart,
      sectionFinish: sectionFinish ?? this.sectionFinish,
      districtId: districtId ?? this.districtId,
      districtName: districtName ?? this.districtName,
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
    districtId,
    districtName,
  ];
}
