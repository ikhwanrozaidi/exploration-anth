// lib/features/pay_boarding/presentation/pages/pay_boarding_page.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../shared/utils/theme.dart';

class PayBoardingPage extends StatelessWidget {
  final String? title;

  const PayBoardingPage({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return const PayBoardingView();
  }
}

class PayBoardingView extends StatelessWidget {
  const PayBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Order',
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      body: _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    return SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: w * 0.03),
                Text(
                  "Let's Secure your transaction",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: w * 0.07,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "How are you going to make your \ntransaction",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                ),
                const SizedBox(height: 40),

                // Payment Method Cards
                Row(
                  children: _availableMethods.map((method) {
                    return Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: method == _availableMethods.last ? 0 : 20,
                        ),
                        child: PaymentMethodCard(
                          method: method,
                          onTap: () => _onMethodSelected(context, method.type),
                        ),
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 60),

                // Payment Information Section
                PaymentInfoSection(availableMethods: _availableMethods),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onMethodSelected(BuildContext context, PaymentMethodType methodType) {
    Widget targetPage;
    switch (methodType) {
      case PaymentMethodType.qrCode:
        // targetPage = const QrpayPage();
        break;
      case PaymentMethodType.escrow:
        // targetPage = const EscrowpayPage();
        break;
    }

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => targetPage),
    // );
  }
}

// Payment Method Card Widget
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

// Payment Info Section Widget
class PaymentInfoSection extends StatelessWidget {
  final List<PaymentMethod> availableMethods;

  const PaymentInfoSection({super.key, required this.availableMethods});

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
                ...method.features.map(
                  (feature) => _buildFeatureBullet(feature, w),
                ),
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
            style: GoogleFonts.poppins(color: Colors.grey, fontSize: w * 0.035),
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

// Data Models
enum PaymentMethodType { qrCode, escrow }

class PaymentMethod {
  final PaymentMethodType type;
  final String title;
  final String description;
  final String? imagePath;
  final bool isEnabled;
  final List<String> features;

  const PaymentMethod({
    required this.type,
    required this.title,
    required this.description,
    this.imagePath,
    this.isEnabled = true,
    this.features = const [],
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentMethod &&
          runtimeType == other.runtimeType &&
          type == other.type;

  @override
  int get hashCode => type.hashCode;
}

// Mock available payment methods
final _availableMethods = [
  const PaymentMethod(
    type: PaymentMethodType.qrCode,
    title: 'QR Code',
    description: 'Quick and easy QR code payments',
    features: [
      'Direct bank account transaction (Note: Scam can occur)',
      'Scan seller\'s QR Code for escrow transaction',
    ],
  ),
  const PaymentMethod(
    type: PaymentMethodType.escrow,
    title: 'Escrow',
    description: 'Secure escrow transactions',
    features: [
      'Create your own escrow transaction to any sellers with GatePay account',
      'Full protection for both buyer and seller',
    ],
  ),
];
