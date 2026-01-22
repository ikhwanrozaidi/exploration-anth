import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/program_entity.dart';

part 'create_program_response_model.freezed.dart';
part 'create_program_response_model.g.dart';

@freezed
abstract class ProgramResponseModel with _$ProgramResponseModel {
  const factory ProgramResponseModel({
    int? id,
    String? uid,
    String? name,
    String? description,
    int? companyID,
    int? workScopeID,
    int? roadID,
    String? periodStart,
    String? periodEnd,
    int? contractRelationID,
    int? requiredReportsCount,
    int? totalReports,
    String? calculationType,
    String? fromSection,
    String? toSection,
    int? dividerValue,
    int? inputValue,
    String? status,
    int? createdByID,
    String? createdAt,
    String? updatedAt,
    String? deletedAt,
  }) = _ProgramResponseModel;

  factory ProgramResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ProgramResponseModelFromJson(json);
}

extension ProgramResponseModelX on ProgramResponseModel {
  Program toEntity() {
    return Program(
      id: id,
      uid: uid,
      name: name,
      description: description,
      companyID: companyID,
      workScopeID: workScopeID,
      contractRelationID: contractRelationID,
      status: status,
      totalReports: totalReports,
      createdAt: createdAt,
      updatedAt: updatedAt,
      deletedAt: deletedAt,
    );
  }

  static ProgramResponseModel fromEntity(Program entity) {
    return ProgramResponseModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      description: entity.description,
      companyID: entity.companyID,
      workScopeID: entity.workScopeID,
      contractRelationID: entity.contractRelationID,
      status: entity.status,
      totalReports: entity.totalReports,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      deletedAt: entity.deletedAt,
    );
  }
}
