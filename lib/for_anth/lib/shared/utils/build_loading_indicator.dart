import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildLoadingIndicator({double? blur, bool? isCentered}) {
  return BackdropFilter(
    filter: ImageFilter.blur(
      sigmaX: blur ?? 3,
      sigmaY: blur ?? 3,
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Lottie.asset(
          //   'assets/lottie/lottie-loading.json',
          //   width: 100,
          //   height: 100,
          //   fit: BoxFit.contain,
          //   repeat: true,
          //   animate: true,
          // ),
          SizedBox(height: 10),
          Text(
            textAlign: TextAlign.center,
            'Wait a second...',
            style: GoogleFonts.poppins(),
          )
        ],
      ),
    ),
  );
}