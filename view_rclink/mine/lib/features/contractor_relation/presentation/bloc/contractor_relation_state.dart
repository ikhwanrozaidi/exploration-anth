import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/contractor_relation_entity.dart';

part 'contractor_relation_state.freezed.dart';

@freezed
class ContractorRelationState with _$ContractorRelationState {
  const factory ContractorRelationState.initial() = ContractorRelationInitial;
  const factory ContractorRelationState.loading() = ContractorRelationLoading;
  const factory ContractorRelationState.loaded(
    List<ContractorRelation> contractors, {
    ContractorRelation? selectedContractor,
  }) = ContractorRelationLoaded;
  const factory ContractorRelationState.failure(String message) =
      ContractorRelationFailure;
}
