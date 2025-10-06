import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/road.dart';
import 'district_model.dart';

part 'road_model.freezed.dart';
part 'road_model.g.dart';

@freezed
abstract class RoadModel with _$RoadModel {
  const RoadModel._();

  const factory RoadModel({
    required String name,
    required String roadNo,
    required String uid,
    DistrictModel? district,
  }) = _RoadModel;

  factory RoadModel.fromJson(Map<String, dynamic> json) =>
      _$RoadModelFromJson(json);

  Road toEntity() {
    return Road(
      name: name,
      roadNo: roadNo,
      uid: uid,
      districtName: district?.name,
      stateName: district?.state?.name,
      countryName: district?.state?.country?.name,
    );
  }
}
