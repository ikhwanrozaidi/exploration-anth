import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/program_view/program_quantity_entity.dart';
import '../program_settings/quantity_type_nested_model.dart';

part 'program_quantity_model.freezed.dart';
part 'program_quantity_model.g.dart';

@freezed
abstract class ProgramQuantityModel with _$ProgramQuantityModel {
  const ProgramQuantityModel._();

  const factory ProgramQuantityModel({
    int? id,
    String? uid,
    int? programID,
    int? quantityTypeID,
    int? sequenceNo,
    String? totalLength,
    String? notes,
    String? createdAt,
    String? updatedAt,
    QuantityTypeNestedModel? quantityType,
    List<Map<String, dynamic>>? quantityValues,
    List<Map<String, dynamic>>? segments,
  }) = _ProgramQuantityModel;

  factory ProgramQuantityModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramQuantityModelFromJson(json);
}

extension ProgramQuantityModelX on ProgramQuantityModel {
  ProgramQuantity toEntity() {
    return ProgramQuantity(
      id: id,
      uid: uid,
      programID: programID,
      quantityTypeID: quantityTypeID,
      sequenceNo: sequenceNo,
      totalLength: totalLength,
      notes: notes,
      createdAt: createdAt,
      updatedAt: updatedAt,
      quantityType: quantityType?.toEntity(),
      quantityValues: quantityValues,
      segments: segments,
    );
  }

  static ProgramQuantityModel fromEntity(ProgramQuantity entity) {
    return ProgramQuantityModel(
      id: entity.id,
      uid: entity.uid,
      programID: entity.programID,
      quantityTypeID: entity.quantityTypeID,
      sequenceNo: entity.sequenceNo,
      totalLength: entity.totalLength,
      notes: entity.notes,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      quantityType: entity.quantityType != null
          ? QuantityTypeNestedModelX.fromEntity(entity.quantityType!)
          : null,
      quantityValues: entity.quantityValues,
      segments: entity.segments,
    );
  }
}
