// lib/main.dart - Updated with LoginBloc
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:gatepay_app/features/transactionboard/presentation/bloc/transaction_bloc.dart';
import 'core/config/flavor_config.dart';
import 'core/dio/injection.dart';

import 'features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'features/locale/presentation/bloc/locale_bloc.dart';
import 'features/locale/presentation/bloc/locale_event.dart';
import 'features/locale/presentation/bloc/locale_state.dart';
import 'features/locale/presentation/widgets/app_localization.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';

// Add login and onboarding blocs
import 'features/login/presentation/bloc/login_bloc.dart';
import 'features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'features/pay_boarding/features/escrow_pay/presentation/bloc/escrow_pay_bloc.dart';
import 'features/pay_boarding/features/qr_pay/presentation/bloc/qrpay_bloc.dart';
import 'features/pay_boarding/presentation/bloc/pay_boarding_bloc.dart';
import 'features/transactionboard/features/ongoing/presentation/bloc/ongoing_bloc.dart';
import 'routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LocaleBloc>(
          create: (context) => getIt<LocaleBloc>()..add(const LoadSavedLocale()),
        ),
        BlocProvider<AuthBloc>(
          create: (context) => getIt<AuthBloc>(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => getIt<LoginBloc>(),
        ),
        BlocProvider<OnboardingBloc>(
          create: (context) => getIt<OnboardingBloc>(),
        ),
        BlocProvider<DashboardBloc>(
          create: (context) => getIt<DashboardBloc>(),
          lazy: true,
        ),
        BlocProvider<OngoingBloc>(
          create: (context) => getIt<OngoingBloc>(),
          lazy: true,
        ),
        BlocProvider<PayBoardingBloc>(
          create: (context) => getIt<PayBoardingBloc>(),
          lazy: true,
        ),
        BlocProvider<EscrowpayBloc>(
          create: (context) => getIt<EscrowpayBloc>(),
          lazy: true,
        ),
        BlocProvider<QrpayBloc>(
          create: (context) => getIt<QrpayBloc>(),
          lazy: true,
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocaleBloc, LocaleState>(
      builder: (context, localeState) {
        return MaterialApp.router(
          routerConfig: appRouter,
          title: FlavorConfig.instance.appTitle,
          debugShowCheckedModeBanner:
              FlavorConfig.instance.debugShowCheckedModeBanner,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),

          // Localization
          locale: localeState.locale,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: LocaleState.supportedLocales,
        );
      },
    );
  }
}