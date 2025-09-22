import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/daily_report_creation/data/models/province/province_model.dart';

part 'district_model.freezed.dart';
part 'district_model.g.dart';

@freezed
abstract class DistrictModel with _$DistrictModel {
  factory DistrictModel({
    int? id,
    String? uid,
    String? name,
    @JsonKey(name: 'provinceID') int? stateId,
    ProvinceModel? state,
  }) = _DistrictModel;

  factory DistrictModel.fromJson(Map<String, dynamic> json) =>
      _$DistrictModelFromJson(json);
}
