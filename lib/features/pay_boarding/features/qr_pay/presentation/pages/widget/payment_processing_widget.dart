import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../shared/utils/theme.dart';

class PaymentProcessingWidget extends StatelessWidget {
  const PaymentProcessingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          strokeWidth: 4,
        ),
        const SizedBox(height: 40),
        Text(
          'Processing Payment...',
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: tDarkFontShade1,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Please wait while we process your payment',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            fontSize: 14,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}