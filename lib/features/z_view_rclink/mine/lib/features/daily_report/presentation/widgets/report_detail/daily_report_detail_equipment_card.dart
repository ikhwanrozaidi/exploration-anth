import 'package:flutter/material.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/divider_config.dart';
import '../../../domain/entities/daily_report_equipment.dart';

/// Equipment card for daily report detail page
///
/// Displays list of equipment used in the report as chips in a wrap layout
class DailyReportDetailEquipmentCard extends StatelessWidget {
  final List<DailyReportEquipment> equipments;

  const DailyReportDetailEquipmentCard({
    Key? key,
    required this.equipments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Don't show card if no equipments
    if (equipments.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          colors: [
            Colors.white,
            Color.fromARGB(255, 238, 242, 254),
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Equipment',
            style: TextStyle(
              fontSize: ResponsiveHelper.fontSize(
                context,
                base: 14,
              ),
              fontWeight: FontWeight.w600,
            ),
          ),
          dividerConfig(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: Wrap(
              spacing: 8,
              runSpacing: 10,
              children: equipments.map((equipment) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: primaryColor,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    equipment.name,
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(
                        context,
                        base: 13,
                      ),
                      color: primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
