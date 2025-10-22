import 'package:flutter/material.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';

/// Header widget for the report creation page
/// Contains back button and title
class ReportCreationHeader extends StatelessWidget {
  const ReportCreationHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(5),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: primaryColor,
                      size: 25,
                    ),
                  ),
                  SizedBox(width: ResponsiveHelper.spacing(context, 10)),
                  const Text(
                    'Add Daily Report',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
