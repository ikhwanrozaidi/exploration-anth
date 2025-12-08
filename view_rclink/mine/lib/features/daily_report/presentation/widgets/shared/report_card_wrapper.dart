import 'package:flutter/material.dart';

/// Reusable card wrapper with consistent styling for report detail cards
///
/// Provides standard card decoration with:
/// - Rounded corners
/// - Border
/// - Optional gradient background
/// - Consistent padding
class ReportCardWrapper extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool hasGradient;
  final List<Color>? gradientColors;
  final Color? borderColor;
  final double borderWidth;
  final double borderRadius;

  const ReportCardWrapper({
    Key? key,
    required this.child,
    this.padding,
    this.hasGradient = true,
    this.gradientColors,
    this.borderColor,
    this.borderWidth = 0.5,
    this.borderRadius = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding ?? const EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? Colors.grey,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
        gradient: hasGradient
            ? LinearGradient(
                colors: gradientColors ??
                    [
                      Colors.white,
                      const Color.fromARGB(255, 238, 242, 254),
                    ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              )
            : null,
        color: hasGradient ? null : Colors.white,
      ),
      child: child,
    );
  }
}
