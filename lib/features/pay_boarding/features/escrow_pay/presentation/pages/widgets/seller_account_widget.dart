import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../../shared/utils/theme.dart';

class SellerAccountToggle extends StatelessWidget {
  final bool hasAccount;
  final ValueChanged<bool> onToggle;

  const SellerAccountToggle({
    super.key,
    required this.hasAccount,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    
    return Row(
      children: [
        SizedBox(
          width: w / 2,
          child: Text(
            'Does your seller have an account with us?',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => onToggle(true),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: hasAccount ? tPrimaryColor : tPrimaryColorShade2,
                      borderRadius: const BorderRadius.horizontal(
                        left: Radius.circular(100),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Yes',
                        style: GoogleFonts.poppins(
                          color: hasAccount
                              ? Colors.white
                              : tPrimaryColorShade3.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () => onToggle(false),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: !hasAccount ? tPrimaryColor : tPrimaryColorShade2,
                      borderRadius: const BorderRadius.horizontal(
                        right: Radius.circular(100),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'No',
                        style: GoogleFonts.poppins(
                          color: !hasAccount
                              ? Colors.white
                              : tPrimaryColorShade3.withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

