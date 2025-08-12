enum Flavor { development, staging, production }

class FlavorConfig {
  static FlavorConfig? _instance;
  static FlavorConfig get instance => _instance!;

  final Flavor flavor;
  final String appTitle;
  final String apiBaseUrl;
  final bool debugShowCheckedModeBanner;

  FlavorConfig({
    required this.flavor,
    required this.appTitle,
    required this.apiBaseUrl,
    required this.debugShowCheckedModeBanner,
  }) {
    _instance = this;
  }

  bool get isDevelopment => flavor == Flavor.development;
  bool get isStaging => flavor == Flavor.staging;
  bool get isProduction => flavor == Flavor.production;

  static String get flavorName => _instance?.flavor.name ?? 'unknown';
}
