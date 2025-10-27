import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/country_entity.dart';
import '../../domain/entities/province_entity.dart';
import '../../domain/entities/district_entity.dart';
import '../../domain/entities/road_entity.dart';

part 'location_state.freezed.dart';

@freezed
class LocationState with _$LocationState {
  const factory LocationState.initial() = LocationInitial;

  const factory LocationState.loading() = LocationLoading;

  const factory LocationState.loaded({
    // @Default([]) List<CountryLocation> countries,
    @Default([]) List<Province> provinces,
    @Default([]) List<District> districts,
    @Default([]) List<Road> roads,

    // CountryLocation? selectedCountry,
    Province? selectedProvince,
    District? selectedDistrict,
    Road? selectedRoad,
  }) = LocationLoaded;

  const factory LocationState.error(String message) = LocationError;
}
