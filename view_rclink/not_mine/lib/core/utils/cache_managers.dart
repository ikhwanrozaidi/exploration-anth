import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// Custom cache manager for daily report images
///
/// Configuration:
/// - Cache key: 'daily_report_images'
/// - Stale period: 30 days (images expire after 30 days)
/// - Max cache objects: 200 images
///
/// This separates daily report image cache from other caches in the app,
/// making it easier to manage and clear if needed.
final dailyReportImageCacheManager = CacheManager(
  Config(
    'daily_report_images',
    stalePeriod: const Duration(days: 30),
    maxNrOfCacheObjects: 200,
  ),
);
