import 'package:equatable/equatable.dart';
import '../../../../lib/features/profile/domain/entities/user_settings_entity.dart';

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
  final UserSettings userSettings;
  final bool isFromCache;

  const ProfileLoaded({required this.userSettings, this.isFromCache = false});

  @override
  List<Object?> get props => [userSettings, isFromCache];

  ProfileLoaded copyWith({UserSettings? userSettings, bool? isFromCache}) {
    return ProfileLoaded(
      userSettings: userSettings ?? this.userSettings,
      isFromCache: isFromCache ?? this.isFromCache,
    );
  }
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError(this.message);

  @override
  List<Object> get props => [message];
}
