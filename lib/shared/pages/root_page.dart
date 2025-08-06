import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/config/flavor_config.dart';
import '../../features/locale/presentation/bloc/locale_bloc.dart';
import '../../features/locale/presentation/bloc/locale_event.dart';
import '../../features/locale/presentation/bloc/locale_state.dart';
import '../../features/locale/presentation/widgets/app_localization.dart';
import 'home_page.dart';

/// RootPage manages the main app navigation and pages for authenticated users
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _selectedIndex = 0;

  // Define your main app pages here
  static const List<Widget> _pages = <Widget>[
    HomePage(), // Dashboard/Home content
    _ProfilePage(), // Profile page
    _SettingsPage(), // Settings page
  ];

  // Define navigation items
  static const List<_NavigationItem> _navigationItems = [
    _NavigationItem(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      label: 'Home',
    ),
    _NavigationItem(
      icon: Icons.person_outline,
      selectedIcon: Icons.person,
      label: 'Profile',
    ),
    _NavigationItem(
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings,
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final flavorConfig = FlavorConfig.instance;

    return Scaffold(
      appBar: AppBar(
        title: Text(flavorConfig.appTitle),
        centerTitle: true,
        actions: [
          // Language selector
          BlocBuilder<LocaleBloc, LocaleState>(
            builder: (context, state) {
              return PopupMenuButton<Locale>(
                icon: const Icon(Icons.language),
                onSelected: (Locale locale) {
                  context.read<LocaleBloc>().add(ChangeLocale(locale));
                },
                itemBuilder: (BuildContext context) {
                  return LocaleState.supportedLocales.map((Locale locale) {
                    return PopupMenuItem<Locale>(
                      value: locale,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            LocaleState.languageFlags[locale.languageCode] ??
                                '🇺🇸',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            LocaleState.languageNames[locale.languageCode] ??
                                'English',
                            style: const TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    );
                  }).toList();
                },
              );
            },
          ),

          // Logout button
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _showLogoutDialog(context),
          ),
        ],
      ),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: _navigationItems.map((item) {
          return NavigationDestination(
            icon: Icon(item.icon),
            selectedIcon: Icon(item.selectedIcon),
            label: item.label,
          );
        }).toList(),
      ),
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

// Helper class for navigation items
class _NavigationItem {
  final IconData icon;
  final IconData selectedIcon;
  final String label;

  const _NavigationItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
  });
}

// Sample pages - replace with your actual pages

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
          Text('Coming Soon...'),
        ],
      ),
    );
  }
}

class _SettingsPage extends StatelessWidget {
  const _SettingsPage();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text('Settings Page'),
          Text('Coming Soon...'),
        ],
      ),
    );
  }
}
