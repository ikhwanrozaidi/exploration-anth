import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/pay_boarding_state.dart';

class PaymentInfoSection extends StatelessWidget {
  final List<PaymentMethod> availableMethods;

  const PaymentInfoSection({
    super.key,
    required this.availableMethods,
  });

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Catch-up!',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            fontSize: w * 0.035,
          ),
        ),
        const SizedBox(height: 20),
        
        ...availableMethods.asMap().entries.map((entry) {
          final index = entry.key + 1;
          final method = entry.value;
          
          return Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$index. ${method.title}',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: w * 0.035,
                  ),
                ),
                const SizedBox(height: 8),
                ...method.features.map((feature) => _buildFeatureBullet(feature, w)),
              ],
            ),
          );
        }).toList(),
      ],
    );
  }

  Widget _buildFeatureBullet(String feature, double w) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 20),
          Text(
            '•',
            style: GoogleFonts.poppins(
              color: Colors.grey,
              fontSize: w * 0.035,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              feature,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: w * 0.035,
              ),
            ),
          ),
        ],
      ),
    );
  }
}