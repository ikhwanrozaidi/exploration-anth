import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rclink_app/features/daily_report/domain/entities/company_response.dart';

part 'company_response_model.freezed.dart';
part 'company_response_model.g.dart';

@freezed
abstract class CompanyResponseModel with _$CompanyResponseModel {
  const CompanyResponseModel._();

  const factory CompanyResponseModel({
    required String uid,
    required String name,
  }) = _CompanyResponseModel;

  factory CompanyResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CompanyResponseModelFromJson(json);

  CompanyResponse toEntity() {
    return CompanyResponse(uid: uid, name: name);
  }
}
