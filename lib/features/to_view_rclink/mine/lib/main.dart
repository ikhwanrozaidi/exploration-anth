import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rclink_app/routes/app_router.dart';
import 'core/config/flavor_config.dart';
import 'core/di/injection.dart'; // Add dependency injection
import 'features/locale/presentation/bloc/locale_bloc.dart';
import 'features/locale/presentation/bloc/locale_event.dart';
import 'features/locale/presentation/bloc/locale_state.dart';
import 'features/locale/presentation/widgets/app_localization.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'shared/widgets/auth_wrapper.dart';
// import other blocs as needed

void main() {
  // Initialize dependency injection
  configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LocaleBloc>(
          create: (context) => LocaleBloc()..add(const LoadSavedLocale()),
        ),
        BlocProvider<AuthBloc>(create: (context) => getIt<AuthBloc>()),
        // Add other blocs here as needed
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
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
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
