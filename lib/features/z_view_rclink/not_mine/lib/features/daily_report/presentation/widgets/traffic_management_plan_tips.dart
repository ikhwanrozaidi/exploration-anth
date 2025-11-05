import 'package:flutter/material.dart';

import '../../../../shared/widgets/template_page.dart';

class TrafficManagementPlanTips extends StatelessWidget {
  const TrafficManagementPlanTips({super.key});

  @override
  Widget build(BuildContext context) {
    return TemplatePage(
      pageTitle: 'Traffic Management Plan',
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/traffic_management_plan_tips.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
