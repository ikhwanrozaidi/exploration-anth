import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/program_entity.dart';

part 'program_list_state.freezed.dart';

@freezed
class ProgramListState with _$ProgramListState {
  const factory ProgramListState.initial() = ProgramListInitial;

  const factory ProgramListState.loading() = ProgramListLoading;

  const factory ProgramListState.loaded({
    required List<Program> programs,
    @Default(1) int currentPage,
    @Default(true) bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = ProgramListLoaded;

  const factory ProgramListState.failure(String message) = ProgramListFailure;
}
