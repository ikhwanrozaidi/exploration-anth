import 'package:flutter/material.dart';
import 'package:rclink_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:rclink_app/features/profile/presentation/pages/profile_page.dart';
import 'package:rclink_app/features/program/presentation/pages/program_page.dart';
import 'package:rclink_app/features/warnings/presentation/pages/warning_page.dart';
import 'package:rclink_app/shared/utils/theme.dart';
import '../../core/config/flavor_config.dart';
import '../../features/locale/presentation/widgets/app_localization.dart';

/// RootPage manages the main app navigation and pages for authenticated users
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    // HomePage(),
    DashboardPage(),
    ProgramPage(),
    _AddPage(),
    WarningPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final flavorConfig = FlavorConfig.instance;

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(flavorConfig.appTitle),
      //   centerTitle: true,
      //   actions: [
      //     // Language selector
      //     BlocBuilder<LocaleBloc, LocaleState>(
      //       builder: (context, state) {
      //         return PopupMenuButton<Locale>(
      //           icon: const Icon(Icons.language),
      //           onSelected: (Locale locale) {
      //             context.read<LocaleBloc>().add(ChangeLocale(locale));
      //           },
      //           itemBuilder: (BuildContext context) {
      //             return LocaleState.supportedLocales.map((Locale locale) {
      //               return PopupMenuItem<Locale>(
      //                 value: locale,
      //                 child: Row(
      //                   mainAxisSize: MainAxisSize.min,
      //                   children: [
      //                     Text(
      //                       LocaleState.languageFlags[locale.languageCode] ??
      //                           '🇺🇸',
      //                       style: const TextStyle(fontSize: 16),
      //                     ),
      //                     const SizedBox(width: 8),
      //                     Text(
      //                       LocaleState.languageNames[locale.languageCode] ??
      //                           'English',
      //                       style: const TextStyle(fontSize: 14),
      //                     ),
      //                   ],
      //                 ),
      //               );
      //             }).toList();
      //           },
      //         );
      //       },
      //     ),

      //     // Logout button
      //     IconButton(
      //       icon: const Icon(Icons.logout),
      //       onPressed: () => _showLogoutDialog(context),
      //     ),
      //   ],
      // ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: _CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      floatingActionButton: Container(
        width: 70,
        height: 70,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 135, 167, 247), primaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: FloatingActionButton(
          onPressed: () {
            setState(() {
              _selectedIndex = 2;
            });
          },
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: const Icon(Icons.add, color: Colors.white, size: 40),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  void _showLogoutDialog(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(localization.auth('logout')),
          content: Text(localization.auth('logoutConfirmation')),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(localization.shared('cancel')),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // TODO: Add logout event when implemented
                // context.read<AuthBloc>().add(const LogoutRequested());
              },
              child: Text(localization.auth('logout')),
            ),
          ],
        );
      },
    );
  }
}

class _CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const _CustomBottomNavigationBar({
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 10),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _NavBarItem(
            imagePath: 'assets/images/icons/icon_home.png',
            selectedImagePath: 'assets/images/icons/icon_home_selected.png',
            label: 'Home',
            isSelected: selectedIndex == 0,
            onTap: () => onTap(0),
          ),
          _NavBarItem(
            imagePath: 'assets/images/icons/icon_program.png',
            selectedImagePath: 'assets/images/icons/icon_program_selected.png',
            label: 'Program',
            isSelected: selectedIndex == 1,
            onTap: () => onTap(1),
          ),
          const SizedBox(width: 30),
          _NavBarItem(
            imagePath: 'assets/images/icons/icon_warning.png',
            selectedImagePath: 'assets/images/icons/icon_warning_selected.png',
            label: 'Warning',
            isSelected: selectedIndex == 3,
            onTap: () => onTap(3),
          ),
          _NavBarItem(
            imagePath: 'assets/images/icons/icon_user.png',
            selectedImagePath: 'assets/images/icons/icon_user_selected.png',
            label: 'Profile',
            isSelected: selectedIndex == 4,
            onTap: () => onTap(4),
          ),
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String imagePath;
  final String selectedImagePath;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const _NavBarItem({
    required this.imagePath,
    required this.selectedImagePath,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              isSelected ? selectedImagePath : imagePath,
              width: 24,
              height: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? const Color(0xFF4A6CF7) : Colors.grey,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProgramPage extends StatelessWidget {
  const _ProgramPage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.list_alt, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('Program Page'),
          Text('Coming Soon...'),
        ],
      ),
    );
  }
}

class _AddPage extends StatelessWidget {
  const _AddPage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.update, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('Coming Soon...'),
        ],
      ),
    );
  }
}

class _WarningPage extends StatelessWidget {
  const _WarningPage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.warning, size: 64, color: Colors.orange),
          SizedBox(height: 16),
          Text('Warning Page'),
          Text('Safety alerts and warnings...'),
        ],
      ),
    );
  }
}

class _ProfilePage extends StatelessWidget {
  const _ProfilePage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.person, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('Profile Page'),
          Text('User profile and settings...'),
        ],
      ),
    );
  }
}
