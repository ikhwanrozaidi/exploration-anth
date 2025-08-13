import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../../shared/utils/theme.dart';

class EscrowpayErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const EscrowpayErrorWidget({
    super.key,
    required this.message,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    
    return LayoutBuilder(
      builder: (context, cons) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: h / 8),
                Lottie.asset(
                  'assets/lottie/lottie-unplug.json',
                  width: 200,
                  height: 200,
                  fit: BoxFit.fill,
                  repeat: true,
                  animate: true,
                ),
                Text(
                  'Uh-oh!',
                  style: GoogleFonts.poppins(
                    color: tDarkFontShade1,
                    fontWeight: FontWeight.w600,
                    fontSize: w * 0.05,
                  ),
                ),
                Text(
                  'We ran into a problem',
                  style: GoogleFonts.poppins(
                    color: tDarkFontShade1,
                    fontWeight: FontWeight.w600,
                    fontSize: w * 0.04,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    message,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: onRetry,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tPrimaryColorShade3,
                    padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    minimumSize: const Size(64, 30),
                    visualDensity: VisualDensity.compact,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: Text(
                    'Try again',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}