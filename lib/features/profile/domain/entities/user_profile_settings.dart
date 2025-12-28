import 'package:equatable/equatable.dart';

class UserProfileSettings extends Equatable {
  final bool marketing;
  final bool notifications;
  final bool twoFA;

  const UserProfileSettings({
    required this.marketing,
    required this.notifications,
    required this.twoFA,
  });

  @override
  List<Object?> get props => [marketing, notifications, twoFA];
}
