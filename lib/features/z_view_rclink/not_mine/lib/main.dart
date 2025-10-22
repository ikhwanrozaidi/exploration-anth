import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rclink_app/routes/app_router.dart';
import 'core/config/flavor_config.dart';
import 'core/di/injection.dart'; // Add dependency injection
import 'core/network/connectivity_service.dart';
import 'features/locale/presentation/bloc/locale_bloc.dart';
import 'features/locale/presentation/bloc/locale_event.dart';
import 'features/locale/presentation/bloc/locale_state.dart';
import 'features/locale/presentation/widgets/app_localization.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'features/company/presentation/bloc/company_bloc.dart';
import 'features/rbac/presentation/bloc/rbac_bloc.dart';
import 'shared/widgets/auth_wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  final connectivityService = getIt<ConnectivityService>();
  connectivityService.startMonitoring();

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
