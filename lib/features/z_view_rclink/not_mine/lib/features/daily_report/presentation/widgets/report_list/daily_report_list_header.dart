import 'package:flutter/material.dart';

/// Header widget for the daily report list page
///
/// Displays "All Reports" title with a count badge showing total number of reports
class DailyReportListHeader extends StatelessWidget {
  final int reportCount;

  const DailyReportListHeader({
    Key? key,
    required this.reportCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30.0,
        left: 30.0,
      ),
      child: Row(
        children: [
          const Text(
            'All Reports',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
            decoration: BoxDecoration(
              color: Colors.amber.withOpacity(0.2),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Text(
              reportCount.toString(),
              style: const TextStyle(
                color: Colors.amber,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
