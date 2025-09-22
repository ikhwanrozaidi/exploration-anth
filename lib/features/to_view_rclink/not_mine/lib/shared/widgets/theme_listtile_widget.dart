import 'package:flutter/material.dart';

import '../utils/responsive_helper.dart';

class ThemeListTileWidget extends StatelessWidget {
  final String title;
  final String titleDetails;
  final IconData icon;
  final VoidCallback? onTap;
  final Color? primaryColor;
  final bool focus;
  final IconData? trailingIcon;
  final bool isChevron;
  final bool isInverseBold;

  const ThemeListTileWidget({
    Key? key,
    required this.title,
    required this.titleDetails,
    required this.icon,
    this.onTap,
    this.primaryColor,
    this.focus = false,
    this.trailingIcon,
    this.isChevron = true,
    this.isInverseBold = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Color defaultPrimaryColor =
        primaryColor ?? Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 214, 226, 255),
                  shape: BoxShape.circle,
                ),
                child: Center(child: Icon(icon, color: defaultPrimaryColor)),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title - only show if not empty
                  if (title.isNotEmpty)
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 13),
                        fontWeight: isInverseBold
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  // Title Detail - red color if focus is true
                  Text(
                    titleDetails,
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 12),
                      fontWeight: isInverseBold
                          ? FontWeight.normal
                          : FontWeight.w600,
                      color: focus ? Colors.red : null,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (isChevron)
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: Color.fromARGB(255, 214, 226, 255),
              ),
              // Chevron icon
              child: Icon(
                trailingIcon == null
                    ? Icons.chevron_right_rounded
                    : trailingIcon,
                color: defaultPrimaryColor,
              ),
            ),
        ],
      ),
    );
  }
}
