import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/work_scope_response.dart';

part 'work_scope_model.freezed.dart';
part 'work_scope_model.g.dart';

@freezed
abstract class WorkScopeModel with _$WorkScopeModel {
  const WorkScopeModel._();

  const factory WorkScopeModel({
    required String name,
    required String code,
    required String uid,
  }) = _WorkScopeModel;

  factory WorkScopeModel.fromJson(Map<String, dynamic> json) =>
      _$WorkScopeModelFromJson(json);

  WorkScopeResponse toEntity() {
    return WorkScopeResponse(name: name, code: code, uid: uid);
  }
}
