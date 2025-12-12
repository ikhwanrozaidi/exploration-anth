import 'package:flutter/material.dart';

enum DeviceType { mobile, tablet, desktop }

class ResponsiveHelper {
  // Breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;

  // Get device type based on screen width
  static DeviceType getDeviceType(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < mobileBreakpoint) {
      return DeviceType.mobile;
    } else if (width < tabletBreakpoint) {
      return DeviceType.tablet;
    } else {
      return DeviceType.desktop;
    }
  }

  // Check device type booleans
  static bool isMobile(BuildContext context) =>
      getDeviceType(context) == DeviceType.mobile;

  static bool isTablet(BuildContext context) =>
      getDeviceType(context) == DeviceType.tablet;

  static bool isDesktop(BuildContext context) =>
      getDeviceType(context) == DeviceType.desktop;

  // Responsive value helper - returns different values based on device type
  static T adaptive<T>(
    BuildContext context, {
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    final deviceType = getDeviceType(context);

    switch (deviceType) {
      case DeviceType.mobile:
        return mobile;
      case DeviceType.tablet:
        return tablet ?? mobile;
      case DeviceType.desktop:
        return desktop ?? tablet ?? mobile;
    }
  }

  // Get percentage-based width
  static double getWidth(BuildContext context, double percentage) {
    assert(
      percentage >= 0 && percentage <= 1,
      'Percentage must be between 0 and 1',
    );
    return MediaQuery.of(context).size.width * percentage;
  }

  // Get percentage-based height
  static double getHeight(BuildContext context, double percentage) {
    assert(
      percentage >= 0 && percentage <= 1,
      'Percentage must be between 0 and 1',
    );
    return MediaQuery.of(context).size.height * percentage;
  }

  // Font size scaling based on device type
  static double fontSize(
    BuildContext context, {
    required double base,
    double? sm,
    double? md,
    double? lg,
    double? xl,
  }) {
    final scaleFactor = adaptive<double>(
      context,
      mobile: 1.0,
      tablet: 1.15,
      desktop: 1.3,
    );

    // Return size based on provided breakpoints
    if (xl != null && base >= 32) return xl * scaleFactor;
    if (lg != null && base >= 24) return lg * scaleFactor;
    if (md != null && base >= 18) return md * scaleFactor;
    if (sm != null && base >= 14) return sm * scaleFactor;

    return base * scaleFactor;
  }

  // Spacing/padding helper
  static double spacing(
    BuildContext context,
    double base, {
    double? multiplier,
  }) {
    final factor =
        multiplier ??
        adaptive<double>(context, mobile: 1.0, tablet: 1.3, desktop: 1.5);
    return base * factor;
  }

  // Responsive padding
  static EdgeInsets padding(
    BuildContext context, {
    double? all,
    double? horizontal,
    double? vertical,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    final scaleFactor = adaptive<double>(
      context,
      mobile: 1.0,
      tablet: 1.2,
      desktop: 1.4,
    );

    return EdgeInsets.only(
      left: (left ?? horizontal ?? all ?? 0) * scaleFactor,
      top: (top ?? vertical ?? all ?? 0) * scaleFactor,
      right: (right ?? horizontal ?? all ?? 0) * scaleFactor,
      bottom: (bottom ?? vertical ?? all ?? 0) * scaleFactor,
    );
  }

  // Get safe content constraints
  static BoxConstraints getContentConstraints(BuildContext context) {
    return adaptive(
      context,
      mobile: const BoxConstraints(maxWidth: double.infinity),
      tablet: const BoxConstraints(maxWidth: 600),
      desktop: const BoxConstraints(maxWidth: 800),
    );
  }

  // Get dialog/bottom sheet constraints
  static BoxConstraints getDialogConstraints(BuildContext context) {
    return adaptive(
      context,
      mobile: const BoxConstraints(maxWidth: double.infinity),
      tablet: const BoxConstraints(maxWidth: 500),
      desktop: const BoxConstraints(maxWidth: 600),
    );
  }

  // Calculate responsive border radius
  static BorderRadius borderRadius(
    BuildContext context, {
    double? all,
    double? topLeft,
    double? topRight,
    double? bottomLeft,
    double? bottomRight,
  }) {
    final scaleFactor = adaptive<double>(
      context,
      mobile: 1.0,
      tablet: 1.1,
      desktop: 1.2,
    );

    if (all != null) {
      return BorderRadius.circular(all * scaleFactor);
    }

    return BorderRadius.only(
      topLeft: Radius.circular((topLeft ?? 0) * scaleFactor),
      topRight: Radius.circular((topRight ?? 0) * scaleFactor),
      bottomLeft: Radius.circular((bottomLeft ?? 0) * scaleFactor),
      bottomRight: Radius.circular((bottomRight ?? 0) * scaleFactor),
    );
  }

  // Get responsive icon size
  static double iconSize(BuildContext context, {required double base}) {
    return adaptive(
      context,
      mobile: base,
      tablet: base * 1.2,
      desktop: base * 1.4,
    );
  }

  // Calculate columns for grid layouts
  static int gridColumns(BuildContext context, {int baseColumns = 2}) {
    return adaptive(
      context,
      mobile: baseColumns,
      tablet: baseColumns + 1,
      desktop: baseColumns + 2,
    );
  }

  // Get orientation
  static Orientation getOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }

  // Check if landscape
  static bool isLandscape(BuildContext context) {
    return getOrientation(context) == Orientation.landscape;
  }

  // Check if portrait
  static bool isPortrait(BuildContext context) {
    return getOrientation(context) == Orientation.portrait;
  }
}

/*
/// ResponsiveHelper.getHeight(context, 0.02)
/// ResponsiveHelper.padding(context, vertical: 10, horizontal: 20)
/// ResponsiveHelper.borderRadius(context, all: 14)
/// ResponsiveHelper.fontSize(context, base: 14)
/// 
/// ResponsiveHelper.spacing(context, 20)
/// ResponsiveHelper.iconSize(context, base: 20)
*/
