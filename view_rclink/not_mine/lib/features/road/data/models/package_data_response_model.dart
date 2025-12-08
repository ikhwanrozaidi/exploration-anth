import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/road/domain/entities/package_data_response_entity.dart';
import 'country_model.dart';
import 'district_model.dart';
import 'package_model.dart';
import 'package_road_model.dart';
import 'province_model.dart';
import 'road_model.dart';

part 'package_data_response_model.freezed.dart';
part 'package_data_response_model.g.dart';

@freezed
abstract class PackageDataResponseModel with _$PackageDataResponseModel {
  const PackageDataResponseModel._();

  const factory PackageDataResponseModel({
    PackageModel? package,
    List<CountryModel>? countries,
    List<ProvinceModel>? states,
    List<DistrictModel>? districts,
    List<RoadModel>? roads,
    List<PackageRoadModel>? packageRoads,
  }) = _PackageDataResponseModel;

  factory PackageDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PackageDataResponseModelFromJson(json);

  /// Convert model -> entity
  PackageDataResponse toEntity() {
    return PackageDataResponse(
      package: package?.toEntity(),
      countries: countries?.map((c) => c.toEntity()).toList(),
      states: states?.map((s) => s.toEntity()).toList(),
      districts: districts?.map((d) => d.toEntity()).toList(),
      roads: roads?.map((r) => r.toEntity()).toList(),
      packageRoads: packageRoads?.map((pr) => pr.toEntity()).toList(),
    );
  }

  /// Convert entity -> model
  factory PackageDataResponseModel.fromEntity(PackageDataResponse entity) {
    return PackageDataResponseModel(
      package: entity.package != null
          ? PackageModel.fromEntity(entity.package!)
          : null,
      countries: entity.countries
          ?.map((c) => CountryModel.fromEntity(c))
          .toList(),
      states: entity.states?.map((s) => ProvinceModel.fromEntity(s)).toList(),
      districts: entity.districts
          ?.map((d) => DistrictModel.fromEntity(d))
          .toList(),
      roads: entity.roads?.map((r) => RoadModel.fromEntity(r)).toList(),
      packageRoads: entity.packageRoads
          ?.map((pr) => PackageRoadModel.fromEntity(pr))
          .toList(),
    );
  }
}
