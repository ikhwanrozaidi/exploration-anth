import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/daily_report/domain/entities/response/road_response_entity.dart';

import 'district_response_model.dart';

part 'road_response_model.freezed.dart';
part 'road_response_model.g.dart';

@freezed
abstract class RoadResponseModel with _$RoadResponseModel {
  const RoadResponseModel._();

  const factory RoadResponseModel({
    String? name,
    String? roadNo,
    String? uid,
    DistrictResponseModel? district,
  }) = _RoadResponseModel;

  factory RoadResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RoadResponseModelFromJson(json);

  RoadResponse toEntity() {
    return RoadResponse(
      name: name,
      roadNo: roadNo,
      uid: uid,
      district: district?.toEntity(),
    );
  }

  factory RoadResponseModel.fromEntity(RoadResponse entity) {
    return RoadResponseModel(
      name: entity.name,
      roadNo: entity.roadNo,
      uid: entity.uid,
      district: entity.district != null
          ? DistrictResponseModel.fromEntity(entity.district!)
          : null,
    );
  }
}
