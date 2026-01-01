import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/config/flavor_config.dart';
import 'core/di/injection.dart';

import 'features/dashboard/presentation/bloc/dashboard_bloc.dart';
import 'features/locale/presentation/bloc/locale_bloc.dart';
import 'features/locale/presentation/bloc/locale_event.dart';
import 'features/locale/presentation/bloc/locale_state.dart';
import 'features/locale/presentation/widgets/app_localization.dart';
import 'features/login/presentation/bloc/login_bloc.dart';
import 'features/onboarding/presentation/bloc/onboarding_bloc.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'features/profile/presentation/bloc/profile_event.dart';
import 'routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LocaleBloc>(
          create: (context) =>
              getIt<LocaleBloc>()..add(const LoadSavedLocale()),
        ),

        BlocProvider<LoginBloc>(create: (context) => getIt<LoginBloc>()),

        BlocProvider<OnboardingBloc>(
          create: (context) => getIt<OnboardingBloc>(),
        ),

        BlocProvider<ProfileBloc>(
          create: (context) =>
              getIt<ProfileBloc>()..add(const ProfileEvent.loadProfile()),
          lazy: false, // Load immediately on app start
        ),

        // BlocProvider<DashboardBloc>(
        //   create: (context) => getIt<DashboardBloc>(),
        //   lazy: true,
        // ),
        // BlocProvider<OngoingBloc>(
        //   create: (context) => getIt<OngoingBloc>(),
        //   lazy: true,
        // ),
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
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                textTheme: GoogleFonts.poppinsTextTheme(
                  Theme.of(context).textTheme,
                ),
              ),
              child: child!,
            );
          },
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
