import 'package:equatable/equatable.dart';

class UserSettings extends Equatable {
  final String address;
  final String profilePicture;
  final String tier;
  final String fullName;
  final bool isMarketing;
  final bool isNotifications;
  final bool isTwoFa;

  const UserSettings({
    required this.address,
    required this.profilePicture,
    required this.tier,
    required this.fullName,
    required this.isMarketing,
    required this.isNotifications,
    required this.isTwoFa,
  });

  @override
  List<Object?> get props => [
    address,
    profilePicture,
    tier,
    fullName,
    isMarketing,
    isNotifications,
    isTwoFa,
  ];

  UserSettings copyWith({
    String? address,
    String? profilePicture,
    String? tier,
    String? fullName,
    bool? isMarketing,
    bool? isNotifications,
    bool? isTwoFa,
  }) {
    return UserSettings(
      address: address ?? this.address,
      profilePicture: profilePicture ?? this.profilePicture,
      tier: tier ?? this.tier,
      fullName: fullName ?? this.fullName,
      isMarketing: isMarketing ?? this.isMarketing,
      isNotifications: isNotifications ?? this.isNotifications,
      isTwoFa: isTwoFa ?? this.isTwoFa,
    );
  }
}
