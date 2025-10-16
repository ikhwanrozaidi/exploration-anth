import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rclink_app/routes/app_router.dart';
import 'core/config/flavor_config.dart';
import 'core/di/injection.dart';
import 'core/services/token_expiry_monitor_service.dart';
import 'features/locale/presentation/bloc/locale_bloc.dart';
import 'features/locale/presentation/bloc/locale_event.dart';
import 'features/locale/presentation/bloc/locale_state.dart';
import 'features/locale/presentation/widgets/app_localization.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/company/presentation/bloc/company_bloc.dart';
import 'features/rbac/presentation/bloc/rbac_bloc.dart';
import 'shared/widgets/auth_wrapper.dart';

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
        BlocProvider<CompanyBloc>(create: (context) => getIt<CompanyBloc>()),
        BlocProvider<RbacBloc>(create: (context) => getIt<RbacBloc>()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // App came back to foreground - recheck token expiry
      final tokenMonitor = getIt<TokenExpiryMonitor>();
      tokenMonitor.startMonitoring();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

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
