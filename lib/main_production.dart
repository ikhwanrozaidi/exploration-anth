import 'core/config/flavor_config.dart';
import 'core/di/injection.dart';
import 'main.dart' as runner;

Future<void> main() async {
  FlavorConfig(
    flavor: Flavor.production,
    appTitle: 'RCLink',
    apiBaseUrl: 'https://api.rclink.com',
    debugShowCheckedModeBanner: false,
  );

  await configureDependencies();
  runner.main();
}
