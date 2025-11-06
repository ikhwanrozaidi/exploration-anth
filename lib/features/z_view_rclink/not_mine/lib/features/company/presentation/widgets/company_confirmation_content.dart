import 'package:flutter/material.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../domain/entities/company.dart';

class CompanyConfirmationContent extends StatelessWidget {
  final Company selectedCompany;
  final bool isRoleLoading;
  final VoidCallback onSignIn;
  final VoidCallback onBackToSelection;

  const CompanyConfirmationContent({
    super.key,
    required this.selectedCompany,
    required this.isRoleLoading,
    required this.onSignIn,
    required this.onBackToSelection,
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
                bottom: ResponsiveHelper.spacing(context, 15),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          Row(
            children: [
              GestureDetector(
                onTap: onBackToSelection,
                child: Container(
                  padding: ResponsiveHelper.padding(context, all: 12),
                  decoration: BoxDecoration(
                    color: primaryShade,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: ResponsiveHelper.iconSize(context, base: 15),
                    color: primaryColor,
                  ),
                ),
              ),
              SizedBox(width: ResponsiveHelper.adaptive(context, mobile: 15)),

              Text(
                'You\'re signing in as',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(context, base: 16),
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          SizedBox(height: ResponsiveHelper.spacing(context, 20)),

          // Company Card
          Container(
            width: double.infinity,
            padding: ResponsiveHelper.padding(context, all: 20),
            decoration: BoxDecoration(
              color: primaryShade,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey[200]!),
            ),
            child: Row(
              children: [
                // Company Avatar
                Container(
                  width: ResponsiveHelper.adaptive(
                    context,
                    mobile: 50,
                    tablet: 60,
                    desktop: 70,
                  ),
                  height: ResponsiveHelper.adaptive(
                    context,
                    mobile: 50,
                    tablet: 60,
                    desktop: 70,
                  ),
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      selectedCompany.name.isNotEmpty
                          ? selectedCompany.name.substring(0, 2).toUpperCase()
                          : 'RC',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ResponsiveHelper.fontSize(context, base: 15),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                SizedBox(width: ResponsiveHelper.spacing(context, 16)),

                // Company Details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedCompany.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 15,
                          ),
                          color: Colors.black,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (selectedCompany.regNo.isNotEmpty) ...[
                        SizedBox(height: ResponsiveHelper.spacing(context, 4)),
                        Text(
                          selectedCompany.regNo,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 14,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: ResponsiveHelper.spacing(context, 40)),

          // Sign in Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: isRoleLoading ? null : onSignIn,
              style: ElevatedButton.styleFrom(
                backgroundColor: isRoleLoading
                    ? Colors.grey[400]
                    : primaryColor,
                padding: ResponsiveHelper.padding(context, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 2,
              ),
              child: isRoleLoading
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(width: ResponsiveHelper.spacing(context, 8)),
                        Text(
                          'Setting up workspace...',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 14,
                            ),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      'Sign in to RCLink',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ResponsiveHelper.fontSize(context, base: 14),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
