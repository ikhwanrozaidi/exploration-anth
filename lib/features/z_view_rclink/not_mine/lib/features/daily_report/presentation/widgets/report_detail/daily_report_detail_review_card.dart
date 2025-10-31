import 'package:flutter/material.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';

/// Review card for daily report detail page
///
/// Displays report review section with:
/// - "Report Review" title
/// - Like button (thumb up)
/// - Dislike button (thumb down)
/// - Yellow gradient background
class DailyReportDetailReviewCard extends StatelessWidget {
  final VoidCallback? onLike;
  final VoidCallback? onDislike;

  const DailyReportDetailReviewCard({
    Key? key,
    this.onLike,
    this.onDislike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.yellow.shade100, Colors.yellow.shade200],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Report Review',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: ResponsiveHelper.fontSize(context, base: 15),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Like Button
              IconButton(
                style: IconButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: primaryShade,
                  padding: const EdgeInsets.all(5),
                ),
                onPressed: onLike,
                icon: const Icon(
                  Icons.thumb_up,
                  color: primaryColor,
                  size: 25,
                ),
              ),
              const SizedBox(width: 8),
              // Dislike Button
              IconButton(
                style: IconButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Colors.red.shade100,
                  padding: const EdgeInsets.all(5),
                ),
                onPressed: onDislike,
                icon: Icon(
                  Icons.thumb_down_alt_rounded,
                  color: Colors.red.shade400,
                  size: 25,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
