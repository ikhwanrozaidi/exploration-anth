import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'equipment_response_entity.g.dart';

@JsonSerializable()
class EquipmentResponse extends Equatable {
  final String? name;
  final String? uid;

  const EquipmentResponse({this.name, this.uid});

  factory EquipmentResponse.fromJson(Map<String, dynamic> json) =>
      _$EquipmentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EquipmentResponseToJson(this);

  EquipmentResponse copyWith({String? name, String? uid}) {
    return EquipmentResponse(name: name ?? this.name, uid: uid ?? this.uid);
  }

  @override
  List<Object?> get props => [name, uid];
}
