import 'package:equatable/equatable.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object?> get props => [];
}

class LoadUserSettings extends ProfileEvent {
  const LoadUserSettings();
}

class RefreshUserSettings extends ProfileEvent {
  const RefreshUserSettings();
}
