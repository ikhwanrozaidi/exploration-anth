import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/country_entity.dart';
import '../../domain/entities/district_entity.dart';
import '../../domain/entities/province_entity.dart';
import '../../domain/entities/road_entity.dart';

part 'road_state.freezed.dart';

@freezed
class RoadState with _$RoadState {
  const factory RoadState.initial() = RoadInitial;
  const factory RoadState.loading() = RoadLoading;
  const factory RoadState.loaded({
    // ALL data (for reference and filtering)
    @Default([]) List<Country> allCountries,
    @Default([]) List<Province> allProvinces,
    @Default([]) List<District> allDistricts,
    @Default([]) List<Road> allRoads,

    // FILTERED data (for current display)
    @Default([]) List<Province> provinces,
    @Default([]) List<District> districts,
    @Default([]) List<Road> roads,

    // Selected items
    Province? selectedProvince,
    District? selectedDistrict,
    Road? selectedRoad,
  }) = RoadLoaded;
  const factory RoadState.error(String message) = RoadError;
}
