import 'core/config/flavor_config.dart';
import 'core/dio/injection.dart';
import 'main.dart' as runner;

Future<void> main() async {
  FlavorConfig(
    flavor: Flavor.production,
    appTitle: 'Gatepay',
    apiBaseUrl: 'https://secure.gatepay.dev',
    debugShowCheckedModeBanner: false,
  );

  await configureDependencies();
  runner.main();
}
