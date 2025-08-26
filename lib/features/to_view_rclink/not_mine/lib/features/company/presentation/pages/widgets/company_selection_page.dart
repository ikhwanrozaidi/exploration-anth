import 'package:flutter/material.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';

class CompanySelectionContent extends StatelessWidget {
  final VoidCallback onBackPressed;
  final VoidCallback onSearchPressed;
  final Animation<double> fadeAnimation;

  const CompanySelectionContent({
    super.key,
    required this.onBackPressed,
    required this.onSearchPressed,
    required this.fadeAnimation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveHelper.padding(context, all: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Handle bar
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: EdgeInsets.only(
                bottom: ResponsiveHelper.spacing(context, 24),
              ),
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
              fontSize: ResponsiveHelper.fontSize(context, base: 24),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),

          SizedBox(height: ResponsiveHelper.spacing(context, 20)),

          // Search Button
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              backgroundColor: Colors.grey.shade200,
            ),
            onPressed: onSearchPressed,
            child: Padding(
              padding: ResponsiveHelper.padding(
                context,
                vertical: 15,
                horizontal: 25,
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    size: ResponsiveHelper.iconSize(context, base: 24),
                    color: Colors.black.withOpacity(0.6),
                  ),

                  SizedBox(width: ResponsiveHelper.spacing(context, 20)),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Select Company',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 16,
                            ),
                          ),
                        ),
                        Text(
                          'Choose which company you want to manage',
                          style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.black.withOpacity(0.7),
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 12,
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

          SizedBox(height: ResponsiveHelper.spacing(context, 20)),

          // Vector Image
          Container(
            margin: EdgeInsets.only(
              bottom: ResponsiveHelper.spacing(context, 50),
            ),
            child: FadeTransition(
              opacity: fadeAnimation,
              child: Image.asset(
                'assets/images/choose_company_vector.png',
                height: ResponsiveHelper.adaptive(
                  context,
                  mobile: 200,
                  tablet: 250,
                  desktop: 300,
                ),
                width: ResponsiveHelper.adaptive(
                  context,
                  mobile: 350,
                  tablet: 400,
                  desktop: 450,
                ),
                fit: BoxFit.contain,
              ),
            ),
          ),

          // Back Button
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: onBackPressed,
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: primaryColor),
                padding: ResponsiveHelper.padding(context, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                'Back to sign in',
                style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(context, base: 14),
                  fontWeight: FontWeight.w600,
                  color: primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
