import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rclink_app/shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../company/presentation/pages/company_selection_page.dart';
import '../../../company/presentation/pages/company_signin_page.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../../../locale/presentation/widgets/app_localization.dart';
import '../mock/company.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isCompletingLoginFlow = false;

  Company? _selectedCompany;
  final TextEditingController _searchController = TextEditingController();

  final List<TextEditingController> _otpControllers = List.generate(
    6,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _otpFocusNodes = List.generate(
    6,
    (index) => FocusNode(),
  );

  String? _phoneError;
  String _completePhoneNumber = '';
  Timer? _resendTimer;
  int _resendCountdown = 60;
  bool _canResend = false;
  bool _isLoading = false;
  bool _isOtpLoading = false;

  // Screen state management
  bool isSignInScreen = true;
  bool isOtpScreen = false;
  bool isCompanyScreen = false;
  bool isCompanySignInScreen = false;

  // Animation controllers
  late AnimationController _bottomSheetController;
  late AnimationController _backgroundController;
  late AnimationController _pageController;

  // Animations
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _pageSlideAnimation;

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

    _pageController = AnimationController(
      duration: const Duration(milliseconds: 300),
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

    _pageSlideAnimation =
        Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
          CurvedAnimation(
            parent: _pageController,
            curve: Curves.easeInOutCubic,
          ),
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
    _searchController.dispose();
    _otpControllers.forEach((controller) => controller.dispose());
    _otpFocusNodes.forEach((node) => node.dispose());
    _resendTimer?.cancel();
    _bottomSheetController.dispose();
    _backgroundController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void _showOtpScreen() {
    print('🔄 _showOtpScreen called');

    _pageController.forward().then((_) {
      if (mounted) {
        setState(() {
          isSignInScreen = false;
          isOtpScreen = true;
        });
        _pageController.reset();
      }
    });
    _startResendTimer();
  }

  void _showCompanyScreen() {
    print('🔄 _showCompanyScreen called');

    _pageController.forward().then((_) {
      if (mounted) {
        setState(() {
          isOtpScreen = false;
          isCompanyScreen = true;
        });
        _pageController.reset();
      }
    });
  }

  void _backToSignInFromOtp() {
    print('🔄 _backToSignInFromOtp called');

    _pageController.forward().then((_) {
      if (mounted) {
        setState(() {
          isOtpScreen = false;
          isSignInScreen = true;
        });
        _pageController.reset();
      }
    });
    _resendTimer?.cancel();
    _clearOtpFields();
  }

  void _showCompanySignInScreen() {
    print('🔄 _showCompanySignInScreen called');

    _pageController.forward().then((_) {
      if (mounted) {
        setState(() {
          isCompanyScreen = false;
          isCompanySignInScreen = true;
        });
        _pageController.reset();
      }
    });
  }

  void _backToCompanySelection() {
    print('🔄 _backToCompanySelection called');

    _pageController.forward().then((_) {
      if (mounted) {
        setState(() {
          isCompanySignInScreen = false;
          isCompanyScreen = true;
        });
        _pageController.reset();
      }
    });
  }

  void _backToSignInFromCompany() {
    print('🔄 _backToSignInFromCompany called');

    setState(() {
      _isCompletingLoginFlow = false;
    });

    _pageController.forward().then((_) {
      if (mounted) {
        setState(() {
          isCompanyScreen = false;
          isCompanySignInScreen = false;
          isSignInScreen = true;
        });
        _pageController.reset();
      }
    });
    _resendTimer?.cancel();
    _clearOtpFields();
  }

  // OTP Resend Time
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

  // Clear Otp Fields
  void _clearOtpFields() {
    for (var controller in _otpControllers) {
      controller.clear();
    }
  }

  // Increment for Otp Fields
  void _onOtpChanged(String value, int index) {
    if (value.isNotEmpty) {
      if (index < 5) {
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

    if (allFilled && !_isOtpLoading) {
      _verifyOtp();
    }
  }

  // Loading Bool
  void _setLoading(bool loading) {
    if (mounted) {
      setState(() {
        _isLoading = loading;
      });
    }
  }

  // Verify the Otp entered
  void _verifyOtp() {
    String otp = _otpControllers.map((controller) => controller.text).join();
    print('📱 _verifyOtp called with OTP: $otp');

    if (otp.length == 6) {
      print('✅ OTP validation passed, dispatching VerifyOtpRequested');

      setState(() {
        _isOtpLoading = true;
      });
      context.read<AuthBloc>().add(
        VerifyOtpRequested(phone: _completePhoneNumber, otp: otp),
      );
    } else {
      print('❌ OTP validation failed - length: ${otp.length}');
      CustomSnackBar.show(
        context,
        'Please enter complete 6-digit OTP',
        type: SnackBarType.error,
      );
    }
  }

  // Request Otp Code
  void _sendOtp() {
    print('📱 _sendOtp called with phone: $_completePhoneNumber');

    if (_formKey.currentState!.validate() &&
        _phoneError == null &&
        _phoneController.text.trim().isNotEmpty) {
      print('✅ Form validation passed, dispatching RequestOtpRequested');

      _setLoading(true);

      final currentState = context.read<AuthBloc>().state;
      if (currentState is AuthOtpSent) {
        context.read<AuthBloc>().add(CheckAuthStatus());

        Future.delayed(const Duration(milliseconds: 50), () {
          if (mounted) {
            context.read<AuthBloc>().add(
              RequestOtpRequested(_completePhoneNumber),
            );
          }
        });
      } else {
        context.read<AuthBloc>().add(RequestOtpRequested(_completePhoneNumber));
      }
    } else {
      print('❌ Form validation failed');
      _setLoading(false);
      CustomSnackBar.show(
        context,
        'Please enter a valid phone number',
        type: SnackBarType.error,
      );
    }
  }

  // Resend the Otp code
  void _resendOtp() {
    if (_canResend && !_isLoading) {
      print('🔄 _resendOtp for phone: $_completePhoneNumber');

      _setLoading(true);

      context.read<AuthBloc>().add(RequestOtpRequested(_completePhoneNumber));

      _startResendTimer();
      _clearOtpFields();
    }
  }

  String _formatCountdown() {
    int minutes = _resendCountdown ~/ 60;
    int seconds = _resendCountdown % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  Widget _getCurrentScreen(AppLocalizations localization) {
    if (isCompanySignInScreen) {
      return Container(
        key: const ValueKey('companySignIn'),
        child: CompanySignInPage(onBackPressed: _backToSignInFromCompany),
      );
    } else if (isCompanyScreen) {
      return Container(
        key: const ValueKey('company'),
        child: CompanySelectionPage(onBackPressed: _backToSignInFromCompany),
      );
    } else if (isOtpScreen) {
      return Container(
        key: const ValueKey('otp'),
        child: _buildOtpContent(localization),
      );
    } else {
      return Container(
        key: const ValueKey('signin'),
        child: _buildSignInContent(localization),
      );
    }
  }

  void _showCompanySelectionBottomSheet(BuildContext context) {
    _searchController.clear();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setModalState) {
          final filteredCompanies = companiesMock.where((company) {
            final searchLower = _searchController.text.toLowerCase();
            return company.name.toLowerCase().contains(searchLower) ||
                company.code.toLowerCase().contains(searchLower);
          }).toList();

          return Container(
            height: MediaQuery.of(context).size.height * 0.75,
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(top: 12, bottom: 16),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),

                const SizedBox(height: 16),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search Contractor',
                      hintStyle: TextStyle(
                        fontSize: 13,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Icon(
                          Icons.search,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide(color: primaryColor),
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 50,
                        vertical: 10,
                      ),
                    ),
                    onChanged: (value) {
                      setModalState(() {});
                    },
                  ),
                ),

                const SizedBox(height: 16),

                Expanded(
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: filteredCompanies.length,
                    separatorBuilder: (context, index) =>
                        Divider(height: 1, color: Colors.grey[200]),
                    itemBuilder: (context, index) {
                      final company = filteredCompanies[index];
                      final isSelected = _selectedCompany?.id == company.id;

                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        leading: Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              company.code,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          company.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: isSelected ? primaryColor : Colors.black,
                          ),
                        ),
                        //   subtitle: Text(
                        //   company.code,
                        //   style: TextStyle(
                        //     color: isSelected
                        //         ? primaryColor.withOpacity(0.7)
                        //         : Colors.grey[600],
                        //     fontSize: 12,
                        //   ),
                        // ),
                        trailing: isSelected
                            ? Icon(Icons.check_circle, color: primaryColor)
                            : Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.grey[400],
                              ),
                        onTap: () {
                          setState(() {
                            _selectedCompany = company;
                          });
                          Navigator.pop(context);

                          CustomSnackBar.show(
                            context,
                            'Selected: ${company.name}',
                            type: SnackBarType.success,
                          );

                          Future.delayed(const Duration(milliseconds: 500), () {
                            if (mounted) {
                              _showCompanySignInScreen();
                            }
                          });
                        },
                      );
                    },
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).padding.bottom),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          print('🔥 LoginPage listener: ${state.runtimeType}');

          state.whenOrNull(
            // if Fail
            failure: (message) {
              print('❌ LoginPage: Handling failure state: $message');
              _setLoading(false);
              setState(() {
                _isOtpLoading = false;
                _isCompletingLoginFlow = false;
              });
              CustomSnackBar.show(context, message, type: SnackBarType.error);
              _backToSignInFromOtp();
            },

            // if OtpSent
            otpSent: (data) {
              print('✅ LoginPage: Handling otpSent state: ${data.message}');
              _setLoading(false);
              CustomSnackBar.show(
                context,
                data.message,
                type: SnackBarType.success,
              );
              print('🔄 _showOtpScreen called');

              _pageController.forward().then((_) {
                if (mounted) {
                  setState(() {
                    isSignInScreen = false;
                    isOtpScreen = true;
                  });
                  _pageController.reset();
                }
              });
              _startResendTimer();
            },

            // if already authenticate
            authenticatedNeedsCompany: (tokens, admin) {
              print(
                '🎉 LoginPage: User authenticated but needs company selection!',
              );
              setState(() {
                _isOtpLoading = false;
                _isCompletingLoginFlow = true;
              });
              _showCompanyScreen();
            },

            // after authenticate with Company
            authenticated: (tokens, admin, companyId) {
              print('✅ LoginPage: User fully authenticated with company!');
              setState(() {
                _isOtpLoading = false;
                _isCompletingLoginFlow = false;
              });
            },

            // if unauthenticate
            unauthenticated: () {
              print('🔄 LoginPage: Handling unauthenticated state');
              _setLoading(false);
              setState(() {
                _isOtpLoading = false;
                _isCompletingLoginFlow = false;
              });
              _backToSignInFromOtp();
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

            // Bottom Sheet
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
                          height: MediaQuery.of(context).size.height * 0.75,
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
                            child: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                    return SlideTransition(
                                      position:
                                          Tween<Offset>(
                                            begin: const Offset(1.0, 0.0),
                                            end: Offset.zero,
                                          ).animate(
                                            CurvedAnimation(
                                              parent: animation,
                                              curve: Curves.easeInOutCubic,
                                            ),
                                          ),
                                      child: child,
                                    );
                                  },
                              child: _getCurrentScreen(localization),
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
              disableLengthCheck: true,
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
              child: ElevatedButton(
                onPressed: (_isLoading || _phoneController.text.trim().isEmpty)
                    ? null
                    : _sendOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  disabledBackgroundColor: Colors.grey[300],
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: (_isLoading && _phoneController.text.trim().isNotEmpty)
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
            'Please enter the 6 digit code sent to your\nmobile number $_completePhoneNumber',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
          ),

          const SizedBox(height: 32),

          // OTP Input Fields
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(6, (index) {
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
            onPressed: (_canResend && !_isLoading) ? _resendOtp : null,
            child: Text(
              'Resend Code',
              style: TextStyle(
                fontSize: 16,
                color: (_canResend && !_isLoading)
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
              onPressed: _isOtpLoading
                  ? null
                  : () {
                      String otp = _otpControllers
                          .map((controller) => controller.text)
                          .join();

                      if (otp.length == 6) {
                        _verifyOtp();
                      } else {
                        CustomSnackBar.show(
                          context,
                          'Please enter complete 6-digit OTP',
                          type: SnackBarType.error,
                        );
                      }
                    },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                disabledBackgroundColor: Colors.grey[300],
                padding: const EdgeInsets.symmetric(vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: _isOtpLoading
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
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
            ),
          ),

          const SizedBox(height: 10),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: _isOtpLoading ? null : _backToSignInFromOtp,
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: primaryColor),
                padding: const EdgeInsets.symmetric(vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                'Back to sign in',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: _isOtpLoading ? Colors.grey : primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildSelectCompany(AppLocalizations localization) {
  //   return Padding(
  //     padding: const EdgeInsets.all(24),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: [
  //         Center(
  //           child: Container(
  //             width: 40,
  //             height: 4,
  //             margin: const EdgeInsets.only(bottom: 24),
  //             decoration: BoxDecoration(
  //               color: Colors.grey[300],
  //               borderRadius: BorderRadius.circular(2),
  //             ),
  //           ),
  //         ),

  //         const Text(
  //           'Choose Company to Manage',
  //           textAlign: TextAlign.center,
  //           style: TextStyle(
  //             fontSize: 30,
  //             fontWeight: FontWeight.bold,
  //             color: Colors.black,
  //           ),
  //         ),

  //         const SizedBox(height: 20),

  //         TextButton(
  //           style: TextButton.styleFrom(
  //             padding: EdgeInsets.zero,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(50),
  //             ),
  //             backgroundColor: Colors.grey.shade200,
  //           ),
  //           onPressed: () {
  //             _showCompanySelectionBottomSheet(context);
  //           },
  //           child: Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
  //             child: Row(
  //               children: [
  //                 Icon(
  //                   Icons.search,
  //                   size: 30,
  //                   color: Colors.black.withOpacity(0.6),
  //                 ),
  //                 SizedBox(width: 20),
  //                 Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: [
  //                     Text(
  //                       'Select Company',
  //                       style: TextStyle(
  //                         color: Colors.black,
  //                         fontWeight: FontWeight.w500,
  //                       ),
  //                     ),
  //                     Text(
  //                       'Choose which company you want to manage',
  //                       style: TextStyle(
  //                         color: Colors.black.withOpacity(0.7),
  //                         fontSize: 12,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),

  //         SizedBox(height: 20),

  //         Container(
  //           margin: const EdgeInsets.only(bottom: 50),
  //           child: Opacity(
  //             opacity: _fadeAnimation.value,
  //             child: Image.asset(
  //               'assets/images/choose_company_vector.png',
  //               height: 200,
  //               width: 350,
  //               fit: BoxFit.contain,
  //             ),
  //           ),
  //         ),

  //         SizedBox(
  //           width: double.infinity,
  //           child: OutlinedButton(
  //             onPressed: _backToSignInFromCompany,
  //             style: OutlinedButton.styleFrom(
  //               side: BorderSide(color: primaryColor),
  //               padding: const EdgeInsets.symmetric(vertical: 4),
  //               shape: RoundedRectangleBorder(
  //                 borderRadius: BorderRadius.circular(14),
  //               ),
  //             ),
  //             child: const Text(
  //               'Back to sign in',
  //               style: TextStyle(
  //                 fontSize: 16,
  //                 fontWeight: FontWeight.w600,
  //                 color: primaryColor,
  //               ),
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildCompanySignIn(AppLocalizations localization) {
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

          Row(
            children: [
              IconButton(
                onPressed: _backToCompanySelection,
                icon: Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
              // const SizedBox(width: 5),
              const Text(
                "You're signing in as",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ],
          ),

          const SizedBox(height: 32),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Color.fromARGB(255, 73, 124, 252).withOpacity(0.1),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey[200]!, width: 1),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      _selectedCompany?.code ?? 'RC',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    _selectedCompany?.name ?? 'ROADCARE (M) SDN BHD',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),

          // Sign in button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                // CustomSnackBar.show(
                //   context,
                //   'Welcome to ${_selectedCompany?.name ?? 'RCLink'}!',
                //   type: SnackBarType.success,
                // );

                context.read<AuthBloc>().add(
                  CompanySelected(_selectedCompany?.id ?? '1'),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                disabledBackgroundColor: Colors.grey[300],
                padding: const EdgeInsets.symmetric(vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Sign in to RCLink',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
