import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'work_equipment.g.dart';

@JsonSerializable()
class WorkEquipment extends Equatable {
  final int id;
  final String uid;
  final String name;
  final String code;

  const WorkEquipment({
    required this.id,
    required this.uid,
    required this.name,
    required this.code,
  });

  @override
  List<Object?> get props => [id, uid, name, code];

  factory WorkEquipment.fromJson(Map<String, dynamic> json) =>
      _$WorkEquipmentFromJson(json);
  Map<String, dynamic> toJson() => _$WorkEquipmentToJson(this);
}
