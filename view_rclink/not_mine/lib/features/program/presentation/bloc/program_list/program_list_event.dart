import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_list_event.freezed.dart';

@freezed
class ProgramListEvent with _$ProgramListEvent {
  const factory ProgramListEvent.loadPrograms({
    required String companyUID,
    @Default(1) int page,
    @Default(10) int limit,
    @Default(false) bool forceRefresh,
  }) = LoadPrograms;

  const factory ProgramListEvent.loadMorePrograms({
    required String companyUID,
  }) = LoadMorePrograms;

  const factory ProgramListEvent.refreshPrograms({required String companyUID}) =
      RefreshPrograms;

  const factory ProgramListEvent.clearCache() = ClearProgramCache;
}
