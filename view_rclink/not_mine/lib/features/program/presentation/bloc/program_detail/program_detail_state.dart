import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/entities/program_entity.dart';

part 'program_detail_state.freezed.dart';

@freezed
class ProgramDetailState with _$ProgramDetailState {
  const factory ProgramDetailState.initial() = ProgramDetailInitial;

  const factory ProgramDetailState.loading() = ProgramDetailLoading;

  const factory ProgramDetailState.loaded({required Program program}) =
      ProgramDetailLoaded;

  const factory ProgramDetailState.failure(String message) =
      ProgramDetailFailure;
}
