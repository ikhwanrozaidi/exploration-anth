import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/program_view/district_nested_entity.dart';
import 'state_nested_model.dart';

part 'district_nested_model.freezed.dart';
part 'district_nested_model.g.dart';

@freezed
abstract class DistrictNestedModel with _$DistrictNestedModel {
  const factory DistrictNestedModel({
    int? id,
    String? uid,
    String? name,
    int? stateID,
    StateNestedModel? state,
  }) = _DistrictNestedModel;

  factory DistrictNestedModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictNestedModelFromJson(json);
}

extension DistrictNestedModelX on DistrictNestedModel {
  DistrictNested toEntity() {
    return DistrictNested(
      id: id,
      uid: uid,
      name: name,
      stateID: stateID,
      state: state?.toEntity(),
    );
  }

  static DistrictNestedModel fromEntity(DistrictNested entity) {
    return DistrictNestedModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      stateID: entity.stateID,
      state: entity.state != null
          ? StateNestedModelX.fromEntity(entity.state!)
          : null,
    );
  }
}
