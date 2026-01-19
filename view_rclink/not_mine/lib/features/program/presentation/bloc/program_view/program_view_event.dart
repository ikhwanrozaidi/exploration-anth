import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_view_event.freezed.dart';

@freezed
class ProgramViewEvent with _$ProgramViewEvent {
  // List events
  const factory ProgramViewEvent.loadPrograms({
    required String companyUID,
    @Default(1) int page,
    @Default(10) int limit,
    @Default(false) bool forceRefresh,
  }) = LoadPrograms;

  const factory ProgramViewEvent.loadMorePrograms({
    required String companyUID,
  }) = LoadMorePrograms;

  const factory ProgramViewEvent.refreshPrograms({required String companyUID}) =
      RefreshPrograms;

  // Detail events
  const factory ProgramViewEvent.loadProgramDetail({
    required String companyUID,
    required String programUID,
    @Default(false) bool forceRefresh,
  }) = LoadProgramDetail;

  const factory ProgramViewEvent.refreshProgramDetail({
    required String companyUID,
    required String programUID,
  }) = RefreshProgramDetail;

  // Cache management
  const factory ProgramViewEvent.clearCache() = ClearProgramCache;
}
