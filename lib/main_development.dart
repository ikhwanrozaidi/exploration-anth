import 'package:flutter/widgets.dart';
import 'core/config/flavor_config.dart';
import 'core/di/injection.dart';
import 'main.dart' as runner;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig(
    flavor: Flavor.development,
    appTitle: 'Gatepay Dev',
    apiBaseUrl: 'https://secure.gatepay.dev',
    debugShowCheckedModeBanner: true,
  );

  await configureDependencies();
  runner.main();
}
