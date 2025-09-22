import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:rclink_app/features/daily_report_creation/domain/entities/province/province_entity.dart';

part 'district_entity.g.dart';

@JsonSerializable()
class DistrictEntity extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final int? stateId;
  final ProvinceEntity? state;

  const DistrictEntity({
    this.id,
    this.uid,
    this.name,
    this.stateId,
    this.state,
  });

  factory DistrictEntity.fromJson(Map<String, dynamic> json) =>
      _$DistrictEntityFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictEntityToJson(this);

  @override
  List<Object?> get props => [id, uid, name, stateId, state];
}
