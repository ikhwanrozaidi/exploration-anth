import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'district_response_entity.dart';

part 'road_response_entity.g.dart';

@JsonSerializable()
class RoadResponse extends Equatable {
  final String? name;
  final String? roadNo;
  final String? uid;
  final DistrictResponse? district;

  const RoadResponse({this.name, this.roadNo, this.uid, this.district});

  factory RoadResponse.fromJson(Map<String, dynamic> json) =>
      _$RoadResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RoadResponseToJson(this);

  RoadResponse copyWith({
    String? name,
    String? roadNo,
    String? uid,
    DistrictResponse? district,
  }) {
    return RoadResponse(
      name: name ?? this.name,
      roadNo: roadNo ?? this.roadNo,
      uid: uid ?? this.uid,
      district: district ?? this.district,
    );
  }

  @override
  List<Object?> get props => [name, roadNo, uid, district];
}
