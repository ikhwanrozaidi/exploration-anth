import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../../core/errors/failures.dart';
import '../../../domain/entities/warning.dart';

part 'create_warning_state.freezed.dart';

@freezed
class CreateWarningState with _$CreateWarningState {
  const factory CreateWarningState.initial() = CreateWarningInitial;

  const factory CreateWarningState.loading() = CreateWarningLoading;

  const factory CreateWarningState.success(Warning warning) =
      CreateWarningSuccess;

  const factory CreateWarningState.error(Failure failure) = CreateWarningError;
}
