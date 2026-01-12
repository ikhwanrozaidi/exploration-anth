import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_event.freezed.dart';

@freezed
class ProgramEvent with _$ProgramEvent {
  const factory ProgramEvent.loadProgramSettings({
    @Default(false) bool forceRefresh,
  }) = LoadProgramSettings;

  const factory ProgramEvent.loadContractorRoads({
    required String contractorRelationUID,
  }) = LoadContractorRoads;

  const factory ProgramEvent.clearCache() = ClearProgramCache;

  const factory ProgramEvent.clearContractorRoads() = ClearContractorRoads;
}
