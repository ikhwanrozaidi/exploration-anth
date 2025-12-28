import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_event.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.loadProfile() = LoadProfile;
  const factory ProfileEvent.refreshProfile() = RefreshProfile;

  const factory ProfileEvent.updateProfile({
    String? email,
    String? phone,
    String? country,
    String? firstName,
    String? lastName,
    String? fullName,
    String? address,
    String? birthDate,
    String? profilePicture,
  }) = UpdateProfile;
}
