import 'package:equatable/equatable.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object?> get props => [];
}

class ProfileInitial extends ProfileState {
  const ProfileInitial();
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileLoaded extends ProfileState {
  final Map<String, dynamic> userData;
  final bool twoFactorEnabled;
  final bool biometricEnabled;

  const ProfileLoaded({
    required this.userData,
    this.twoFactorEnabled = false,
    this.biometricEnabled = false,
  });

  @override
  List<Object?> get props => [userData, twoFactorEnabled, biometricEnabled];

  ProfileLoaded copyWith({
    Map<String, dynamic>? userData,
    bool? twoFactorEnabled,
    bool? biometricEnabled,
  }) {
    return ProfileLoaded(
      userData: userData ?? this.userData,
      twoFactorEnabled: twoFactorEnabled ?? this.twoFactorEnabled,
      biometricEnabled: biometricEnabled ?? this.biometricEnabled,
    );
  }
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object> get props => [message];
}

class ProfileLoggedOut extends ProfileState {
  const ProfileLoggedOut();
}