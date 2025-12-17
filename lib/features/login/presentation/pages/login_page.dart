import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../locale/presentation/widgets/app_localization.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';
import '../widgets/otp_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordObscured = true;
  bool _rememberMe = false;

  @override
  void initState() {
    super.initState();
    context.read<LoginBloc>().add(const LoginLoadSavedCredentials());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginBloc>().add(
        LoginSubmitted(
          _emailController.text.trim(),
          _passwordController.text,
          rememberMe: _rememberMe,
        ),
      );
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordObscured = !_isPasswordObscured;
    });
  }

  void _onRememberMeChanged(bool? value) {
    setState(() {
      _rememberMe = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            state.when(
              initial: () {},
              loading: () {},
              credentialsLoaded: (email, password) {
                _emailController.text = email;
                setState(() {
                  _rememberMe = true;
                });
              },
              otpRequired: (email, message) {
                _showOtpDialog(context, email);
              },
              authenticated: (authResult, user) {
                print('✅ LoginPage: Authenticated! User: ${user.email}');
              },
              success: (user) {
                print('✅ LoginPage: Success! User: ${user.email}');
              },
              unauthenticated: () {},
              loggedOut: () {},
              failure: (message) {
                CustomSnackBar.show(context, message, type: SnackBarType.error);
              },
              forgotPasswordOtpRequired: (email, message) {},
              changePasswordRequired: (email, message) {},
              passwordChanged: (message) {},
            );
          },

          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: rprimaryColor.withOpacity(0.3),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back_rounded,
                        color: Color.fromARGB(255, 0, 69, 94),
                        size: 25,
                      ),
                    ),
                  ),

                  SizedBox(height: 30),

                  Text(
                    'Hey, Welcome Back!',
                    style: GoogleFonts.poppins(
                      fontSize: ResponsiveHelper.fontSize(context, base: 24),
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),

                  SizedBox(height: 60),

                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Email',
                          style: GoogleFonts.poppins(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 14,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _emailController,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: tPrimaryBackground,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            hintText: localization.auth('emailHint'),
                            hintStyle: TextStyle(
                              color: rprimaryColor.withOpacity(0.6),
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 14,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return localization.auth('emailRequired');
                            }
                            if (!value.contains('@')) {
                              return localization.auth('emailInvalid');
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 10),

                        // Password field
                        Text(
                          localization.auth('password'),
                          style: GoogleFonts.poppins(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 14,
                            ),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: _passwordController,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: tPrimaryBackground,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide.none,
                            ),
                            hintText: localization.auth('passwordHint'),
                            hintStyle: TextStyle(
                              color: rprimaryColor.withOpacity(0.6),
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 14,
                              ),
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordObscured
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: tPrimaryColor.withOpacity(0.7),
                              ),
                              onPressed: _togglePasswordVisibility,
                            ),
                          ),
                          obscureText: _isPasswordObscured,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return localization.auth('passwordRequired');
                            }
                            if (value.length < 6) {
                              return localization.auth('passwordTooShort');
                            }
                            return null;
                          },
                        ),

                        const SizedBox(height: 20),

                        // Remember me and forgot password
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Transform.scale(
                                  scale: 0.8,
                                  child: Switch(
                                    value: _rememberMe,
                                    onChanged: _onRememberMeChanged,
                                    activeColor: tPrimaryColor,
                                    inactiveThumbColor: Colors.grey,
                                    inactiveTrackColor: Colors.grey[300],
                                  ),
                                ),
                                Text(
                                  _rememberMe
                                      ? localization.auth('rememberMe')
                                      : localization.auth('forgetMe'),
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                CustomSnackBar.show(
                                  context,
                                  'This feature is coming soon...',
                                  type: SnackBarType.comingsoon,
                                );
                              },
                              child: Text(
                                localization.auth('forgotPassword'),
                                style: TextStyle(
                                  color: rprimaryColor,
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 120),

                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: state is LoginLoading
                                ? null
                                : _onLoginPressed,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: rprimaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 2,
                            ),
                            child: state is LoginLoading
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
                                    localization.auth('signIn'),
                                    style: TextStyle(
                                      fontSize: ResponsiveHelper.fontSize(
                                        context,
                                        base: 14,
                                      ),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Sign up link
                        Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              text: localization.auth('noAccount'),
                              style: TextStyle(
                                fontSize: ResponsiveHelper.fontSize(
                                  context,
                                  base: 14,
                                ),
                                color: Colors.black87,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: ' ${localization.auth('register')}',
                                  style: TextStyle(
                                    color: rprimaryColor,
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 14,
                                    ),
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      CustomSnackBar.show(
                                        context,
                                        'This feature is coming soon...',
                                        type: SnackBarType.comingsoon,
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(height: 40),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void _showOtpDialog(BuildContext context, String email) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => OtpDialog(
        email: email,
        onOtpSubmitted: (otp) {
          context.read<LoginBloc>().add(LoginOtpSubmitted(email, otp));
          Navigator.of(dialogContext).pop();
        },
        onResendOtp: () {
          context.read<LoginBloc>().add(
            LoginSubmitted(
              _emailController.text.trim(),
              _passwordController.text,
              rememberMe: _rememberMe,
            ),
          );
        },
      ),
    );
  }
}
