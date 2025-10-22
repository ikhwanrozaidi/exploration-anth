import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/daily_report/domain/entities/response/province_response_entity.dart';

import 'country_response_model.dart';

part 'province_response_model.freezed.dart';
part 'province_response_model.g.dart';

@freezed
abstract class StateResponseModel with _$StateResponseModel {
  const StateResponseModel._();

  const factory StateResponseModel({
    String? name,
    String? uid,
    CountryResponseModel? country,
  }) = _StateResponseModel;

  factory StateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StateResponseModelFromJson(json);

  StateResponse toEntity() {
    return StateResponse(name: name, uid: uid, country: country?.toEntity());
  }

  factory StateResponseModel.fromEntity(StateResponse entity) {
    return StateResponseModel(
      name: entity.name,
      uid: entity.uid,
      country: entity.country != null
          ? CountryResponseModel.fromEntity(entity.country!)
          : null,
    );
  }
}
