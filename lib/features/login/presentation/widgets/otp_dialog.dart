import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gatepay_app/shared/utils/theme.dart';
import 'package:gatepay_app/shared/widgets/custom_snackbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
import 'dart:ui';

import '../../../../shared/utils/responsive_helper.dart';

class OtpDialog extends StatefulWidget {
  final String email;
  final Function(String otp) onOtpSubmitted;
  final VoidCallback onResendOtp;
  final int otpLength;

  const OtpDialog({
    super.key,
    required this.email,
    required this.onOtpSubmitted,
    required this.onResendOtp,
    this.otpLength = 6,
  });

  @override
  State<OtpDialog> createState() => _OtpDialogState();
}

class _OtpDialogState extends State<OtpDialog> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  int _resendCountdown = 60;
  Timer? _timer;
  bool _canResend = false;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      widget.otpLength,
      (_) => TextEditingController(),
    );
    _focusNodes = List.generate(widget.otpLength, (_) => FocusNode());
    _startResendTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _startResendTimer() {
    _canResend = false;
    _resendCountdown = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendCountdown > 0) {
          _resendCountdown--;
        } else {
          _canResend = true;
          timer.cancel();
        }
      });
    });
  }

  void _onOtpChanged(String value, int index) {
    if (value.length == 1 && index < widget.otpLength - 1) {
      _focusNodes[index + 1].requestFocus();
    }

    if (_controllers.every((controller) => controller.text.length == 1)) {
      _submitOtp();
    }
  }

  void _onOtpBackspace(int index) {
    if (index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  void _submitOtp() {
    final otp = _controllers.map((c) => c.text).join();
    if (otp.length == widget.otpLength) {
      widget.onOtpSubmitted(otp);
    }
  }

  void _clearOtp() {
    for (var controller in _controllers) {
      controller.clear();
    }
    _focusNodes[0].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Stack(
          children: [
            // Full-screen blurred background overlay
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(color: Colors.white.withOpacity(0.2)),
              ),
            ),

            Center(
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: const Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title
                      Text(
                        'Verify your Email',
                        style: GoogleFonts.poppins(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 22,
                          ),
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Subtitle
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          children: [
                            TextSpan(
                              text:
                                  'Please enter ${widget.otpLength} digit code sent to\n',
                            ),
                            TextSpan(
                              text: widget.email,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      Wrap(
                        alignment: WrapAlignment.center,
                        spacing: 8,
                        runSpacing: 12,
                        children: List.generate(
                          widget.otpLength,
                          (index) => SizedBox(
                            width: 40,
                            height: 55,
                            child: TextFormField(
                              controller: _controllers[index],
                              focusNode: _focusNodes[index],
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              style: GoogleFonts.poppins(
                                fontSize: ResponsiveHelper.fontSize(
                                  context,
                                  base: 18,
                                ),
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                counterText: '',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide.none,
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: const BorderSide(
                                    color: rprimaryColor,
                                    width: 1,
                                  ),
                                ),
                                filled: true,
                                fillColor: rprimaryColor.withOpacity(0.2),
                                contentPadding: EdgeInsets.zero,
                              ),
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                              onChanged: (value) => _onOtpChanged(value, index),
                              onTap: () {
                                _controllers[index].clear();
                              },
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Resend OTP
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't Receive Code? ",
                            style: GoogleFonts.poppins(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 12,
                              ),
                              color: Colors.grey[600],
                            ),
                          ),
                          TextButton(
                            onPressed: _canResend
                                ? () {
                                    widget.onResendOtp();
                                    _clearOtp();
                                    _startResendTimer();

                                    CustomSnackBar.show(
                                      context,
                                      'Otp Sent',
                                      type: SnackBarType.success,
                                    );
                                  }
                                : null,
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: const Size(0, 0),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              _canResend
                                  ? 'Resend Code'
                                  : 'Resend in ${_resendCountdown}s',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: _canResend ? rprimaryColor : Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 32),

                      // Verify Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _submitOtp,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: rprimaryColor,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            'Verify Code',
                            style: GoogleFonts.poppins(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 14,
                              ),
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showOtpDialog(
  BuildContext context, {
  required String email,
  required Function(String) onOtpSubmitted,
  required VoidCallback onResendOtp,
  int otpLength = 6,
}) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'OTP Dialog',
    barrierColor: Colors.transparent,
    transitionDuration: const Duration(milliseconds: 300),
    pageBuilder: (context, animation, secondaryAnimation) {
      return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: OtpDialog(
          email: email,
          onOtpSubmitted: onOtpSubmitted,
          onResendOtp: onResendOtp,
          otpLength: otpLength,
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(opacity: animation, child: child);
    },
  );
}
