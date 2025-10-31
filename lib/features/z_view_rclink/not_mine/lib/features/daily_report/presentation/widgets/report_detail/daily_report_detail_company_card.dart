import 'package:flutter/material.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';

/// Company details card for daily report detail page
///
/// Displays contractor enterprise information including:
/// - Reports count
/// - Users count
/// - CIDB status
/// - "View all reports" action button
class DailyReportDetailCompanyCard extends StatelessWidget {
  final VoidCallback? onViewAllReports;

  const DailyReportDetailCompanyCard({
    Key? key,
    this.onViewAllReports,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CONTRACTOR ENTERPRISE',
            style: TextStyle(
              fontSize: ResponsiveHelper.fontSize(context, base: 14),
              fontWeight: FontWeight.w600,
            ),
          ),
          const Divider(height: 30, thickness: 0.5, color: Colors.grey),

          // Stats Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Reports Count
              Column(
                children: [
                  Text(
                    '1',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(
                        context,
                        base: 14,
                      ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text('Report'),
                ],
              ),
              Container(color: Colors.grey, height: 30, width: 1),

              // Users Count
              Column(
                children: [
                  Text(
                    '3',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(
                        context,
                        base: 14,
                      ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text('Users'),
                ],
              ),
              Container(color: Colors.grey, height: 30, width: 1),

              // CIDB Status
              Column(
                children: [
                  Text(
                    'No Record',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(
                        context,
                        base: 14,
                      ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text('CIDB'),
                ],
              ),
            ],
          ),

          // View All Reports Button
          Container(
            margin: const EdgeInsets.only(top: 20),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onViewAllReports,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: ResponsiveHelper.padding(
                  context,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: Text(
                'View all reports',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ResponsiveHelper.fontSize(
                    context,
                    base: 14,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
