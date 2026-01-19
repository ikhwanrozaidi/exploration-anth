import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'state_nested_entity.dart';

part 'district_nested_entity.g.dart';

@JsonSerializable()
class DistrictNested extends Equatable {
  final int? id;
  final String? uid;
  final String? name;
  final int? stateID;
  final StateNested? state;

  const DistrictNested({
    this.id,
    this.uid,
    this.name,
    this.stateID,
    this.state,
  });

  factory DistrictNested.fromJson(Map<String, dynamic> json) =>
      _$DistrictNestedFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictNestedToJson(this);

  DistrictNested copyWith({
    int? id,
    String? uid,
    String? name,
    int? stateID,
    StateNested? state,
  }) {
    return DistrictNested(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      stateID: stateID ?? this.stateID,
      state: state ?? this.state,
    );
  }

  @override
  List<Object?> get props => [id, uid, name, stateID, state];
}
