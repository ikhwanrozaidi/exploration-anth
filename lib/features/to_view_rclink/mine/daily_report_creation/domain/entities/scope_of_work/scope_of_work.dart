import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'work_equipment.dart';
import 'work_quantity_type.dart';

part 'scope_of_work.g.dart';

@JsonSerializable()
class ScopeOfWork extends Equatable {
  final int id;
  final String uid;
  final String name;
  final String code;
  final String description;
  final bool allowMultipleQuantities;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  final int companyID;
  final List<WorkQuantityType> workQuantityTypes;
  final List<WorkEquipment> workEquipments;

  const ScopeOfWork({
    required this.id,
    required this.uid,
    required this.name,
    required this.code,
    required this.description,
    required this.allowMultipleQuantities,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.companyID,
    required this.workQuantityTypes,
    required this.workEquipments,
  });

  @override
  List<Object?> get props => [
    id,
    uid,
    name,
    code,
    description,
    allowMultipleQuantities,
    createdAt,
    updatedAt,
    deletedAt,
    companyID,
    workQuantityTypes,
    workEquipments,
  ];

  factory ScopeOfWork.fromJson(Map<String, dynamic> json) =>
      _$ScopeOfWorkFromJson(json);
  Map<String, dynamic> toJson() => _$ScopeOfWorkToJson(this);
}
