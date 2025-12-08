import 'package:flutter/material.dart';

import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/widgets/info_bottomsheet.dart';
import '../traffic_management_plan_tips.dart';
import 'work_specification_tips.dart';

void showTipsSelection({
  required BuildContext context,
  required Function(String) onTipSelected,
}) {
  showInfoBottomsheet(
    context: context,
    title: "Tips",
    blurry: false,
    widgetUI: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => TrafficManagementPlanTips(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            'assets/images/tips_traffic_management.png',
                            fit: BoxFit.contain,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Traffic Management Plan',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 13,
                            ),
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(width: 15),

              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WorkSpecificationTips(),
                      ),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300, width: 1),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            'assets/images/tips_work_specification.png',
                            fit: BoxFit.contain,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Work Specification',
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 13,
                            ),
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                            height: 1.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),
      ],
    ),
  );
}
