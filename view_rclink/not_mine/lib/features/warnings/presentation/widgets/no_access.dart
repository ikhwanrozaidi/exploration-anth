import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../shared/utils/responsive_helper.dart';

class NoAccessOverlay extends StatelessWidget {
  final Widget child;
  final String? message;
  final IconData? icon;
  final bool showOverlay;
  final double blurIntensity;
  final double backgroundOpacity;
  final bool backButton;

  const NoAccessOverlay({
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
                          'assets/lottie/no_access.json',
                          width: 600,
                          fit: BoxFit.contain,
                        ),

                        Text(
                          'Require permission to access',
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
