import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../utils/responsive_helper.dart';

/// Overlay widget that shows "Coming Soon" message with blur effect
/// Use this to create a teaser effect on incomplete features
class ComingSoonOverlay extends StatelessWidget {
  /// The child widget to be blurred
  final Widget child;

  /// Custom message (default: "This feature is coming soon")
  final String? message;

  /// Custom icon (default: Icons.lock_outline)
  final IconData? icon;

  /// Whether to show the overlay (default: true)
  final bool showOverlay;

  /// Blur intensity (default: 5.0)
  final double blurIntensity;

  /// Background color opacity (default: 0.3)
  final double backgroundOpacity;

  final bool backButton;

  const ComingSoonOverlay({
    super.key,
    required this.child,
    this.message,
    this.icon,
    this.showOverlay = true,
    this.blurIntensity = 9.0,
    this.backgroundOpacity = 0.3,
    this.backButton = false,
  });

  @override
  Widget build(BuildContext context) {
    if (!showOverlay) {
      return child;
    }

    return Stack(
      children: [
        // Original content
        child,

        // Blur overlay
        Positioned.fill(
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: blurIntensity,
                sigmaY: blurIntensity,
              ),
              child: Container(
                color: Colors.black.withOpacity(backgroundOpacity),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.white, Colors.transparent],
                      stops: [0.0, 0.5],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.asset(
                          'assets/lottie/coming_soon.json',
                          width: 600,
                          fit: BoxFit.contain,
                        ),

                        Text(
                          'Stay Updated\n This feature is coming soon...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 18,
                            ),
                          ),
                        ),

                        SizedBox(height: 15),

                        backButton
                            ? SizedBox(
                                width: 100,
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },

                                  style: TextButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors.white,

                                    padding: EdgeInsets.symmetric(
                                      horizontal: 20,
                                      vertical: 5,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_back_rounded,
                                        color: Colors.black,
                                      ),

                                      SizedBox(width: 5),

                                      Text(
                                        'Back',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
