import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_event.freezed.dart';

@freezed
class LocationEvent with _$LocationEvent {
  // const factory LocationEvent.loadCountries({
  //   @Default(false) bool forceRefresh,
  // }) = LoadCountries;

  const factory LocationEvent.loadProvinces({
    String? countryUid,
    @Default(false) bool forceRefresh,
  }) = LoadProvinces;

  const factory LocationEvent.loadDistricts({
    String? provinceUid,
    @Default(false) bool forceRefresh,
  }) = LoadDistricts;

  const factory LocationEvent.loadRoads({
    String? districtUid,
    @Default(false) bool forceRefresh,
  }) = LoadRoads;

  // const factory LocationEvent.selectCountry(String uid) = SelectCountry;
  const factory LocationEvent.selectProvince(String uid) = SelectProvince;
  const factory LocationEvent.selectDistrict(String uid) = SelectDistrict;
  const factory LocationEvent.selectRoad(String uid) = SelectRoad;

  const factory LocationEvent.clearSelections() = ClearSelections;
  const factory LocationEvent.clearCache() = ClearCache;
  const factory LocationEvent.clearAllLocationCache() = ClearAllLocationCache;
}
