import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/work_scope_response.dart';

part 'work_scope_response_model.freezed.dart';
part 'work_scope_response_model.g.dart';

@freezed
abstract class WorkScopeResponseModel with _$WorkScopeResponseModel {
  const WorkScopeResponseModel._();

  const factory WorkScopeResponseModel({
    required String uid,
    required String name,
    required String code,
  }) = _WorkScopeResponseModel;

  factory WorkScopeResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WorkScopeResponseModelFromJson(json);

  WorkScopeResponse toEntity() {
    return WorkScopeResponse(uid: uid, name: name, code: code);
  }
}
