import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadUserProfile extends ProfileEvent {
  const LoadUserProfile();
}

class RefreshUserProfile extends ProfileEvent {
  const RefreshUserProfile();
}

class UpdateUserProfile extends ProfileEvent {
  final Map<String, dynamic> userData;

  const UpdateUserProfile(this.userData);

  @override
  List<Object> get props => [userData];
}

class LogoutUser extends ProfileEvent {
  const LogoutUser();
}

class ToggleTwoFactorAuth extends ProfileEvent {
  final bool isEnabled;

  const ToggleTwoFactorAuth(this.isEnabled);

  @override
  List<Object> get props => [isEnabled];
}

class ToggleBiometricAuth extends ProfileEvent {
  final bool isEnabled;

  const ToggleBiometricAuth(this.isEnabled);

  @override
  List<Object> get props => [isEnabled];
}