import 'package:freezed_annotation/freezed_annotation.dart';

part 'district_response_model.freezed.dart';
part 'district_response_model.g.dart';

@freezed
abstract class DistrictResponseModel with _$DistrictResponseModel {
  const factory DistrictResponseModel({
    required String name,
    required String uid,
    StateResponseModel? state,
  }) = _DistrictResponseModel;

  factory DistrictResponseModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictResponseModelFromJson(json);
}

@freezed
abstract class StateResponseModel with _$StateResponseModel {
  const factory StateResponseModel({
    required String name,
    required String uid,
    CountryResponseModel? country,
  }) = _StateResponseModel;

  factory StateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StateResponseModelFromJson(json);
}

@freezed
abstract class CountryResponseModel with _$CountryResponseModel {
  const factory CountryResponseModel({
    required String name,
    required String uid,
  }) = _CountryResponseModel;

  factory CountryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CountryResponseModelFromJson(json);
}
