import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/district_entity.dart';
import 'province_model.dart';

part 'district_model.freezed.dart';
part 'district_model.g.dart';

@freezed
abstract class DistrictModel with _$DistrictModel {
  const DistrictModel._();

  const factory DistrictModel({
    int? id,
    String? uid,
    String? name,
    @JsonKey(name: 'stateID') int? stateId,
    ProvinceModel? state,
  }) = _DistrictModel;

  factory DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictModelFromJson(json);

  District toEntity() {
    return District(
      id: id,
      uid: uid,
      name: name,
      stateId: stateId,
      state: state?.toEntity(),
    );
  }

  factory DistrictModel.fromEntity(District entity) {
    return DistrictModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      stateId: entity.stateId,
      state: entity.state != null
          ? ProvinceModel.fromEntity(entity.state!)
          : null,
    );
  }
}
