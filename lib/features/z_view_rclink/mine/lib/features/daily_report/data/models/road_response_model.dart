import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/road_response.dart';
import 'district_response_model.dart';

part 'road_response_model.freezed.dart';
part 'road_response_model.g.dart';

@freezed
abstract class RoadResponseModel with _$RoadResponseModel {
  const RoadResponseModel._();

  const factory RoadResponseModel({
    required String uid,
    required String name,
    String? roadNo,
    DistrictResponseModel? district,
  }) = _RoadResponseModel;

  factory RoadResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RoadResponseModelFromJson(json);

  RoadResponse toEntity() {
    return RoadResponse(
      uid: uid,
      name: name,
      roadNo: roadNo,
      districtName: district?.name,
      stateName: district?.state?.name,
      countryName: district?.state?.country?.name,
    );
  }
}
