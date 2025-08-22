import 'core/config/flavor_config.dart';
import 'core/di/injection.dart';
import 'main.dart' as runner;

Future<void> main() async {
  FlavorConfig(
    flavor: Flavor.staging,
    appTitle: 'RCLink Staging',
    apiBaseUrl: 'https://api-staging.rclink.com',
    debugShowCheckedModeBanner: true,
  );

  await configureDependencies();
  runner.main();
}
