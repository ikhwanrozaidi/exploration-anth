import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gatepay_app/shared/utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/icons/arcticons.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/wpf.dart';
import '../../../../lib/core/di/injection.dart';
import '../../../../lib/features/login/presentation/bloc/login_bloc.dart';
import '../../../../lib/features/login/presentation/bloc/login_event.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';

// Icon
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/lucide.dart';
import 'package:iconify_flutter/icons/radix_icons.dart';
import 'package:iconify_flutter/icons/akar_icons.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProfileBloc>()..add(const LoadUserSettings()),
      child: const ProfileView(),
    );
  }
}

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          'Log Out',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        content: Text(
          'Are you sure you want to log out?',
          style: GoogleFonts.poppins(),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              'Cancel',
              style: GoogleFonts.poppins(color: Colors.grey[600]),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(dialogContext).pop();
              context.read<LoginBloc>().add(const LoginLogoutRequested());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              'Log Out',
              style: GoogleFonts.poppins(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Profile',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print('Profile button pressed');
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 2,
                      shadowColor: Colors.black26,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Ikhwan Rozaidi',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            shape: BoxShape.circle,
                          ),
                          child: Iconify(
                            RadixIcons.person,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (state is ProfileError) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 64,
                            color: Colors.red[300],
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 32),
                            child: Text(
                              state.message,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          const SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              context.read<ProfileBloc>().add(
                                const LoadUserSettings(),
                              );
                            },
                            child: const Text('Retry'),
                          ),
                        ],
                      ),
                    );
                  }

                  if (state is ProfileLoaded) {
                    final userSettings = state.userSettings;

                    return RefreshIndicator(
                      onRefresh: () async {
                        context.read<ProfileBloc>().add(
                          const RefreshUserSettings(),
                        );
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 25,
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 80,
                                        height: 80,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: backgroundColor,
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(
                                          Icons.person_outline,
                                          size: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(width: 25),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            userSettings.fullName,
                                            style: GoogleFonts.poppins(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            userSettings.fullName,
                                            style: GoogleFonts.poppins(
                                              fontSize: 12,
                                              color: Colors.black,
                                            ),
                                          ),

                                          SizedBox(height: 10),
                                          TextButton(
                                            onPressed: () {},
                                            style: TextButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                255,
                                                7,
                                                246,
                                                226,
                                              ),
                                              foregroundColor: Colors.black,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                    horizontal: 12,
                                                    vertical: 6,
                                                  ),
                                              minimumSize: Size.zero,
                                              tapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                              ),
                                              elevation: 2,
                                              shadowColor: Colors.black26,
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Icon(
                                                  Icons.person_outline,
                                                  size: 15,
                                                  color: Colors.black,
                                                ),
                                                const SizedBox(width: 6),
                                                Text(
                                                  'Verified',
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: backgroundColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.mode_edit_outlined,
                                      size: 20,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Account details',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                            ),

                            SizedBox(height: 16),

                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 25,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  _buildAccountDetailsTile(
                                    AkarIcons.person,
                                    "Personal Info",
                                    () {},
                                  ),
                                  _buildAccountDetailsTile(
                                    MaterialSymbols.password_rounded,
                                    "Change Password",
                                    () {},
                                  ),
                                  _buildAccountDetailsTile(
                                    Arcticons.i_2fas_auth,
                                    "Two Factor Authentication",
                                    () {},
                                  ),
                                  _buildAccountDetailsTile(
                                    MaterialSymbols.fingerprint_outline,
                                    "Biometric Authentication",
                                    () {},
                                  ),
                                  _buildAccountDetailsTile(
                                    Ic.outline_notifications_active,
                                    "Notification Settings",
                                    () {},
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              color: backgroundColor,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Iconify(
                                              Lucide.activity,
                                              size: 20,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Text('About'),
                                        ],
                                      ),

                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 30),
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(
                                'Help and Support',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 13,
                                ),
                              ),
                            ),

                            SizedBox(height: 16),

                            Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 25,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Column(
                                children: [
                                  _buildAccountDetailsTile(
                                    Bx.support,
                                    "Contact Our Support",
                                    () {},
                                  ),
                                  _buildAccountDetailsTile(
                                    Wpf.faq,
                                    "FAQ",
                                    () {},
                                  ),

                                  // Add this to your logout button section
                                  InkWell(
                                    onTap: () => _showLogoutDialog(context),
                                    borderRadius: BorderRadius.circular(12),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 12,
                                        horizontal: 16,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                  color: Colors.red.shade50,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Iconify(
                                                  Ic.round_log_out,
                                                  size: 20,
                                                  color: Colors.red,
                                                ),
                                              ),
                                              SizedBox(width: 20),
                                              Text(
                                                'Log Out',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 16,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            size: 18,
                                            color: Colors.red,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(height: 100),

                            if (state.isFromCache) ...[
                              const SizedBox(height: 16),
                              Container(
                                width: double.infinity,
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: Colors.orange[100],
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                    color: Colors.orange[300]!,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.offline_pin,
                                      color: Colors.orange[700],
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        'Showing cached data. Pull to refresh when online.',
                                        style: TextStyle(
                                          color: Colors.orange[700],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  }

                  return const Center(child: Text('No data available'));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountDetailsTile(
    String icon,
    String title,
    VoidCallback onTap,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Iconify(icon, size: 20, color: Colors.black),
                ),
                SizedBox(width: 20),
                Text(title),
              ],
            ),

            Icon(Icons.arrow_forward_ios_rounded, size: 18),
          ],
        ),
        Divider(height: 40, thickness: 1, color: backgroundColor),
      ],
    );
  }
}
