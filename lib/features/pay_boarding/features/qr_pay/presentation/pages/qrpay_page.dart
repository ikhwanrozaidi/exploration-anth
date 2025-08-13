// lib/features/pay_boarding/qr_pay/presentation/pages/qrpay_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import '../../../../../../core/dio/injection.dart';
import '../../../../../../shared/utils/build_loading_indicator.dart';
import '../../../../../../shared/utils/theme.dart';
import '../bloc/qrpay_bloc.dart';
import '../bloc/qrpay_event.dart';
import '../bloc/qrpay_state.dart';

class QrpayPage extends StatelessWidget {
  final String? title;
  
  const QrpayPage({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<QrpayBloc>()..add(const LoadQrpay()),
      child: const QrpayView(),
    );
  }
}

class QrpayView extends StatelessWidget {
  const QrpayView({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pay with QR',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: Material(
        color: Colors.white,
        child: BlocConsumer<QrpayBloc, QrpayState>(
          listener: (context, state) {
            if (state is QrpayPaymentSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Payment successful! Transaction ID: ${state.transactionId}',
                  ),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is QrpayError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          builder: (context, state) {
            if (state is QrpayLoaded) {
              return _buildLoadedContent(w, h, context);
            } else if (state is QrpayLoading) {
              return Center(
                child: buildLoadingIndicator(
                  blur: 0,
                  isCentered: true,
                ),
              );
            } else if (state is QrpayScanning) {
              return _buildScanningContent(w, h);
            } else if (state is QrpayScanned) {
              return _buildScannedContent(w, h, state.qrData, context);
            } else if (state is QrpayProcessing) {
              return _buildProcessingContent(w, h);
            } else if (state is QrpayError) {
              return _buildErrorContent(w, h, state.message, context);
            } else {
              return _buildErrorContent(w, h, 'Something went wrong', context);
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoadedContent(double w, double h, BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.qr_code_scanner,
              size: 120,
              color: tPrimaryColor,
            ),
            const SizedBox(height: 40),
            Text(
              'Scan QR Code to Pay',
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: tDarkFontShade1,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Point your camera at the QR code to make a payment',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  context.read<QrpayBloc>().add(const ScanQrCode());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: tPrimaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.qr_code_scanner),
                    const SizedBox(width: 12),
                    Text(
                      'Start Scanning',
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScanningContent(double w, double h) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(color: tPrimaryColor, width: 3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Scanning QR Code...',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: tDarkFontShade1,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Please hold steady and point your camera at the QR code',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScannedContent(double w, double h, String qrData, BuildContext context) {
    final TextEditingController amountController = TextEditingController();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 40,
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'QR Code Scanned Successfully',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.green.shade800,
                          ),
                        ),
                        Text(
                          'QR Data: $qrData',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.green.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Text(
              'Enter Payment Amount',
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: tDarkFontShade1,
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Amount (MYR)',
                prefixText: 'MYR ',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey.shade50,
              ),
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () {
                  final amount = double.tryParse(amountController.text);
                  if (amount != null && amount > 0) {
                    context.read<QrpayBloc>().add(
                      ProcessQrPayment(qrData: qrData, amount: amount),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a valid amount'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: tPrimaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Pay Now',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProcessingContent(double w, double h) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
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
        ),
      ),
    );
  }

  Widget _buildErrorContent(double w, double h, String message, BuildContext context) {
    return LayoutBuilder(
      builder: (context, cons) {
        return Container(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  'We may ran into a problem',
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
                    message.isNotEmpty 
                        ? message 
                        : 'Please check your internet connection and try again',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    context.read<QrpayBloc>().add(const LoadQrpay());
                  },
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