import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatefulWidget {
  final Widget child;
  final bool isDarkMode; // Pass theme state from parent

  const LoadingShimmer({Key? key, required this.child, this.isDarkMode = false})
    : super(key: key);

  @override
  State<LoadingShimmer> createState() => _LoadingShimmerState();
}

class _LoadingShimmerState extends State<LoadingShimmer> {
  @override
  Widget build(BuildContext context) {
    // Option 1: Use passed isDarkMode parameter
    final baseColor = widget.isDarkMode ? Colors.grey : Colors.grey.shade300;

    // Option 2: Alternatively, detect theme from context
    // final brightness = Theme.of(context).brightness;
    // final baseColor = brightness == Brightness.dark
    //     ? Colors.grey
    //     : Colors.grey.shade300;

    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: Colors.grey.shade100,
      child: widget.child,
    );
  }
}
