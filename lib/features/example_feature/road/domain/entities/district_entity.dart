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
  final String? stateUID;
  final String? createdAt;
  final String? updatedAt;
  final Province? state;

  const District({
    this.id,
    this.uid,
    this.name,
    this.stateID,
    this.stateUID,
    this.createdAt,
    this.updatedAt,
    this.state,
  });

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);

  @override
  List<Object?> get props => [
    id,
    uid,
    name,
    stateID,
    stateUID,
    createdAt,
    updatedAt,
    state,
  ];
}
