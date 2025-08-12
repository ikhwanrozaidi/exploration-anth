import 'core/config/flavor_config.dart';
import 'core/dio/injection.dart';
import 'main.dart' as runner;

Future<void> main() async {
  FlavorConfig(
    flavor: Flavor.development,
    appTitle: 'Gatepay Dev',
    apiBaseUrl: 'https://secure.gatepay.dev',
    debugShowCheckedModeBanner: true,
  );

  await configureDependencies();
  runner.main();
}
