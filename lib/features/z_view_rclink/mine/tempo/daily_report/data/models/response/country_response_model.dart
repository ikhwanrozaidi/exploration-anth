import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/daily_report/domain/entities/response/country_response_entity.dart';

part 'country_response_model.freezed.dart';
part 'country_response_model.g.dart';

@freezed
abstract class CountryResponseModel with _$CountryResponseModel {
  const CountryResponseModel._();

  const factory CountryResponseModel({String? name, String? uid}) =
      _CountryResponseModel;

  factory CountryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CountryResponseModelFromJson(json);

  CountryResponse toEntity() {
    return CountryResponse(name: name, uid: uid);
  }

  factory CountryResponseModel.fromEntity(CountryResponse entity) {
    return CountryResponseModel(name: entity.name, uid: entity.uid);
  }
}
