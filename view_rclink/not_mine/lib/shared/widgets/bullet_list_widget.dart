import 'package:flutter/material.dart';
import 'package:rclink_app/shared/utils/theme.dart';

import '../utils/responsive_helper.dart';

class BulletList extends StatelessWidget {
  final String title;
  final String? description;
  final List<String> items;
  final Color? backgroundColor;

  const BulletList({
    Key? key,
    required this.title,
    this.description,
    required this.items,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      decoration: BoxDecoration(
        color: backgroundColor ?? primaryShade,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: ResponsiveHelper.fontSize(context, base: 16),
              fontWeight: FontWeight.bold,
            ),
          ),

          if (description != null)
            Text(
              description ?? '',
              style: TextStyle(
                fontSize: ResponsiveHelper.fontSize(context, base: 13),
                fontWeight: FontWeight.w500,
              ),
            ),

          SizedBox(height: 15),

          ...items.asMap().entries.map((entry) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: entry.key == items.length - 1 ? 0 : 8,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '• ',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      entry.value,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 14),
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
