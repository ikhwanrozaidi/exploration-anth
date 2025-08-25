import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../company/presentation/pages/choose_company_page.dart';
import '../../../company/presentation/pages/widgets/confirmation_company_page.dart';
import '../../../locale/presentation/widgets/app_localization.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_bottom_sheet.dart';
import '../widgets/auth_button.dart';
import '../widgets/auth_header.dart';
import '../widgets/countdown_timer_widget.dart';
import '../widgets/otp_input_widget.dart';
import '../widgets/phone_input_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  // Controllers
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _otpFocusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );

  // State variables
  String? _phoneError;
  String _completePhoneNumber = '';
  bool _isLoading = false;
  bool _isOtpLoading = false;

  // Screen state management
  AuthScreen _currentScreen = AuthScreen.signIn;

  // Animation controllers
  late AnimationController _bottomSheetController;
  late AnimationController _backgroundController;

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

    // Start animations
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
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _otpFocusNodes) {
      node.dispose();
    }
    _bottomSheetController.dispose();
    _backgroundController.dispose();
    super.dispose();
  }

  // Navigation methods
  void _navigateToScreen(AuthScreen screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  void _showOtpScreen() {
    _navigateToScreen(AuthScreen.otp);
  }

  void _showCompanyScreen() {
    _navigateToScreen(AuthScreen.company);
  }

  void _backToSignIn() {
    setState(() {
      _currentScreen = AuthScreen.signIn;
    });
    _clearOtpFields();
  }

  // Helper methods
  void _clearOtpFields() {
    for (var controller in _otpControllers) {
      controller.clear();
    }
  }

  void _setLoading(bool loading) {
    if (mounted) {
      setState(() {
        _isLoading = loading;
      });
    }
  }

  // Auth methods
  void _sendOtp() {
    if (_formKey.currentState!.validate() &&
        _phoneError == null &&
        _phoneController.text.trim().isNotEmpty) {
      _setLoading(true);
      context.read<AuthBloc>().add(RequestOtpRequested(_completePhoneNumber));
    } else {
      CustomSnackBar.show(
        context,
        'Please enter a valid phone number',
        type: SnackBarType.error,
      );
    }
  }

  void _verifyOtp() {
    String otp = _otpControllers.map((controller) => controller.text).join();

    if (otp.length == 6) {
      setState(() {
        _isOtpLoading = true;
      });
      context.read<AuthBloc>().add(
        VerifyOtpRequested(phone: _completePhoneNumber, otp: otp),
      );
    } else {
      CustomSnackBar.show(
        context,
        'Please enter complete 6-digit OTP',
        type: SnackBarType.error,
      );
    }
  }

  void _resendOtp() {
    if (!_isLoading) {
      _setLoading(true);
      context.read<AuthBloc>().add(RequestOtpRequested(_completePhoneNumber));
      _clearOtpFields();
    }
  }

  // Build methods
  Widget _getCurrentScreen(AppLocalizations localization) {
    switch (_currentScreen) {
      case AuthScreen.signIn:
        return _buildSignInContent(localization);
      case AuthScreen.otp:
        return _buildOtpContent(localization);
      case AuthScreen.company:
        return CompanySelectionPage(onBackPressed: _backToSignIn);
      case AuthScreen.companySignIn:
        return CompanySignInPage(onBackPressed: _backToSignIn);
    }
  }

  Widget _buildSignInContent(AppLocalizations localization) {
    return Padding(
      padding: ResponsiveHelper.padding(context, all: 24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AuthHeader(
              title: localization.auth('signIn'),
              subtitle: localization.auth('enterPhoneNumber'),
            ),
            SizedBox(height: ResponsiveHelper.spacing(context, 32)),

            // Phone Input
            PhoneInputWidget(
              controller: _phoneController,
              onChanged: (completeNumber) {
                setState(() {
                  _completePhoneNumber = completeNumber;
                  if (_phoneController.text.isEmpty) {
                    _phoneError = localization.auth('phoneRequired');
                  } else if (_phoneController.text.length < 8) {
                    _phoneError = localization.auth('phoneInvalid');
                  } else {
                    _phoneError = null;
                  }
                });
              },
              validator: (phone) {
                if (_phoneController.text.isEmpty) {
                  return localization.auth('phoneRequired');
                } else if (_phoneController.text.length < 8) {
                  return localization.auth('phoneInvalid');
                }
                return null;
              },
              errorText: _phoneError,
              isLoading: _isLoading,
            ),

            SizedBox(height: ResponsiveHelper.spacing(context, 24)),

            // Submit Button
            AuthButton(
              text: localization.shared('next'),
              onPressed: (_isLoading || _phoneController.text.trim().isEmpty)
                  ? null
                  : _sendOtp,
              isLoading: _isLoading && _phoneController.text.trim().isNotEmpty,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOtpContent(AppLocalizations localization) {
    return Padding(
      padding: ResponsiveHelper.padding(context, all: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AuthHeader(
            title: 'Code Validation',
            subtitle:
                'Please enter the 6 digit code sent to your\nmobile number $_completePhoneNumber',
          ),
          SizedBox(height: ResponsiveHelper.spacing(context, 32)),

          // OTP Input
          OtpInputWidget(
            controllers: _otpControllers,
            focusNodes: _otpFocusNodes,
            onChanged: (value, index) {
              // Auto-verify when all boxes are filled
              bool allFilled = _otpControllers.every(
                (controller) => controller.text.isNotEmpty,
              );
              if (allFilled && !_isOtpLoading) {
                _verifyOtp();
              }
            },
            isLoading: _isOtpLoading,
            onCompleted: _verifyOtp,
          ),

          SizedBox(height: ResponsiveHelper.spacing(context, 30)),

          // Countdown Timer
          CountdownTimerWidget(
            initialSeconds: 60,
            onResendPressed: _resendOtp,
            isLoading: _isLoading,
          ),

          SizedBox(height: ResponsiveHelper.spacing(context, 40)),

          // Verify Button
          AuthButton(
            text: localization.shared('next'),
            onPressed: _isOtpLoading ? null : _verifyOtp,
            isLoading: _isOtpLoading,
          ),

          SizedBox(height: ResponsiveHelper.spacing(context, 10)),

          // Back Button
          AuthButton(
            text: 'Back to sign in',
            onPressed: _isOtpLoading ? null : _backToSignIn,
            type: AuthButtonType.secondary,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return GestureDetector(
      onTap: () {
        // Hide keyboard when tapping outside
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.whenOrNull(
              failure: (message) {
                _setLoading(false);
                setState(() {
                  _isOtpLoading = false;
                });
                CustomSnackBar.show(context, message, type: SnackBarType.error);
                _backToSignIn();
              },
              otpSent: (data) {
                _setLoading(false);
                CustomSnackBar.show(
                  context,
                  data.message,
                  type: SnackBarType.success,
                );
                _showOtpScreen();
              },
              authenticatedNeedsCompany: (tokens, admin) {
                setState(() {
                  _isOtpLoading = false;
                });
                _showCompanyScreen();
              },
              authenticated: (tokens, admin, companyId) {
                setState(() {
                  _isOtpLoading = false;
                });
              },
              unauthenticated: () {
                _setLoading(false);
                setState(() {
                  _isOtpLoading = false;
                });
                _backToSignIn();
              },
            );
          },
          child: AuthBackground(
            imagePath: 'assets/images/signin_bg.png',
            fadeController: _backgroundController,
            child: Stack(
              children: [
                // Logo positioned above the bottom sheet
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom:
                      MediaQuery.of(context).size.height *
                      0.65, // Adjusted to match new sheet height
                  child: Center(
                    child: AuthLogo(
                      logoPath: 'assets/images/rclink_logo.png',
                      fadeController: _backgroundController,
                    ),
                  ),
                ),

                // Bottom Sheet
                AuthBottomSheet(
                  controller: _bottomSheetController,
                  child: AuthPageSwitcher(
                    child: Container(
                      key: ValueKey(_currentScreen),
                      child: _getCurrentScreen(localization),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum AuthScreen { signIn, otp, company, companySignIn }
