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
  final String? initialTab;

  const RootPage({Key? key, this.initialTab}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  late int _selectedIndex;

  static const List<Widget> _pages = <Widget>[
    // HomePage(),
    DashboardPage(),
    ProgramPage(),
    _AddPage(),
    WarningPage(),
    ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();

    _selectedIndex = _getInitialTabIndex(widget.initialTab);
  }

  int _getInitialTabIndex(String? tab) {
    switch (tab) {
      case 'dashboard':
      case 'home':
        return 0;
      case 'programs':
        return 1;
      case 'warnings':
        return 3;
      case 'profile':
        return 4;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final flavorConfig = FlavorConfig.instance;

    return Scaffold(
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
