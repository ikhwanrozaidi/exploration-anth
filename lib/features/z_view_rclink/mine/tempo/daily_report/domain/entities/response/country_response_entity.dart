import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'country_response_entity.g.dart';

@JsonSerializable()
class CountryResponse extends Equatable {
  final String? name;
  final String? uid;

  const CountryResponse({this.name, this.uid});

  factory CountryResponse.fromJson(Map<String, dynamic> json) =>
      _$CountryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CountryResponseToJson(this);

  CountryResponse copyWith({String? name, String? uid}) {
    return CountryResponse(name: name ?? this.name, uid: uid ?? this.uid);
  }

  @override
  List<Object?> get props => [name, uid];
}
