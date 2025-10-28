import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/road/data/models/province_model.dart';
import 'package:rclink_app/features/road/domain/entities/district_entity.dart';

part 'district_model.freezed.dart';
part 'district_model.g.dart';

@freezed
abstract class DistrictModel with _$DistrictModel {
  const DistrictModel._();

  const factory DistrictModel({
    int? id,
    String? uid,
    String? name,
    int? stateID,
    String? stateUID,
    String? createdAt,
    String? updatedAt,
    ProvinceModel? state,
  }) = _DistrictModel;

  factory DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictModelFromJson(json);

  /// Model → Entity
  District toEntity() {
    return District(
      id: id,
      uid: uid,
      name: name,
      stateID: stateID,
      state: state?.toEntity(),
    );
  }

  /// Entity → Model
  factory DistrictModel.fromEntity(District entity) {
    return DistrictModel(
      id: entity.id,
      uid: entity.uid,
      name: entity.name,
      stateID: entity.stateID,
      state: entity.state != null
          ? ProvinceModel.fromEntity(entity.state!)
          : null,
    );
  }
}
