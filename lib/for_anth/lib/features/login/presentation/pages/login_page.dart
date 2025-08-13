// lib/features/auth/presentation/pages/login_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/route_constants.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _otpController = TextEditingController();
  final _forgotEmailController = TextEditingController();
  final _forgotOtpController = TextEditingController();
  final _newPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
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
    _otpController.dispose();
    _forgotEmailController.dispose();
    _forgotOtpController.dispose();
    _newPasswordController.dispose();
    super.dispose();
  }

  void _onLoginPressed() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<LoginBloc>().add(
        LoginSubmitted(
          _emailController.text,
          _passwordController.text,
          rememberMe: _rememberMe,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            credentialsLoaded: (email, password) {
              _emailController.text = email;
              // Don't auto-fill password for security, but show remember me as checked
              setState(() {
                _rememberMe = true;
              });
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('Welcome back, $email!')));
            },
            otpRequired: (email, message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
            authenticated: (authResult, admin) {
              context.go(AppRoutePath.main);
            },
            success: (admin) {
              context.go(AppRoutePath.main);
            },
            unauthenticated: () {},
            loggedOut: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Logged out successfully')),
              );
            },
            failure: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(message), backgroundColor: Colors.red),
              );
            },
            forgotPasswordOtpRequired: (email, message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
            changePasswordRequired: (email, message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
            },
            passwordChanged: (message) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(message)));
              // Reset to login form
              setState(() {
                _forgotEmailController.clear();
                _forgotOtpController.clear();
                _newPasswordController.clear();
              });
            },
          );
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: state.when(
                initial: () => _buildLoginForm(),
                loading: () => _buildLoadingWidget(),
                credentialsLoaded: (email, password) =>
                    _buildLoginForm(),
                otpRequired: (email, message) => _buildOtpForm(email),
                authenticated: (authResult, admin) => _buildSuccessWidget(),
                success: (admin) => _buildSuccessWidget(),
                unauthenticated: () => _buildLoginForm(),
                loggedOut: () => _buildLoginForm(),
                failure: (message) => _buildLoginForm(),
                forgotPasswordOtpRequired: (email, message) =>
                    _buildForgotOtpForm(email),
                changePasswordRequired: (email, message) =>
                    _buildChangePasswordForm(email),
                passwordChanged: (message) => _buildLoginForm(),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Welcome Back',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(
                r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
              ).hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            obscureText: _obscurePassword,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Checkbox(
                value: _rememberMe,
                onChanged: (value) {
                  setState(() {
                    _rememberMe = value ?? false;
                  });
                },
              ),
              const Text('Remember me'),
              const Spacer(),
              TextButton(
                onPressed: () => _showForgotPasswordDialog(),
                child: const Text('Forgot Password?'),
              ),
            ],
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _onLoginPressed,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Login', style: TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => context.go(AppRoutePath.register),
            child: const Text("Don't have an account? Sign Up"),
          ),
        ],
      ),
    );
  }

  Widget _buildOtpForm(String email) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Enter OTP',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'We sent an OTP to $email',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 32),
        TextFormField(
          controller: _otpController,
          decoration: const InputDecoration(
            labelText: 'OTP',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.security),
          ),
          keyboardType: TextInputType.number,
          maxLength: 6,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter OTP';
            }
            if (value.length != 6) {
              return 'OTP must be 6 digits';
            }
            return null;
          },
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => _onOtpPressed(email),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text('Verify OTP', style: TextStyle(fontSize: 16)),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            // Reset to login form
            setState(() {
              _otpController.clear();
            });
          },
          child: const Text('Back to Login'),
        ),
      ],
    );
  }

  Widget _buildForgotOtpForm(String email) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Forgot Password OTP',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'We sent an OTP to $email',
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 32),
        TextFormField(
          controller: _forgotOtpController,
          decoration: const InputDecoration(
            labelText: 'OTP',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.security),
          ),
          keyboardType: TextInputType.number,
          maxLength: 6,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => _onForgotOtpPressed(email),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text('Verify OTP', style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  Widget _buildChangePasswordForm(String email) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          'Change Password',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        TextFormField(
          controller: _newPasswordController,
          decoration: const InputDecoration(
            labelText: 'New Password',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.lock),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () => _onChangePasswordPressed(email),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: const Text('Change Password', style: TextStyle(fontSize: 16)),
        ),
      ],
    );
  }

  Widget _buildLoadingWidget() {
    return const Column(
      children: [
        SizedBox(height: 100),
        CircularProgressIndicator(),
        SizedBox(height: 16),
        Text('Please wait...'),
      ],
    );
  }

  Widget _buildSuccessWidget() {
    return const Column(
      children: [
        SizedBox(height: 100),
        Icon(Icons.check_circle, color: Colors.green, size: 64),
        SizedBox(height: 16),
        Text(
          'Login Successful!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  void _onOtpPressed(String email) {
    if (_otpController.text.isNotEmpty) {
      context.read<LoginBloc>().add(
        LoginOtpSubmitted(email, _otpController.text),
      );
    }
  }

  void _onForgotOtpPressed(String email) {
    if (_forgotOtpController.text.isNotEmpty) {
      context.read<LoginBloc>().add(
        LoginForgotOtpSubmitted(email, _forgotOtpController.text),
      );
    }
  }

  void _onChangePasswordPressed(String email) {
    if (_newPasswordController.text.isNotEmpty) {
      context.read<LoginBloc>().add(
        LoginChangePasswordRequested(email, _newPasswordController.text),
      );
    }
  }

  void _showForgotPasswordDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Forgot Password'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('Enter your email address:'),
            const SizedBox(height: 16),
            TextFormField(
              controller: _forgotEmailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (_forgotEmailController.text.isNotEmpty) {
                Navigator.of(context).pop();
                context.read<LoginBloc>().add(
                  LoginForgotPasswordRequested(_forgotEmailController.text),
                );
              }
            },
            child: const Text('Send OTP'),
          ),
        ],
      ),
    );
  }
}
