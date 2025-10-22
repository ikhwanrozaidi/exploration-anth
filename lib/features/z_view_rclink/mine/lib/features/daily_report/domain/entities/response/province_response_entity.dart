import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'country_response_entity.dart';

part 'province_response_entity.g.dart';

@JsonSerializable()
class StateResponse extends Equatable {
  final String? name;
  final String? uid;
  final CountryResponse? country;

  const StateResponse({this.name, this.uid, this.country});

  factory StateResponse.fromJson(Map<String, dynamic> json) =>
      _$StateResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StateResponseToJson(this);

  StateResponse copyWith({
    String? name,
    String? uid,
    CountryResponse? country,
  }) {
    return StateResponse(
      name: name ?? this.name,
      uid: uid ?? this.uid,
      country: country ?? this.country,
    );
  }

  @override
  List<Object?> get props => [name, uid, country];
}
