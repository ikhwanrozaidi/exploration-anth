import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../daily_report_creation/data/models/province/road_model.dart'
    as creation;
import '../../domain/entities/road_edit_entity.dart';

part 'road_edit_model.freezed.dart';
part 'road_edit_model.g.dart';

@freezed
abstract class RoadEditModel with _$RoadEditModel {
  const RoadEditModel._();

  const factory RoadEditModel({
    int? id,
    String? uid,
    String? name,
    String? roadNo,
    String? sectionStart,
    String? sectionFinish,
    int? districtId,
    String? districtName,
  }) = _RoadEditModel;

  factory RoadEditModel.fromJson(Map<String, dynamic> json) =>
      _$RoadEditModelFromJson(json);

  // Convert from daily_report_creation RoadModel to this model
  factory RoadEditModel.fromCreationRoadModel(creation.RoadModel roadModel) {
    return RoadEditModel(
      id: roadModel.id,
      uid: roadModel.uid,
      name: roadModel.name,
      roadNo: roadModel.roadNo,
      sectionStart: roadModel.sectionStart,
      sectionFinish: roadModel.sectionFinish,
      districtId: roadModel.districtId,
      districtName: roadModel.district?.name,
    );
  }

  RoadEdit toEntity() {
    return RoadEdit(
      id: id,
      uid: uid,
      name: name,
      roadNo: roadNo,
      sectionStart: sectionStart,
      sectionFinish: sectionFinish,
      districtId: districtId,
      districtName: districtName,
    );
  }

  factory RoadEditModel.fromEntity(RoadEdit entity) {
    return RoadEditModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      roadNo: entity.roadNo,
      sectionStart: entity.sectionStart,
      sectionFinish: entity.sectionFinish,
      districtId: entity.districtId,
      districtName: entity.districtName,
    );
  }
}
