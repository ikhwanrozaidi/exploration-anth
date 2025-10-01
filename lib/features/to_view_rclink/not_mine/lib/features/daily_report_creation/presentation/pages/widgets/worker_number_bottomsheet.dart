import 'package:flutter/material.dart';

import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/info_bottomsheet.dart';

class WorkerNumberBottomsheet {
  static Future<bool?> show(BuildContext context, String nextTab) {
    return showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (context) => InfoBottomsheet(
        title: "Worker",
        blurry: true,
        widgetUI: _buildContent(context, nextTab),
      ),
    );
  }

  static Future<bool?> showWithInfoBottomsheet(
    BuildContext context,
    String nextTab,
  ) {
    return show(context, nextTab);
  }

  static Widget _buildContent(BuildContext context, String nextTab) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Worker",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 10),

        Text(
          "SSUPP",
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        const SizedBox(height: 30),

        Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(false),
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  disabledBackgroundColor: Colors.grey[300],
                  padding: ResponsiveHelper.padding(
                    context,
                    vertical: 10,
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: ResponsiveHelper.borderRadius(
                      context,
                      all: 10,
                    ),
                  ),
                  side: BorderSide(color: primaryColor, width: 1),
                  elevation: ResponsiveHelper.adaptive(
                    context,
                    mobile: 1,
                    tablet: 2,
                    desktop: 3,
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: ResponsiveHelper.spacing(context, 14),
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 10),

            Expanded(
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  disabledBackgroundColor: Colors.grey[300],
                  padding: ResponsiveHelper.padding(
                    context,
                    vertical: 10,
                    horizontal: 20,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: ResponsiveHelper.borderRadius(
                      context,
                      all: 10,
                    ),
                  ),
                  elevation: ResponsiveHelper.adaptive(
                    context,
                    mobile: 1,
                    tablet: 2,
                    desktop: 3,
                  ),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: ResponsiveHelper.spacing(context, 14),
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
