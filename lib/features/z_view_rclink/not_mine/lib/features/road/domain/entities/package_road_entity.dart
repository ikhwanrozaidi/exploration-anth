import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'package_road_entity.g.dart';

@JsonSerializable()
class PackageRoad extends Equatable {
  final String? uid;
  final String? roadUID;
  final double? sectionStart;
  final double? sectionFinish;

  const PackageRoad({
    this.uid,
    this.roadUID,
    this.sectionStart,
    this.sectionFinish,
  });

  factory PackageRoad.fromJson(Map<String, dynamic> json) =>
      _$PackageRoadFromJson(json);

  Map<String, dynamic> toJson() => _$PackageRoadToJson(this);

  PackageRoad copyWith({
    String? uid,
    String? roadUID,
    double? sectionStart,
    double? sectionFinish,
  }) {
    return PackageRoad(
      uid: uid ?? this.uid,
      roadUID: roadUID ?? this.roadUID,
      sectionStart: sectionStart ?? this.sectionStart,
      sectionFinish: sectionFinish ?? this.sectionFinish,
    );
  }

  @override
  List<Object?> get props => [uid, roadUID, sectionStart, sectionFinish];
}
