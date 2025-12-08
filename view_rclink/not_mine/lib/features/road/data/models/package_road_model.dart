import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/road/domain/entities/package_road_entity.dart';

part 'package_road_model.freezed.dart';
part 'package_road_model.g.dart';

@freezed
abstract class PackageRoadModel with _$PackageRoadModel {
  const PackageRoadModel._();

  const factory PackageRoadModel({
    String? uid,
    String? roadUID,
    double? sectionStart,
    double? sectionFinish,
  }) = _PackageRoadModel;

  factory PackageRoadModel.fromJson(Map<String, dynamic> json) =>
      _$PackageRoadModelFromJson(json);

  /// Convert model -> entity
  PackageRoad toEntity() {
    return PackageRoad(
      uid: uid,
      roadUID: roadUID,
      sectionStart: sectionStart,
      sectionFinish: sectionFinish,
    );
  }

  /// Convert entity -> model
  factory PackageRoadModel.fromEntity(PackageRoad entity) {
    return PackageRoadModel(
      uid: entity.uid,
      roadUID: entity.roadUID,
      sectionStart: entity.sectionStart,
      sectionFinish: entity.sectionFinish,
    );
  }
}
