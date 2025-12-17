import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/route_constants.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import '../../features/login/presentation/bloc/login_state.dart';

class AuthWrapper extends StatelessWidget {
  final Widget child;

  const AuthWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final loginBloc = context.read<LoginBloc>();
    print('🎨 AuthWrapper: LoginBloc hashCode: ${loginBloc.hashCode}');
    print('🎨 AuthWrapper: Current state: ${loginBloc.state}');

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        print('👂👂👂 AuthWrapper LISTENER TRIGGERED: $state');

        state.when(
          initial: () {
            print('👂 Listener: initial - triggering CheckAuthStatus');
          },
          loading: () {
            print('👂 Listener: loading');
          },
          credentialsLoaded: (_, __) {},
          otpRequired: (_, __) {},
          authenticated: (_, user) {
            print('👂👂👂 Listener: AUTHENTICATED! User: ${user.email}');
            print('👂 Navigating to: ${AppRoutePath.main}');
            context.go(AppRoutePath.main);
          },
          success: (user) {
            print('👂👂👂 Listener: SUCCESS! User: ${user.email}');
            print('👂 Navigating to: ${AppRoutePath.main}');
            context.go(AppRoutePath.main);
          },
          unauthenticated: () {
            print('👂 Listener: unauthenticated - going to onboarding');
            context.go(AppRoutePath.onboarding);
          },
          loggedOut: () {
            print('👂 Listener: loggedOut - going to onboarding');
            context.go(AppRoutePath.onboarding);
          },
          failure: (message) {
            print('👂 Listener: failure - $message');
          },
          forgotPasswordOtpRequired: (_, __) {},
          changePasswordRequired: (_, __) {},
          passwordChanged: (_) {},
        );
      },
      child: child,
    );
  }
}
