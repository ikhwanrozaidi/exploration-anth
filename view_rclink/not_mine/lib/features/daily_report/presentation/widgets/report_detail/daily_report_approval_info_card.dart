import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/daily_report.dart';

class DailyReportApprovalInfoCard extends StatelessWidget {
  final DailyReport report;

  const DailyReportApprovalInfoCard({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    // Only show if report has approval data
    if (report.approvedAt == null) {
      return const SizedBox.shrink();
    }

    final approvedAt = report.approvedAt!;
    final formattedDate = DateFormat(
      'MMM dd, yyyy \'at\' hh:mm a',
    ).format(approvedAt);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.green.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.check_circle, color: Colors.green.shade700, size: 24),
              const SizedBox(width: 8),
              Text(
                'Approved',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.green.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            formattedDate,
            style: TextStyle(fontSize: 13, color: Colors.grey.shade600),
          ),
          if (report.rejectionReason != null &&
              report.rejectionReason!.isNotEmpty) ...[
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 8),
            Text(
              'Review Comment',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              report.rejectionReason!,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
          ],
        ],
      ),
    );
  }
}
