import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'country_entity.dart';
import 'district_entity.dart';
import 'package_entity.dart';
import 'package_road_entity.dart';
import 'province_entity.dart';
import 'road_entity.dart';

part 'package_data_response_entity.g.dart';

@JsonSerializable()
class PackageDataResponse extends Equatable {
  final Package? package;
  final List<Country>? countries;
  final List<Province>? states;
  final List<District>? districts;
  final List<Road>? roads;
  final List<PackageRoad>? packageRoads;

  const PackageDataResponse({
    this.package,
    this.countries,
    this.states,
    this.districts,
    this.roads,
    this.packageRoads,
  });

  factory PackageDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PackageDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PackageDataResponseToJson(this);

  PackageDataResponse copyWith({
    Package? package,
    List<Country>? countries,
    List<Province>? states,
    List<District>? districts,
    List<Road>? roads,
    List<PackageRoad>? packageRoads,
  }) {
    return PackageDataResponse(
      package: package ?? this.package,
      countries: countries ?? this.countries,
      states: states ?? this.states,
      districts: districts ?? this.districts,
      roads: roads ?? this.roads,
      packageRoads: packageRoads ?? this.packageRoads,
    );
  }

  @override
  List<Object?> get props => [
    package,
    countries,
    states,
    districts,
    roads,
    packageRoads,
  ];
}
