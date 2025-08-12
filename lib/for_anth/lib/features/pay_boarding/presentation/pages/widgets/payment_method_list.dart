import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../shared/utils/theme.dart';
import '../../bloc/pay_boarding_event.dart';
import '../../bloc/pay_boarding_state.dart';

class PaymentMethodList extends StatelessWidget {
  final List<PaymentMethod> methods;
  final PaymentMethodType? selectedMethod;
  final ValueChanged<PaymentMethodType> onMethodSelected;

  const PaymentMethodList({
    super.key,
    required this.methods,
    required this.onMethodSelected,
    this.selectedMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: methods.map((method) {
        final isSelected = selectedMethod == method.type;
        
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? tPrimaryColor : Colors.grey.shade300,
              width: isSelected ? 2 : 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            leading: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: method.isEnabled 
                    ? tPrimaryColorShade2 
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                _getIconForMethod(method.type),
                color: method.isEnabled 
                    ? tPrimaryColorShade3 
                    : Colors.grey,
              ),
            ),
            title: Text(
              method.title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: method.isEnabled ? Colors.black : Colors.grey,
              ),
            ),
            subtitle: Text(
              method.description,
              style: GoogleFonts.poppins(
                color: Colors.grey.shade600,
                fontSize: 12,
              ),
            ),
            trailing: isSelected
                ? Icon(
                    Icons.check_circle,
                    color: tPrimaryColor,
                  )
                : null,
            onTap: method.isEnabled 
                ? () => onMethodSelected(method.type) 
                : null,
          ),
        );
      }).toList(),
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