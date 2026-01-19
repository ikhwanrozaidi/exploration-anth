import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/program_entity.dart';

part 'program_view_state.freezed.dart';

@freezed
class ProgramViewState with _$ProgramViewState {
  // Initial state
  const factory ProgramViewState.initial() = ProgramViewInitial;

  // List states
  const factory ProgramViewState.loading() = ProgramViewLoading;

  const factory ProgramViewState.loaded({
    required List<Program> programs,
    @Default(1) int currentPage,
    @Default(true) bool hasMore,
    @Default(false) bool isLoadingMore,
  }) = ProgramViewLoaded;

  const factory ProgramViewState.failure(String message) = ProgramViewFailure;

  // Detail states
  const factory ProgramViewState.detailLoading() = ProgramViewDetailLoading;

  const factory ProgramViewState.detailLoaded({required Program program}) =
      ProgramViewDetailLoaded;

  const factory ProgramViewState.detailFailure(String message) =
      ProgramViewDetailFailure;
}
