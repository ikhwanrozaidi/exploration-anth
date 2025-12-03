import 'package:freezed_annotation/freezed_annotation.dart';

part 'contractor_relation_event.freezed.dart';

@freezed
class ContractorRelationEvent with _$ContractorRelationEvent {
  const factory ContractorRelationEvent.loadContractorRelation({
    @Default(false) bool forceRefresh,
  }) = LoadContractorRelation;

  const factory ContractorRelationEvent.selectContractorRelation(
    String contractorUID,
  ) = SelectContractorRelation;

  const factory ContractorRelationEvent.clearSelection() =
      ClearContractorRelationSelection;

  const factory ContractorRelationEvent.clearCache() =
      ClearContractorRelationCache;
}
