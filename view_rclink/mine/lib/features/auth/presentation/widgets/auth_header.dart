import 'package:flutter/material.dart';
import '../../../../shared/utils/responsive_helper.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showDragIndicator;

  const AuthHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.showDragIndicator = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (showDragIndicator)
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: EdgeInsets.only(
                bottom: ResponsiveHelper.spacing(context, 24),
              ),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: ResponsiveHelper.adaptive(
              context,
              mobile: 28,
              tablet: 32,
              desktop: 36,
            ),
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        if (subtitle != null) ...[
          SizedBox(height: ResponsiveHelper.spacing(context, 8)),
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: ResponsiveHelper.adaptive(
                context,
                mobile: 14,
                tablet: 16,
                desktop: 18,
              ),
              color: Colors.grey[700],
            ),
          ),
        ],
      ],
    );
  }
}