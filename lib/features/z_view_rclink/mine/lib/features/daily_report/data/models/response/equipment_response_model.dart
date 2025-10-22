import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/response/equipment_response_entity.dart';

part 'equipment_response_model.freezed.dart';
part 'equipment_response_model.g.dart';

@freezed
abstract class EquipmentResponseModel with _$EquipmentResponseModel {
  const EquipmentResponseModel._();

  const factory EquipmentResponseModel({String? name, String? uid}) =
      _EquipmentResponseModel;

  factory EquipmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$EquipmentResponseModelFromJson(json);

  EquipmentResponse toEntity() {
    return EquipmentResponse(name: name, uid: uid);
  }

  factory EquipmentResponseModel.fromEntity(EquipmentResponse entity) {
    return EquipmentResponseModel(name: entity.name, uid: entity.uid);
  }
}
