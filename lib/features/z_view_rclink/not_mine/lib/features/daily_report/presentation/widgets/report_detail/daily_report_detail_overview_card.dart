import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/divider_config.dart';
import '../../../../../shared/widgets/theme_listtile_widget.dart';
import '../../../domain/entities/daily_report.dart';

/// Overview card for daily report detail page
///
/// Displays report overview information including:
/// - Work scope code and name
/// - Date created
/// - Contractor information
/// - Reporter information
class DailyReportDetailOverviewCard extends StatelessWidget {
  final DailyReport report;

  const DailyReportDetailOverviewCard({Key? key, required this.report})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [Colors.white, Color.fromARGB(255, 238, 242, 254)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Work Scope Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      // Work Scope Code Badge
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            report.workScope?.code ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      // Work Scope Name
                      Expanded(
                        child: Text(
                          report.workScope?.name.toUpperCase() ?? '',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 14,
                            ),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          dividerConfig(),

          // Details Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                // Date
                ThemeListTileWidget(
                  title: 'Date',
                  titleDetails: DateFormat('d MMM yyyy hh:mma').format(
                    DateTime.parse(report.createdAt.toString()).toLocal(),
                  ),
                  icon: Icons.calendar_month,
                ),

                dividerConfig(),

                // Contractor
                ThemeListTileWidget(
                  title: 'Contractor',
                  titleDetails:
                      report.contractRelationID?.toString() ??
                      report.company?.name ??
                      'Unknown',
                  icon: Icons.person,
                  isChevron: false,
                ),

                dividerConfig(),

                // Reporter
                ThemeListTileWidget(
                  title: 'Reporter',
                  titleDetails: report.createdBy?.fullName ?? 'Unknown',
                  icon: Icons.person_pin,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
