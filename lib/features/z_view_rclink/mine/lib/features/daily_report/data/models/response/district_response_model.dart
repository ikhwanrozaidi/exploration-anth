import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/response/district_response_entity.dart';
import 'province_response_model.dart';

part 'district_response_model.freezed.dart';
part 'district_response_model.g.dart';

@freezed
abstract class DistrictResponseModel with _$DistrictResponseModel {
  const DistrictResponseModel._();

  const factory DistrictResponseModel({
    String? name,
    String? uid,
    StateResponseModel? state,
  }) = _DistrictResponseModel;

  factory DistrictResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictResponseModelFromJson(json);

  DistrictResponse toEntity() {
    return DistrictResponse(name: name, uid: uid, state: state?.toEntity());
  }

  factory DistrictResponseModel.fromEntity(DistrictResponse entity) {
    return DistrictResponseModel(
      name: entity.name,
      uid: entity.uid,
      state: entity.state != null
          ? StateResponseModel.fromEntity(entity.state!)
          : null,
    );
  }
}
