import 'package:freezed_annotation/freezed_annotation.dart';

part 'road_event.freezed.dart';

@freezed
class RoadEvent with _$RoadEvent {
  const factory RoadEvent.loadProvinces({
    String? countryUid,
    @Default(false) bool forceRefresh,
  }) = LoadRoadProvinces;

  const factory RoadEvent.loadDistricts({
    required String provinceUid,
    @Default(false) bool forceRefresh,
  }) = LoadRoadDistricts;

  const factory RoadEvent.loadRoads({
    required String districtUid,
    @Default(false) bool forceRefresh,
  }) = LoadRoadRoads;

  const factory RoadEvent.selectProvince(String uid) = SelectRoadProvince;
  const factory RoadEvent.selectDistrict(String uid) = SelectRoadDistrict;
  const factory RoadEvent.selectRoad(String uid) = SelectRoadRoad;

  const factory RoadEvent.clearSelections() = ClearRoadSelections;
  const factory RoadEvent.clearCache() = ClearRoadCache;

  const factory RoadEvent.addRoadSelection(String uid) = AddRoadSelection;
  const factory RoadEvent.removeRoadSelection(String uid) = RemoveRoadSelection;
  const factory RoadEvent.clearMultipleSelections() = ClearMultipleSelections;
}
