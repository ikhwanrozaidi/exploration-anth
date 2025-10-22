import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:rclink_app/features/daily_report/domain/entities/response/workscope_response_entity.dart';

part 'workscope_response_model.freezed.dart';
part 'workscope_response_model.g.dart';

@freezed
abstract class WorkScopeResponseModel with _$WorkScopeResponseModel {
  const WorkScopeResponseModel._();

  const factory WorkScopeResponseModel({
    String? name,
    String? code,
    String? uid,
  }) = _WorkScopeResponseModel;

  factory WorkScopeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WorkScopeResponseModelFromJson(json);

  WorkScopeResponse toEntity() {
    return WorkScopeResponse(name: name, code: code, uid: uid);
  }

  factory WorkScopeResponseModel.fromEntity(WorkScopeResponse entity) {
    return WorkScopeResponseModel(
      name: entity.name,
      code: entity.code,
      uid: entity.uid,
    );
  }
}
