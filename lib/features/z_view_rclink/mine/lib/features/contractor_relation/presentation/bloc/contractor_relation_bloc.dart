import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';

import '../../domain/usecases/clear_contractor_relation_usecase.dart';
import '../../domain/usecases/get_contractor_relation_usecase.dart';
import 'contractor_relation_event.dart';
import 'contractor_relation_state.dart';

@lazySingleton
class ContractorRelationBloc
    extends Bloc<ContractorRelationEvent, ContractorRelationState> {
  final GetContractorRelationUseCase _getContractorRelationUseCase;
  final ClearContractorRelationCacheUseCase
  _clearContractorRelationCacheUseCase;

  ContractorRelationBloc(
    this._getContractorRelationUseCase,
    this._clearContractorRelationCacheUseCase,
  ) : super(const ContractorRelationInitial()) {
    on<LoadContractorRelation>(_onLoadContractorRelation);
    on<SelectContractorRelation>(_onSelectContractorRelation);
    on<ClearContractorRelationSelection>(_onClearSelection);
    on<ClearContractorRelationCache>(_onClearCache);
  }

  Future<void> _onLoadContractorRelation(
    LoadContractorRelation event,
    Emitter<ContractorRelationState> emit,
  ) async {
    emit(const ContractorRelationLoading());

    final result = await _getContractorRelationUseCase(
      GetContractorRelationParams(forceRefresh: event.forceRefresh),
    );

    result.fold(
      (failure) =>
          emit(ContractorRelationFailure(_mapFailureToMessage(failure))),
      (contractors) {
        final selfContractor = contractors.firstWhere(
          (contractor) => contractor.isSelf == true,
          orElse: () => contractors.first,
        );

        emit(
          ContractorRelationLoaded(
            contractors,
            selectedContractor: selfContractor,
          ),
        );
      },
    );
  }

  Future<void> _onSelectContractorRelation(
    SelectContractorRelation event,
    Emitter<ContractorRelationState> emit,
  ) async {
    final currentState = state;
    if (currentState is ContractorRelationLoaded) {
      final selectedContractor = currentState.contractors.firstWhere(
        (contractor) => contractor.uid == event.contractorUID,
        orElse: () => currentState.contractors.first,
      );

      emit(
        ContractorRelationLoaded(
          currentState.contractors,
          selectedContractor: selectedContractor,
        ),
      );
    }
  }

  Future<void> _onClearSelection(
    ClearContractorRelationSelection event,
    Emitter<ContractorRelationState> emit,
  ) async {
    final currentState = state;
    if (currentState is ContractorRelationLoaded) {
      emit(
        ContractorRelationLoaded(
          currentState.contractors,
          selectedContractor: null,
        ),
      );
    }
  }

  Future<void> _onClearCache(
    ClearContractorRelationCache event,
    Emitter<ContractorRelationState> emit,
  ) async {
    final result = await _clearContractorRelationCacheUseCase();

    result.fold(
      (failure) =>
          emit(ContractorRelationFailure(_mapFailureToMessage(failure))),
      (_) {
        emit(const ContractorRelationInitial());
        add(const LoadContractorRelation());
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (ServerFailure):
        return (failure as ServerFailure).message;
      case const (CacheFailure):
        return (failure as CacheFailure).message;
      case const (NetworkFailure):
        return 'No internet connection';
      default:
        return 'Unexpected error occurred';
    }
  }
}
