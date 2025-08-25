import 'package:flutter/material.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../auth/presentation/widgets/auth_button.dart';
import '../../../locale/presentation/widgets/app_localization.dart';
import 'widgets/company_selection_bottomsheet.dart';

class CompanySelectionPage extends StatefulWidget {
  final VoidCallback? onBackPressed;

  const CompanySelectionPage({super.key, this.onBackPressed});

  @override
  State<CompanySelectionPage> createState() => _CompanySelectionPageState();
}

class _CompanySelectionPageState extends State<CompanySelectionPage>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _fadeController, curve: Curves.easeOut));

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          Text(
            'Choose Company to Manage',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveHelper.adaptive(
                context,
                mobile: 28,
                tablet: 32,
                desktop: 36,
              ),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          const SizedBox(height: 20),

          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: Colors.grey.shade200,
            ),
            onPressed: () {
              CompanySelectionBottomSheet.display(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: ResponsiveHelper.adaptive(
                      context,
                      mobile: 25,
                      tablet: 30,
                      desktop: 35,
                    ),
                    color: Colors.black.withOpacity(0.6),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Select Company',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Choose which company you want to manage',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black.withOpacity(0.7),
                            fontSize: ResponsiveHelper.adaptive<double>(
                              context,
                              mobile: 12,
                              tablet: 16,
                              desktop: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Image.asset(
            'assets/images/choose_company_vector.png',
            height: ResponsiveHelper.adaptive<double>(
              context,
              mobile: 300,
              tablet: 250,
              desktop: 300,
            ),
            width: ResponsiveHelper.adaptive<double>(
              context,
              mobile: 300,
              tablet: 250,
              desktop: 300,
            ),
            fit: BoxFit.contain,
          ),

          AuthButton(
            text: 'Back to sign in',
            onPressed: widget.onBackPressed,
            type: AuthButtonType.secondary,
          ),

          // SizedBox(
          //   width: double.infinity,
          //   child: OutlinedButton(
          //     onPressed: widget.onBackPressed,
          //     style: OutlinedButton.styleFrom(
          //       side: const BorderSide(color: primaryColor),
          //       padding: const EdgeInsets.symmetric(vertical: 4),
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(14),
          //       ),
          //     ),
          //     child: Text(
          //       'Back to sign in',
          //       style: TextStyle(
          //         fontSize: ResponsiveHelper.adaptive<double>(
          //           context,
          //           mobile: 16,
          //           tablet: 18,
          //           desktop: 20,
          //         ),
          //         fontWeight: FontWeight.w600,
          //         color: primaryColor,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
