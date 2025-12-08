import 'package:flutter/material.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/widgets/template_page.dart';
import '../../../daily_report/domain/entities/daily_report.dart';
import '../../../daily_report/presentation/widgets/report_detail/daily_report_detail_quantity_card.dart';

class QuantityListFromWarning extends StatelessWidget {
  final DailyReport report;

  const QuantityListFromWarning({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text(
              'Quantity Report',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: ResponsiveHelper.fontSize(context, base: 16),
              ),
            ),
            Text(
              'Preview of quantities',
              style: TextStyle(
                fontSize: ResponsiveHelper.fontSize(context, base: 14),
              ),
            ),

            SizedBox(height: 40),

            if (report.reportQuantities != null &&
                report.reportQuantities!.isNotEmpty)
              ...report.reportQuantities!.map((reportQuantity) {
                return DailyReportDetailQuantityCard(
                  reportQuantity: reportQuantity,
                );
              }),
          ],
        ),
      ),
    );
  }
}
