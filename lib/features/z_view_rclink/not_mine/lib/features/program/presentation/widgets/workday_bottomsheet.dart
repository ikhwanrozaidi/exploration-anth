import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/info_bottomsheet.dart';

/// Helper function to show workday detail bottomsheet
///
/// This function can be called from any page that needs to display workday details.
///
/// Usage:
/// ```dart
/// showWorkdayDetail(
///   context: context,
///   date: '2025-09-22T20:01:55.752Z',
///   scopeCode: 'code',
///   onViewReport: () {
///     // Handle view report action
///     print('View report clicked');
///   },
/// );
/// ```

void showWorkdayDetail({
  required BuildContext context,
  required String date,
  required String scopeCode,
  VoidCallback? onViewReport,
}) {
  showInfoBottomsheet(
    context: context,
    blurry: true,
    widgetUI: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          DateFormat('d MMMM').format(DateTime.parse(date).toLocal()),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        SizedBox(height: ResponsiveHelper.spacing(context, 15)),

        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              SizedBox(
                height: ResponsiveHelper.getHeight(context, 0.21),
                child: Stack(
                  children: [
                    // Image placeholder
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black.withOpacity(0.7),
                              ],
                            ),
                          ),
                          child: Container(
                            color: Colors.grey.shade300,
                            child: Icon(
                              Icons.image_not_supported,
                              size: ResponsiveHelper.iconSize(
                                context,
                                base: 20,
                              ),
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Overlay info
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 5),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  scopeCode,
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 12,
                                    ),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(right: 5),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Text(
                                  DateFormat(
                                    'hh:mma',
                                  ).format(DateTime.parse(date)),
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 12,
                                    ),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: onViewReport,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    disabledBackgroundColor: Colors.grey[300],
                    padding: ResponsiveHelper.padding(
                      context,
                      vertical: 10,
                      horizontal: 20,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: ResponsiveHelper.borderRadius(
                        context,
                        all: 10,
                      ),
                    ),
                    elevation: ResponsiveHelper.adaptive(
                      context,
                      mobile: 1,
                      tablet: 2,
                      desktop: 3,
                    ),
                  ),
                  child: Text(
                    'View Report',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.spacing(context, 13),
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: ResponsiveHelper.spacing(context, 20)),
      ],
    ),
  );
}
