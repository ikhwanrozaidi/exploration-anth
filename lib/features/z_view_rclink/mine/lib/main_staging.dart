import 'dart:io';
import 'core/config/flavor_config.dart';
import 'core/di/injection.dart';
import 'main.dart' as runner;

Future<void> main() async {
  print('🎯 main_staging: Starting staging environment...');
  print('🎯 Platform: ${Platform.operatingSystem} - ${Platform.isIOS ? "iOS" : Platform.isAndroid ? "Android" : "Other"}');

  FlavorConfig(
    flavor: Flavor.staging,
    appTitle: 'RCLink Staging',
    apiBaseUrl: 'https://api-staging.rclink.my',
    debugShowCheckedModeBanner: true,
  );
  print('✅ main_staging: FlavorConfig initialized');

  print('🎯 main_staging: Configuring dependencies...');
  await configureDependencies();
  print('✅ main_staging: Dependencies configured, calling runner.main()...');

  runner.main();
}
