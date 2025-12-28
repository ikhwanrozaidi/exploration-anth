import 'package:flutter/material.dart';

class CompanyAnimations {
  static AnimationController createFadeController(TickerProvider vsync) {
    return AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: vsync,
    );
  }

  static Animation<double> createFadeAnimation(AnimationController controller) {
    return Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
  }
}
