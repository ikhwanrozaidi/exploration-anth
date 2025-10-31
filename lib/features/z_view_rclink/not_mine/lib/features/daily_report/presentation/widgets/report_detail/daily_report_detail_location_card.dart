import 'package:flutter/material.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/widgets/divider_config.dart';
import '../../../../../shared/widgets/theme_listtile_widget.dart';
import '../../../domain/entities/daily_report.dart';

/// Location card for daily report detail page
///
/// Displays location information including:
/// - Road district, road number, and road name
/// - Section information
class DailyReportDetailLocationCard extends StatelessWidget {
  final DailyReport report;

  const DailyReportDetailLocationCard({
    Key? key,
    required this.report,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
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
          Text(
            'Location',
            style: TextStyle(
              fontSize: ResponsiveHelper.fontSize(context, base: 14),
              fontWeight: FontWeight.w600,
            ),
          ),

          dividerConfig(),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                // Road Information
                ThemeListTileWidget(
                  title: report.road?.districtName.toString() ?? '',
                  titleDetails:
                      '${report.road?.roadNo ?? ''} - ${report.road?.name ?? ''}',
                  icon: Icons.location_pin,
                  isChevron: false,
                ),

                dividerConfig(),

                // Section Information
                ThemeListTileWidget(
                  title: 'Section',
                  titleDetails: report.fromSection?.toString() ?? '',
                  icon: Icons.swap_calls,
                  isChevron: false,
                ),

                // TODO: Add Google Maps integration if needed
                // Commented out in original implementation
              ],
            ),
          ),
        ],
      ),
    );
  }
}
