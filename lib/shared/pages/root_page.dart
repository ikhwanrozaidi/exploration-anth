import 'package:flutter/material.dart';
import 'package:gatepay_app/features/dashboard/presentation/pages/dashboard_page.dart';
import 'package:gatepay_app/features/inbox/presentation/pages/inbox_page.dart';
import 'package:gatepay_app/features/profile/presentation/pages/profile_page.dart';
import 'package:gatepay_app/shared/utils/theme.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core/config/flavor_config.dart';
import '../../features/locale/presentation/widgets/app_localization.dart';
import '../../features/transactionboard/presentation/pages/transactionboard_page.dart';

// icons
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/bx.dart';
import 'package:iconify_flutter/icons/octicon.dart';

import 'home_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedBottomMenuIndex = 0;
  bool showBottomBar = true;
  late PageController _pageController;
  late AnimationController _animationController;

  List<Widget> pages = <Widget>[
    const DashboardPage(),
    const TransactionBoardPage(),
    const InboxPage(),
    const ProfilePage(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedBottomMenuIndex);
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void onTap(int value) {
    if (!mounted) return;

    setState(() {
      selectedBottomMenuIndex = value;
    });

    // Animate to the selected page with smooth transition
    _pageController.animateToPage(
      value,
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
    );

    // Trigger animation for nav bar
    _animationController.forward().then((_) {
      _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    final flavorConfig = FlavorConfig.instance;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: scaffoldKey,
      backgroundColor: const Color(0xFFF8FAFC),
      body: Stack(
        children: [
          // PageView for smooth transitions between pages
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                selectedBottomMenuIndex = index;
              });
            },
            children: pages,
          ),

          if (showBottomBar)
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: _buildFloatingNavBar(width),
            ),
        ],
      ),
    );
  }

  Widget _buildFloatingNavBar(w) {
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: 1.0 + (_animationController.value * 0.05),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 80),
              height: w * 0.16,
              decoration: BoxDecoration(
                color: boldColor,
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 20 + (_animationController.value * 5),
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(index: 0, icon: Octicon.home_16, w: w),
                  _buildNavItem(index: 1, icon: Bx.money, w: w),
                  _buildNavItem(index: 2, icon: Octicon.inbox_16, w: w),
                  _buildNavItem(index: 3, icon: Bi.person_circle, w: w),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required String icon,
    required double w,
  }) {
    final isSelected = selectedBottomMenuIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
        width: w * 0.11,
        height: w * 0.11,
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(scale: animation, child: child);
          },
          child: Iconify(
            icon,
            key: ValueKey(isSelected),
            color: isSelected ? Colors.white : passiveColor,
            size: isSelected ? w * 0.065 : w * 0.06,
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          title: Text(
            localization.auth('logout'),
            style: GoogleFonts.inter(fontWeight: FontWeight.w600),
          ),
          content: Text(
            localization.auth('logoutConfirmation'),
            style: GoogleFonts.inter(),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                localization.shared('cancel'),
                style: GoogleFonts.inter(color: Colors.grey[600]),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil('/login', (route) => false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: boldColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                localization.auth('logout'),
                style: GoogleFonts.inter(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}
