import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/program_setting_entity.dart';
import '../../domain/usecases/clear_program_cache_usecase.dart';
import '../../domain/usecases/get_contractor_roads_usecase.dart';
import '../../domain/usecases/get_program_settings_usecase.dart';
import 'program_event.dart';
import 'program_state.dart';

@lazySingleton
class ProgramBloc extends Bloc<ProgramEvent, ProgramState> {
  final GetProgramSettingsUseCase _getProgramSettingsUseCase;
  final GetContractorRoadsUseCase _getContractorRoadsUseCase;
  final ClearProgramCacheUseCase _clearProgramCacheUseCase;

  ProgramBloc(
    this._getProgramSettingsUseCase,
    this._getContractorRoadsUseCase,
    this._clearProgramCacheUseCase,
  ) : super(const ProgramInitial()) {
    on<LoadProgramSettings>(_onLoadProgramSettings);
    on<LoadContractorRoads>(_onLoadContractorRoads);
    on<ClearProgramCache>(_onClearCache);
    on<ClearContractorRoads>(_onClearContractorRoads);
  }

  Future<void> _onLoadProgramSettings(
    LoadProgramSettings event,
    Emitter<ProgramState> emit,
  ) async {
    emit(const ProgramLoading());

    final result = await _getProgramSettingsUseCase(
      GetProgramSettingsParams(forceRefresh: event.forceRefresh),
    );

    result.fold(
      (failure) => emit(ProgramError(_mapFailureToMessage(failure))),
      (programSettings) {
        // Preserve contractor roads if already loaded
        final currentState = state;
        final contractorRoads = currentState is ProgramLoaded
            ? currentState.contractorRoads
            : null;

        emit(
          ProgramLoaded(
            programSettings: programSettings,
            contractorRoads: contractorRoads,
          ),
        );
      },
    );
  }

  Future<void> _onLoadContractorRoads(
    LoadContractorRoads event,
    Emitter<ProgramState> emit,
  ) async {
    // Don't show loading if program settings already loaded
    if (state is! ProgramLoaded) {
      emit(const ProgramLoading());
    }

    final result = await _getContractorRoadsUseCase(
      GetContractorRoadsParams(
        contractorRelationUID: event.contractorRelationUID,
      ),
    );

    result.fold(
      (failure) => emit(ProgramError(_mapFailureToMessage(failure))),
      (packageData) {
        final currentState = state;
        final programSettings = currentState is ProgramLoaded
            ? currentState.programSettings
            : <ProgramSetting>[];

        emit(
          ProgramLoaded(
            programSettings: programSettings,
            contractorRoads: packageData.roads,
          ),
        );
      },
    );
  }

  Future<void> _onClearCache(
    ClearProgramCache event,
    Emitter<ProgramState> emit,
  ) async {
    final result = await _clearProgramCacheUseCase();

    result.fold(
      (failure) => emit(ProgramError(_mapFailureToMessage(failure))),
      (_) {
        emit(const ProgramInitial());
        add(const LoadProgramSettings());
      },
    );
  }

  Future<void> _onClearContractorRoads(
    ClearContractorRoads event,
    Emitter<ProgramState> emit,
  ) async {
    // Clear contractor roads but keep program settings
    final currentState = state;
    if (currentState is ProgramLoaded) {
      emit(
        ProgramLoaded(
          programSettings: currentState.programSettings,
          contractorRoads: null,
        ),
      );
    }
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
