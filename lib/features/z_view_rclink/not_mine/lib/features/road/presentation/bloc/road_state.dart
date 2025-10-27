import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/district_entity.dart';
import '../../domain/entities/province_entity.dart';
import '../../domain/entities/road_entity.dart';

part 'road_state.freezed.dart';

@freezed
class RoadState with _$RoadState {
  const factory RoadState.initial() = RoadInitial;

  const factory RoadState.loading() = RoadLoading;

  const factory RoadState.loaded({
    @Default([]) List<Province> provinces,
    @Default([]) List<District> districts,
    @Default([]) List<Road> roads,
    Province? selectedProvince,
    District? selectedDistrict,
    Road? selectedRoad,
  }) = RoadLoaded;

  const factory RoadState.error(String message) = RoadError;
}
