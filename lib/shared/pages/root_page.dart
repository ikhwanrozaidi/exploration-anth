import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/config/flavor_config.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';
import '../../features/inbox/presentation/pages/inbox_page.dart';
import '../../features/locale/presentation/bloc/locale_bloc.dart';
import '../../features/locale/presentation/bloc/locale_event.dart';
import '../../features/locale/presentation/bloc/locale_state.dart';
import '../../features/locale/presentation/widgets/app_localization.dart';
import '../../features/pay_boarding/presentation/pages/pay_boarding_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/transactionboard/presentation/pages/transactionboard_page.dart';
import 'home_page.dart';

/// RootPage manages the main app navigation and pages for authenticated users
/// Now using AppDrawer design structure
class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedBottomMenuIndex = 0;
  bool showBottomBar = true;

  // Define your main app pages here (same as AppDrawer structure)
  List<Widget> pages = <Widget>[
    const DashboardPage(), // Dashboard/Home content
    const TransactionboardPage(), // Transaction page (similar to TransactionboardPage)
    const PayBoardingPage(), // Payment page (similar to PayBoardingPage)
    const InboxPage(), // Inbox page
    const ProfilePage(), // Profile page
  ];

  // Define colors (you can move these to a theme file later)
  static const Color tPrimaryColor = Color(0xFF1976D2); // Blue
  static const Color tPrimaryColorShade1 = Color(0xFF42A5F5);
  static const Color tPrimaryColorShade3 = Color(0xFF0D47A1);

  void onTap(int value) {
    if (!mounted) return;

    if (value == 2) {
      // Special handling for Pay button - navigate to payment page
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const PayBoardingPage(),
      ));
    } else {
      setState(() {
        selectedBottomMenuIndex = value;
      });
    }
  }

  Color getIconColor(int index) {
    return selectedBottomMenuIndex == index
        ? tPrimaryColor
        : tPrimaryColorShade1.withOpacity(0.3);
  }

  @override
  Widget build(BuildContext context) {
    final flavorConfig = FlavorConfig.instance;

    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: scaffoldKey,
      // appBar: AppBar(
      //   title: Text(flavorConfig.appTitle),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   foregroundColor: Colors.black,
      //   elevation: 0,
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
      body: pages[selectedBottomMenuIndex],
      bottomNavigationBar: showBottomBar
          ? BottomAppBar(
              color: Colors.white,
              elevation: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Home/Dashboard
                  IconButton(
                    icon: Icon(
                      selectedBottomMenuIndex == 0
                          ? Icons.grid_view_rounded
                          : Icons.grid_view,
                      color: getIconColor(0),
                    ),
                    onPressed: () => onTap(0),
                  ),
                  // Transactions
                  IconButton(
                    icon: Icon(
                      selectedBottomMenuIndex == 1
                          ? Icons.donut_small
                          : Icons.donut_small_outlined,
                      color: getIconColor(1),
                    ),
                    onPressed: () => onTap(1),
                  ),
                  // Pay Button (Special styling)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColorShade3,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () => onTap(2),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.payment, color: Colors.white),
                        const SizedBox(width: 5),
                        Text(
                          'Pay',
                          style: GoogleFonts.inter(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Inbox
                  IconButton(
                    icon: Icon(
                      selectedBottomMenuIndex == 3
                          ? Icons.inbox
                          : Icons.inbox_outlined,
                      color: getIconColor(3),
                    ),
                    onPressed: () => onTap(3),
                  ),
                  // Profile
                  IconButton(
                    icon: Icon(
                      selectedBottomMenuIndex == 4
                          ? Icons.person
                          : Icons.person_outlined,
                      color: getIconColor(4),
                    ),
                    onPressed: () => onTap(4),
                  ),
                ],
              ),
            )
          : null,
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
                // TODO: Implement actual logout
                // Navigate back to login or onboarding
                Navigator.of(context).pushNamedAndRemoveUntil(
                  '/login',
                  (route) => false,
                );
              },
              child: Text(localization.auth('logout')),
            ),
          ],
        );
      },
    );
  }
}