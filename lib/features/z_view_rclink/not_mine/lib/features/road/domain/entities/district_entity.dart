import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rclink_app/features/road/domain/entities/province_entity.dart';

part 'district_entity.g.dart';

@JsonSerializable()
class District extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final int? stateID;
  final Province? state;

  const District({this.id, this.uid, this.name, this.stateID, this.state});

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);

  @override
  List<Object?> get props => [id, uid, name, stateID, state];
}
