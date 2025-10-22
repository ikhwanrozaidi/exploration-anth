import 'package:flutter/material.dart';

import '../../../../../shared/utils/responsive_helper.dart';

class ListingItem extends StatelessWidget {
  final String image;
  final String label;
  final VoidCallback onTap;
  final bool isBlack;

  const ListingItem({
    Key? key,
    required this.image,
    required this.label,
    required this.onTap,
    required this.isBlack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: ResponsiveHelper.adaptive(
              context,
              mobile: ResponsiveHelper.getWidth(context, 0.15),
              tablet: ResponsiveHelper.getWidth(context, 0.12),
              desktop: ResponsiveHelper.getWidth(context, 0.08),
            ),
            height: ResponsiveHelper.adaptive(
              context,
              mobile: ResponsiveHelper.getWidth(context, 0.15),
              tablet: ResponsiveHelper.getWidth(context, 0.12),
              desktop: ResponsiveHelper.getWidth(context, 0.08),
            ),
            padding: ResponsiveHelper.padding(
              context,
              all: ResponsiveHelper.adaptive(
                context,
                mobile: 13,
                tablet: 16,
                desktop: 20,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: ResponsiveHelper.borderRadius(context, all: 15),
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.black.withOpacity(0.08),
              //     offset: Offset(0, 2),
              //     blurRadius: 4,
              //   ),
              // ],
            ),
            child: Image.asset(image, fit: BoxFit.contain),
          ),
          SizedBox(height: isBlack ? 0 : ResponsiveHelper.spacing(context, 8)),
          Flexible(
            child: Text(
              label,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: isBlack ? Colors.black : Colors.white,
                fontSize: ResponsiveHelper.fontSize(
                  context,
                  base: ResponsiveHelper.adaptive(
                    context,
                    mobile: 10,
                    tablet: 12,
                    desktop: 14,
                  ),
                ),
                fontWeight: FontWeight.w500,
                height: 1.2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
