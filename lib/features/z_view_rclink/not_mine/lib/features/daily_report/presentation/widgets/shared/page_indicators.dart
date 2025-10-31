import 'package:flutter/material.dart';

/// Reusable page indicator dots for carousels and page views
///
/// Displays a row of dots indicating the current page in a PageView.
/// The active page is highlighted while inactive pages are shown in a muted color.
class PageIndicators extends StatelessWidget {
  final int itemCount;
  final int currentIndex;
  final Color activeColor;
  final Color inactiveColor;
  final double dotSize;
  final double spacing;

  const PageIndicators({
    Key? key,
    required this.itemCount,
    required this.currentIndex,
    this.activeColor = Colors.white,
    this.inactiveColor = Colors.grey,
    this.dotSize = 8.0,
    this.spacing = 2.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Only show indicators if there are 2 or more pages
    if (itemCount <= 1) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: spacing),
          width: dotSize,
          height: dotSize,
          decoration: BoxDecoration(
            color: currentIndex == index ? activeColor : inactiveColor,
            borderRadius: BorderRadius.circular(dotSize / 2),
          ),
        ),
      ),
    );
  }
}
