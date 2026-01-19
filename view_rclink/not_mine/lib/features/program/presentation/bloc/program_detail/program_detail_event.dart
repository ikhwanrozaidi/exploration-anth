import 'package:freezed_annotation/freezed_annotation.dart';

part 'program_detail_event.freezed.dart';

@freezed
abstract class ProgramDetailEvent with _$ProgramDetailEvent {
  const factory ProgramDetailEvent.loadProgramDetail({
    required String companyUID,
    required String programUID,
    @Default(false) bool forceRefresh,
  }) = LoadProgramDetail;

  const factory ProgramDetailEvent.refreshProgramDetail({
    required String companyUID,
    required String programUID,
  }) = RefreshProgramDetail;
}
