import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/company.dart';

part 'company_state.freezed.dart';

@freezed
class CompanyState with _$CompanyState {
  const factory CompanyState.initial() = CompanyInitial;
  const factory CompanyState.loading() = CompanyLoading;
  const factory CompanyState.loaded(
    List<Company> companies, {
    Company? selectedCompany,
  }) = CompanyLoaded;
  const factory CompanyState.failure(String message) = CompanyFailure;
  const factory CompanyState.updating() = CompanyUpdating;
  const factory CompanyState.fieldUpdateFailure(
    List<Company> companies,
    String errorMessage, {
    Company? selectedCompany,
  }) = CompanyFieldUpdateFailure;
}
