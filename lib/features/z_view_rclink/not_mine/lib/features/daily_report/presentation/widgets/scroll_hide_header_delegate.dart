import 'package:flutter/material.dart';

/// Custom sliver persistent header delegate that can hide/show based on scroll
class ScrollHideHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double height;
  final bool shouldHide;

  ScrollHideHeaderDelegate({
    required this.child,
    required this.height,
    this.shouldHide = true,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox(
      height: height,
      child: child,
    );
  }

  @override
  double get maxExtent => height;

  @override
  double get minExtent => shouldHide ? 0.0 : height;

  @override
  bool shouldRebuild(ScrollHideHeaderDelegate oldDelegate) {
    return oldDelegate.child != child ||
        oldDelegate.height != height ||
        oldDelegate.shouldHide != shouldHide;
  }
}
