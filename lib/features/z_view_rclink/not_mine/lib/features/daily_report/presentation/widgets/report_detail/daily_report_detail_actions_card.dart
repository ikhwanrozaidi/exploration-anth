import 'package:flutter/material.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/widgets/divider_config.dart';
import '../../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../../../shared/widgets/theme_listtile_widget.dart';
import '../../../domain/entities/daily_report.dart';
import '../../pages/widget/edit_page/equipment_edit_page.dart';
import '../../pages/widget/edit_page/quantity_edit_page.dart';
import '../../pages/widget/edit_page/route_edit_page.dart';
import '../../pages/widget/edit_page/worker_remark_edit_page.dart';

/// Actions card for daily report detail page
///
/// Displays "Others" section with action items:
/// - Edit Report (opens bottomsheet with 4 edit options)
///   - Route & Selection
///   - Quantity
///   - Worker & Remark
///   - Equipment
/// - Monthly Summary
/// - Update History
/// - Remove Program (delete action in red)
class DailyReportDetailActionsCard extends StatelessWidget {
  final DailyReport report;
  final VoidCallback? onMonthlySummary;
  final VoidCallback? onUpdateHistory;
  final VoidCallback? onRemoveProgram;

  const DailyReportDetailActionsCard({
    Key? key,
    required this.report,
    this.onMonthlySummary,
    this.onUpdateHistory,
    this.onRemoveProgram,
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
            'Others',
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
                // Edit Report
                ThemeListTileWidget(
                  title: 'Edit Report',
                  titleDetails: 'Quantity, section and others',
                  icon: Icons.edit_square,
                  isInverseBold: true,
                  onTap: () {
                    showFlexibleBottomsheet(
                      context: context,
                      title: 'Edit Report',
                      attributes: [
                        'Route & Selection',
                        'Quantity',
                        'Worker & Remark',
                        'Equipment',
                      ],
                      isRadio: false,
                      isNavigate: true,
                      onTap: (selectedOption) {
                        // Navigate to respective pages based on selection
                        switch (selectedOption) {
                          case 'Route & Selection':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RouteEditPage(
                                  report: report,
                                ),
                              ),
                            );
                            break;
                          case 'Quantity':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuantityEditPage(
                                  report: report,
                                ),
                              ),
                            );
                            break;
                          case 'Worker & Remark':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => WorkerRemarkEditPage(
                                  report: report,
                                ),
                              ),
                            );
                            break;
                          case 'Equipment':
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EquipmentEditPage(
                                  report: report,
                                ),
                              ),
                            );
                            break;
                        }
                      },
                    );
                  },
                ),
                dividerConfig(),

                // Monthly Summary
                ThemeListTileWidget(
                  title: 'Monthly Summary',
                  titleDetails: 'List of overall report',
                  icon: Icons.calendar_today_rounded,
                  isInverseBold: true,
                  onTap: onMonthlySummary,
                ),
                dividerConfig(),

                // Update History
                ThemeListTileWidget(
                  title: 'Update History',
                  titleDetails: 'List of overall report',
                  icon: Icons.history,
                  isInverseBold: true,
                  onTap: onUpdateHistory,
                ),
                dividerConfig(),

                // Remove Program
                GestureDetector(
                  onTap: onRemoveProgram,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.red.shade100,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.delete,
                                color: Colors.red.shade400,
                              ),
                            ),
                          ),
                          const SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Remove Program',
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 14,
                                  ),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red.shade400,
                                ),
                              ),
                              Text(
                                'Delete work program',
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 12,
                                  ),
                                  color: Colors.red.shade400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.red.shade100,
                        ),
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: Colors.red.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
