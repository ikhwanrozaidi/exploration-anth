import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../shared/utils/theme.dart';
import '../../bloc/pay_boarding_event.dart';
import '../../bloc/pay_boarding_state.dart';

class PaymentMethodCard extends StatelessWidget {
  final PaymentMethod method;
  final VoidCallback onTap;

  const PaymentMethodCard({
    super.key,
    required this.method,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: method.isEnabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: method.isEnabled ? tPrimaryColorShade4 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                color: method.isEnabled
                    ? tPrimaryColorShade2
                    : Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: method.imagePath != null
                    ? Image.asset(
                        method.imagePath!,
                        width: 40,
                        height: 40,
                        color: method.isEnabled ? null : Colors.grey,
                      )
                    : Icon(
                        _getIconForMethod(method.type),
                        size: 40,
                        color: method.isEnabled
                            ? tPrimaryColorShade3
                            : Colors.grey,
                      ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              method.title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: method.isEnabled ? Colors.black : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconForMethod(PaymentMethodType type) {
    switch (type) {
      case PaymentMethodType.qrCode:
        return Icons.qr_code;
      case PaymentMethodType.escrow:
        return Icons.security;
    }
  }
}
