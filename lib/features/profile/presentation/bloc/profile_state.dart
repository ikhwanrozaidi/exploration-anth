import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/user_profile_user.dart';
import '../../domain/entities/user_profile_detail.dart';
import '../../domain/entities/user_profile_settings.dart';

part 'profile_state.freezed.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitial;
  const factory ProfileState.loading() = ProfileLoading;
  const factory ProfileState.loaded({
    required UserProfileUser user,
    UserProfileDetail? detail,
    UserProfileSettings? settings,
  }) = ProfileLoaded;
  const factory ProfileState.empty() = ProfileEmpty;
  const factory ProfileState.failure(String message) = ProfileFailure;

  const factory ProfileState.updating() = ProfileUpdating;
}
