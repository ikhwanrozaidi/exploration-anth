import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../shared/utils/theme.dart';

class ProfileHeader extends StatelessWidget {
  final Map<String, dynamic> userData;
  final VoidCallback? onEditPressed;

  const ProfileHeader({
    super.key,
    required this.userData,
    this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Profile',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: w * 0.08),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 70.0,
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        _getInitials(),
                        style: TextStyle(
                          fontFamily: tSecondaryFont,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _getFormattedName(),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        userData['country'] ?? 'Country not set',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                onPressed: onEditPressed,
                icon: const Icon(Icons.border_color_outlined),
              )
            ],
          ),
          const SizedBox(height: 20),
          _buildContactInfo(
            Icons.phone_outlined,
            userData['phone'] ?? 'Phone not set',
          ),
          const SizedBox(height: 10),
          _buildContactInfo(
            Icons.mail_outline_outlined,
            userData['email'] ?? 'Email not set',
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _getInitials() {
    final firstName = userData['firstName'] ?? '';
    final lastName = userData['lastName'] ?? '';
    
    if (firstName.isEmpty && lastName.isEmpty) {
      return 'NA';
    }
    
    final firstInitial = firstName.isNotEmpty ? firstName[0].toUpperCase() : '';
    final lastInitial = lastName.isNotEmpty ? lastName[0].toUpperCase() : '';
    
    return '$firstInitial$lastInitial';
  }

  String _getFormattedName() {
    final firstName = userData['firstName'] ?? '';
    final lastName = userData['lastName'] ?? '';
    
    if (firstName.isEmpty && lastName.isEmpty) {
      return 'Name not set';
    }
    
    String formatName(String name) {
      return name.split(' ')
          .map((word) => word.isNotEmpty 
              ? '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}'
              : '')
          .join(' ');
    }
    
    return '${formatName(firstName)} ${formatName(lastName)}'.trim();
  }
}

// lib/features/profile/presentation/widgets/profile_menu_item.dart
class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? titleColor;
  final Widget? trailing;

  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.onTap,
    this.iconColor,
    this.titleColor,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  icon,
                  color: iconColor,
                ),
                const SizedBox(width: 20),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    color: titleColor,
                  ),
                ),
              ],
            ),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}

// lib/features/profile/presentation/widgets/profile_settings_section.dart
class ProfileSettingsSection extends StatelessWidget {
  final bool twoFactorEnabled;
  final bool biometricEnabled;
  final ValueChanged<bool>? onTwoFactorChanged;
  final ValueChanged<bool>? onBiometricChanged;
  final VoidCallback? onChangePasswordTap;
  final VoidCallback? onNotificationSettingsTap;
  final VoidCallback? onAboutTap;

  const ProfileSettingsSection({
    super.key,
    required this.twoFactorEnabled,
    required this.biometricEnabled,
    this.onTwoFactorChanged,
    this.onBiometricChanged,
    this.onChangePasswordTap,
    this.onNotificationSettingsTap,
    this.onAboutTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          ProfileMenuItem(
            icon: Icons.lock_reset_outlined,
            title: 'Change Password',
            onTap: onChangePasswordTap,
          ),
          
          ProfileMenuItem(
            icon: Icons.phonelink_lock_outlined,
            title: 'Two-Factor Authentication',
            trailing: Transform.scale(
              scale: 0.8,
              child: Switch(
                value: twoFactorEnabled,
                onChanged: onTwoFactorChanged,
                activeColor: tPrimaryColor,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              ),
            ),
          ),
          
          ProfileMenuItem(
            icon: Icons.fingerprint,
            title: 'Biometric Pass',
            trailing: Transform.scale(
              scale: 0.8,
              child: Switch(
                value: biometricEnabled,
                onChanged: onBiometricChanged,
                activeColor: tPrimaryColor,
                inactiveThumbColor: Colors.grey,
                inactiveTrackColor: Colors.grey[300],
              ),
            ),
          ),
          
          ProfileMenuItem(
            icon: Icons.notifications_active_outlined,
            title: 'Notifications Settings',
            onTap: onNotificationSettingsTap,
          ),
          
          ProfileMenuItem(
            icon: Icons.phone_android,
            title: 'About',
            onTap: onAboutTap,
          ),
        ],
      ),
    );
  }
}

// lib/features/profile/presentation/widgets/profile_avatar.dart
class ProfileAvatar extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String? imageUrl;
  final double size;
  final VoidCallback? onTap;

  const ProfileAvatar({
    super.key,
    required this.firstName,
    required this.lastName,
    this.imageUrl,
    this.size = 70.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          shape: BoxShape.circle,
          image: imageUrl != null
              ? DecorationImage(
                  image: NetworkImage(imageUrl!),
                  fit: BoxFit.cover,
                )
              : null,
        ),
        child: imageUrl == null
            ? Center(
                child: Text(
                  _getInitials(),
                  style: TextStyle(
                    fontFamily: tSecondaryFont,
                    fontWeight: FontWeight.w600,
                    fontSize: size * 0.25,
                  ),
                ),
              )
            : null,
      ),
    );
  }

  String _getInitials() {
    final firstInitial = firstName.isNotEmpty ? firstName[0].toUpperCase() : '';
    final lastInitial = lastName.isNotEmpty ? lastName[0].toUpperCase() : '';
    return '$firstInitial$lastInitial';
  }
}