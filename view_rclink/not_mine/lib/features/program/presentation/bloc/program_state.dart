import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../../domain/entities/program_setting_entity.dart';

part 'program_state.freezed.dart';

@freezed
class ProgramState with _$ProgramState {
  const factory ProgramState.initial() = ProgramInitial;

  const factory ProgramState.loading() = ProgramLoading;

  const factory ProgramState.loaded({
    required List<ProgramSetting> programSettings,
    List<Road>? contractorRoads,
  }) = ProgramLoaded;

  const factory ProgramState.error(String message) = ProgramError;
}
