import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_warning_model.freezed.dart';
part 'create_warning_model.g.dart';

@freezed
abstract class CreateWarningModel with _$CreateWarningModel {
  const factory CreateWarningModel({
    required String roadUID,
    required String workScopeUID,
    double? fromSection,
    double? toSection,
    @JsonKey(includeIfNull: false) String? contractRelationUID,
    required List<String> warningReasonUIDs,
    String? description,
    double? longitude,
    double? latitude,
    bool? requiresAction,
  }) = _CreateWarningModel;

  factory CreateWarningModel.fromJson(Map<String, dynamic> json) =>
      _$CreateWarningModelFromJson(json);
}
