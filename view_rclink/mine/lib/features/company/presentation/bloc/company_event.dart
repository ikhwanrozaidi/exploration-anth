import 'package:freezed_annotation/freezed_annotation.dart';

part 'company_event.freezed.dart';

@freezed
class CompanyEvent with _$CompanyEvent {
  const factory CompanyEvent.loadCompanies() = LoadCompanies;
  const factory CompanyEvent.selectCompany(String companyId) = SelectCompany;
  const factory CompanyEvent.clearSelection() = ClearSelection;
  const factory CompanyEvent.clearCache() = ClearCompanyCache;

  const factory CompanyEvent.updateCompanyField({
    required String companyUid,
    required String fieldName,
    required String fieldValue,
  }) = UpdateCompanyField;
}
