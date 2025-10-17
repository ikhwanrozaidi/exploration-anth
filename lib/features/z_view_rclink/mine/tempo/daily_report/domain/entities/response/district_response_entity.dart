import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'province_response_entity.dart';

part 'district_response_entity.g.dart';

@JsonSerializable()
class DistrictResponse extends Equatable {
  final String? name;
  final String? uid;
  final StateResponse? state;

  const DistrictResponse({this.name, this.uid, this.state});

  factory DistrictResponse.fromJson(Map<String, dynamic> json) =>
      _$DistrictResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictResponseToJson(this);

  DistrictResponse copyWith({String? name, String? uid, StateResponse? state}) {
    return DistrictResponse(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      state: state ?? this.state,
    );
  }

  @override
  List<Object?> get props => [name, uid, state];
}
