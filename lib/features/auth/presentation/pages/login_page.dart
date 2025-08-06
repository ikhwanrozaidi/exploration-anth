import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../../../locale/presentation/widgets/app_localization.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _otpFocusNodes = List.generate(
    4,
    (index) => FocusNode(),
  );

  String? _phoneError;
  String _completePhoneNumber = '';
  bool _showOtpScreen = false;
  Timer? _resendTimer;
  int _resendCountdown = 60;
  bool _canResend = false;

  late AnimationController _bottomSheetController;
  late AnimationController _backgroundController;
  late AnimationController _contentController;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _contentSlideAnimation;
  late Animation<Offset> _signInSlideAnimation;

  @override
  void initState() {
    super.initState();

    _bottomSheetController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _backgroundController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _contentController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _slideAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _bottomSheetController,
        curve: Curves.easeOutCubic,
      ),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _backgroundController, curve: Curves.easeInOut),
    );

    _contentSlideAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(parent: _contentController, curve: Curves.easeInOut),
        );

    _signInSlideAnimation =
        Tween<Offset>(begin: Offset.zero, end: const Offset(-1.0, 0.0)).animate(
          CurvedAnimation(parent: _contentController, curve: Curves.easeInOut),
        );

    Future.delayed(const Duration(milliseconds: 300), () {
      if (mounted) {
        _backgroundController.forward();
        _bottomSheetController.forward();
      }
    });
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _otpControllers.forEach((controller) => controller.dispose());
    _otpFocusNodes.forEach((node) => node.dispose());
    _resendTimer?.cancel();
    _bottomSheetController.dispose();
    _backgroundController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  void _startResendTimer() {
    _canResend = false;
    _resendCountdown = 60;
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
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

  void _showOtpVerification() {
    setState(() {
      _showOtpScreen = true;
    });
    _contentController.forward();
    _startResendTimer();
  }

  void _backToSignIn() {
    _contentController.reverse().then((_) {
      setState(() {
        _showOtpScreen = false;
      });
    });
    _resendTimer?.cancel();
    _clearOtpFields();
  }

  void _clearOtpFields() {
    for (var controller in _otpControllers) {
      controller.clear();
    }
  }

  void _onOtpChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 3) {
        _otpFocusNodes[index + 1].requestFocus();
      }
    } else {
      if (index > 0) {
        _otpFocusNodes[index - 1].requestFocus();
      }
    }

    bool allFilled = _otpControllers.every(
      (controller) => controller.text.isNotEmpty,
    );
    if (allFilled) {
      _verifyOtp();
    }
  }

  void _verifyOtp() {
    String otp = _otpControllers.map((controller) => controller.text).join();
    if (otp.length == 4) {
      // TODO: Implement OTP verification
      CustomSnackBar.show(context, 'OTP: $otp', type: SnackBarType.success);
    }
  }

  void _resendOtp() {
    if (_canResend) {
      // TODO: Implement resend OTP
      CustomSnackBar.show(
        context,
        'OTP resent successfully',
        type: SnackBarType.success,
      );
      _startResendTimer();
      _clearOtpFields();
    }
  }

  String _formatCountdown() {
    int minutes = _resendCountdown ~/ 60;
    int seconds = _resendCountdown % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () {},
            failure: (message) {
              CustomSnackBar.show(context, message, type: SnackBarType.error);
            },
            otpSent: (data) {
              CustomSnackBar.show(
                context,
                localization.auth('otpSent'),
                type: SnackBarType.success,
              );

              // TODO: Navigate to OTP verification page
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) => OtpVerificationPage(phone: _phoneController.text),
              // ));

              _showOtpVerification();
            },
          );
        },
        child: Stack(
          children: [
            // Background
            AnimatedBuilder(
              animation: _backgroundController,
              builder: (context, child) {
                return Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/signin_bg.png'),
                      fit: BoxFit.cover,
                      opacity: _fadeAnimation.value,
                    ),
                  ),
                );
              },
            ),

            // Animated Bottom Sheet
            AnimatedBuilder(
              animation: _bottomSheetController,
              builder: (context, child) {
                return Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Transform.translate(
                    offset: Offset(
                      0,
                      MediaQuery.of(context).size.height *
                          0.7 *
                          _slideAnimation.value,
                    ),
                    child: Column(
                      children: [
                        //Logo RCLink
                        Center(
                          child: FadeTransition(
                            opacity: _fadeAnimation,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(bottom: 50),
                                  child: Opacity(
                                    opacity: _fadeAnimation.value,
                                    child: Image.asset(
                                      'assets/images/rclink_logo.png',
                                      height: 100,
                                      width: 200,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: Offset(0, -2),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(24),
                              topRight: Radius.circular(24),
                            ),
                            child: Stack(
                              children: [
                                SlideTransition(
                                  position: _signInSlideAnimation,
                                  child: _buildSignInContent(localization),
                                ),
                                if (_showOtpScreen)
                                  SlideTransition(
                                    position: _contentSlideAnimation,
                                    child: _buildOtpContent(localization),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignInContent(AppLocalizations localization) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 24),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),

            Text(
              localization.auth('signIn'),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              localization.auth('enterPhoneNumber'),
              style: TextStyle(color: Colors.black),
            ),
            const SizedBox(height: 32),

            IntlPhoneField(
              controller: _phoneController,
              decoration: InputDecoration(
                counterText: '',
                hintText: localization.auth('phoneNumber'),
                hintStyle: TextStyle(color: Colors.grey[500]),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _phoneError != null ? Colors.red : Colors.grey[300]!,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _phoneError != null ? Colors.red : Colors.grey[300]!,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _phoneError != null ? Colors.red : Colors.blue,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.red, width: 1),
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
              initialCountryCode: 'MY',
              showCountryFlag: true,
              showDropdownIcon: true,
              dropdownIcon: Icon(
                Icons.keyboard_arrow_down,
                color: Colors.grey[600],
                size: 20,
              ),
              flagsButtonPadding: const EdgeInsets.symmetric(horizontal: 8),
              flagsButtonMargin: const EdgeInsets.only(right: 8),
              style: const TextStyle(fontSize: 16),
              dropdownTextStyle: const TextStyle(fontSize: 16),
              pickerDialogStyle: PickerDialogStyle(
                backgroundColor: Colors.white,
                countryNameStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                countryCodeStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w400,
                ),
                searchFieldInputDecoration: InputDecoration(
                  hintText: 'Search country...',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey[300]!),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  filled: true,
                  fillColor: Colors.grey[50],
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
                padding: const EdgeInsets.all(15),
                listTilePadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                listTileDivider: Container(
                  height: 1,
                  color: Colors.grey[200],
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                ),
                searchFieldCursorColor: Colors.blue,
              ),
              onChanged: (phone) {
                setState(() {
                  _completePhoneNumber = phone.completeNumber;

                  if (phone.number.isEmpty) {
                    _phoneError = localization.auth('phoneRequired');
                  } else if (phone.number.length < 8) {
                    _phoneError = localization.auth('phoneInvalid');
                  } else {
                    _phoneError = null;
                  }
                });
              },
              validator: (phone) {
                if (phone == null || phone.number.isEmpty) {
                  _phoneError = localization.auth('phoneRequired');
                  return _phoneError;
                } else if (phone.number.length < 8) {
                  _phoneError = localization.auth('phoneInvalid');
                  return _phoneError;
                } else {
                  _phoneError = null;
                  return null;
                }
              },
            ),

            const SizedBox(height: 10),

            Text(
              localization.auth('smsInfo'),
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  final isLoading = state.maybeWhen(
                    loading: () => true,
                    orElse: () => false,
                  );

                  return ElevatedButton(
                    onPressed: isLoading ? null : _sendOtp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 43, 96, 230),
                      disabledBackgroundColor: Colors.grey[300],
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    child: isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.white,
                              ),
                            ),
                          )
                        : Text(
                            localization.shared('next'),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpContent(AppLocalizations localization) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 24),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),

          const Text(
            'Code Validation',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            'Please enter the 4 digit code sent to your\nmobile number $_completePhoneNumber',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),

          const SizedBox(height: 32),

          // OTP Input Fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(4, (index) {
              return Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: _otpControllers[index].text.isNotEmpty
                        ? Color.fromARGB(255, 43, 96, 230)
                        : Colors.grey[300]!,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _otpControllers[index],
                  focusNode: _otpFocusNodes[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(1),
                  ],
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    counterText: '',
                  ),
                  onChanged: (value) {
                    setState(() {});
                    _onOtpChanged(value, index);
                  },
                  onTap: () {
                    _otpControllers[index]
                        .selection = TextSelection.fromPosition(
                      TextPosition(offset: _otpControllers[index].text.length),
                    );
                  },
                ),
              );
            }),
          ),

          const SizedBox(height: 30),

          Text(
            "Didn't receive code?",
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),

          const SizedBox(height: 10),

          // Timer and Resend
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.access_time, size: 20, color: Colors.grey[600]),
              const SizedBox(width: 8),
              Text(
                _formatCountdown(),
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          TextButton(
            onPressed: _canResend ? _resendOtp : null,
            child: Text(
              'Resend Code',
              style: TextStyle(
                fontSize: 16,
                color: _canResend
                    ? Color.fromARGB(255, 43, 96, 230)
                    : Colors.grey[400],
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(height: 40),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _verifyOtp(),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 43, 96, 230),
                disabledBackgroundColor: Colors.grey[300],
                padding: const EdgeInsets.symmetric(vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: _backToSignIn,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color.fromARGB(255, 43, 96, 230)),
                padding: const EdgeInsets.symmetric(vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Back to sign in',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 43, 96, 230),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _sendOtp() {
    _showOtpVerification();

    ////Uncomment later
    // if (_formKey.currentState!.validate()) {
    //   context.read<AuthBloc>().add(SendOtpRequested(_completePhoneNumber));
    // }
  }
}
