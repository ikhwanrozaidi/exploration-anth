import 'package:freezed_annotation/freezed_annotation.dart';

part 'district_model.freezed.dart';
part 'district_model.g.dart';

@freezed
abstract class DistrictModel with _$DistrictModel {
  const factory DistrictModel({
    required String name,
    required String uid,
    StateModel? state,
  }) = _DistrictModel;

  factory DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictModelFromJson(json);
}

@freezed
abstract class StateModel with _$StateModel {
  const factory StateModel({
    required String name,
    required String uid,
    CountryModel? country,
  }) = _StateModel;

  factory StateModel.fromJson(Map<String, dynamic> json) =>
      _$StateModelFromJson(json);
}

@freezed
abstract class CountryModel with _$CountryModel {
  const factory CountryModel({required String name, required String uid}) =
      _CountryModel;

  factory CountryModel.fromJson(Map<String, dynamic> json) =>
      _$CountryModelFromJson(json);
}
