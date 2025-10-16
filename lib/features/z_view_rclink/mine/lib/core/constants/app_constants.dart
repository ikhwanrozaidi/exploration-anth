class AppConstants {
  // Network timeouts (in milliseconds)
  static const int connectionTimeout = 30000; // 30 seconds
  static const int receiveTimeout = 30000; // 30 seconds
  static const int sendTimeout = 30000; // 30 seconds

  // API endpoints
  static const String apiVersion = 'v1';

  // Cache settings
  static const int maxCacheAge = 300; // 5 minutes in seconds
  static const int maxStaleAge = 86400; // 24 hours in seconds

  // Retry settings
  static const int maxRetries = 3;
  static const int retryDelay = 1000; // 1 second in milliseconds

  // Database settings
  static const String databaseName = 'rclink_app.db';
  static const int databaseVersion = 1;

  // Sync settings
  static const int syncBatchSize = 50;
  static const int syncRetryLimit = 5;

  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 8.0;

  // Animation durations
  static const int defaultAnimationDuration = 300; // milliseconds
  static const int fastAnimationDuration = 150; // milliseconds
  static const int slowAnimationDuration = 500; // milliseconds

  AppConstants._();
}
