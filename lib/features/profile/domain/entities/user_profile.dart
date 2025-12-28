import 'package:equatable/equatable.dart';
import 'user_profile_user.dart';
import 'user_profile_detail.dart';
import 'user_profile_settings.dart';

class UserProfile extends Equatable {
  final UserProfileUser user;
  final UserProfileDetail? detail;
  final UserProfileSettings? settings;

  const UserProfile({required this.user, this.detail, this.settings});

  @override
  List<Object?> get props => [user, detail, settings];
}
