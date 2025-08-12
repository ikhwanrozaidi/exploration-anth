import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/utils/build_loading_indicator.dart';
import '../../../../shared/utils/theme.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';
import 'widgets/profile_header.dart';

class ProfilePage extends StatelessWidget {
  final String? title;
  
  const ProfilePage({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileBloc>()..add(const LoadUserProfile()),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is ProfileLoggedOut) {
            // Navigate to login page
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/login', // Replace with your login route
              (Route<dynamic> route) => false,
            );
          } else if (state is ProfileError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is ProfileLoaded) {
            return _buildLoadedContent(context, state);
          } else if (state is ProfileLoading) {
            return Center(
              child: buildLoadingIndicator(
                blur: 0,
                isCentered: true,
              ),
            );
          } else if (state is ProfileError) {
            return _buildErrorContent(context, state.message);
          } else {
            return _buildErrorContent(context, 'Something went wrong');
          }
        },
      ),
    );
  }

  Widget _buildLoadedContent(BuildContext context, ProfileLoaded state) {
    final w = MediaQuery.of(context).size.width;
    
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            // Header
            ProfileHeader(
              userData: state.userData,
              onEditPressed: () {
                // TODO: Navigate to edit profile page
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Edit profile coming soon')),
                );
              },
            ),
            
            const SizedBox(height: 20),
            Divider(color: Colors.grey.shade300),
            const SizedBox(height: 40),
            
            // Verification Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                decoration: BoxDecoration(
                  color: tPrimaryColorShade2,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Get account verification now?',
                      style: GoogleFonts.poppins(
                        fontSize: w * 0.035,
                        color: tPrimaryColorShade3,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Navigate to verification page
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Verification coming soon')),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: tPrimaryColorShade3,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 15,
                        ),
                        minimumSize: const Size(64, 30),
                        visualDensity: VisualDensity.compact,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: const Text(
                        'Verify',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Settings Section
            ProfileSettingsSection(
              twoFactorEnabled: state.twoFactorEnabled,
              biometricEnabled: state.biometricEnabled,
              onTwoFactorChanged: (value) {
                context.read<ProfileBloc>().add(ToggleTwoFactorAuth(value));
              },
              onBiometricChanged: (value) {
                context.read<ProfileBloc>().add(ToggleBiometricAuth(value));
              },
              onChangePasswordTap: () {
                // TODO: Navigate to change password page
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Change password coming soon')),
                );
              },
              onNotificationSettingsTap: () {
                // TODO: Navigate to notification settings page
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Notification settings coming soon')),
                );
              },
              onAboutTap: () {
                // TODO: Navigate to about page
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('About page coming soon')),
                );
              },
            ),
            
            const SizedBox(height: 20),
            Divider(color: Colors.grey.shade300),
            const SizedBox(height: 40),
            
            // Support and Logout Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  ProfileMenuItem(
                    icon: Icons.headset_mic_outlined,
                    title: 'Contact Our Agent',
                    onTap: () {
                      // TODO: Navigate to contact support page
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Contact support coming soon')),
                      );
                    },
                  ),
                  
                  ProfileMenuItem(
                    icon: Icons.power_settings_new,
                    title: 'Log Out',
                    iconColor: Colors.red,
                    titleColor: Colors.red,
                    onTap: () {
                      _showLogoutDialog(context);
                    },
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 40),
            const Text('Powered by BerryPay'),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorContent(BuildContext context, String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 80,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 20),
            Text(
              'Oops! Something went wrong',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                context.read<ProfileBloc>().add(const LoadUserProfile());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: tPrimaryColor,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
              ),
              child: const Text(
                'Try Again',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                context.read<ProfileBloc>().add(const LogoutUser());
              },
              child: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        );
      },
    );
  }
}