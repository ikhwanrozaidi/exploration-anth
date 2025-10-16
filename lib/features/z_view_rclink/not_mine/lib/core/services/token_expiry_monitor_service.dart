// lib/core/services/token_expiry_monitor.dart
import 'dart:async';
import 'package:injectable/injectable.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';

@lazySingleton
class TokenExpiryMonitor {
  final AuthLocalDataSource _localDataSource;

  Timer? _expiryTimer;
  Timer? _warningTimer;
  bool _isMonitoring = false;

  // Stream controllers for events
  final _tokenExpiredController = StreamController<void>.broadcast();
  final _tokenExpiringController = StreamController<Duration>.broadcast();

  Stream<void> get onTokenExpired => _tokenExpiredController.stream;
  Stream<Duration> get onTokenExpiring => _tokenExpiringController.stream;

  TokenExpiryMonitor(this._localDataSource);

  /// Start monitoring token expiry
  Future<void> startMonitoring() async {
    // Prevent multiple simultaneous monitoring starts
    if (_isMonitoring) {
      print(
        '⚠️ TokenExpiryMonitor: Already monitoring, stopping previous timers',
      );
    }

    await stopMonitoring(); // Clear any existing timers
    _isMonitoring = true;

    final tokensResult = await _localDataSource.getTokens();

    await tokensResult.fold(
      (failure) async {
        print(
          '❌ TokenExpiryMonitor: Failed to get tokens - ${failure.message}',
        );
        _isMonitoring = false;
      },
      (tokens) async {
        if (tokens == null) {
          print('📝 TokenExpiryMonitor: No tokens found');
          _isMonitoring = false;
          return;
        }

        // Get refresh token expiry
        final expiresAtResult = await _localDataSource
            .getRefreshTokenExpiresAt();

        await expiresAtResult.fold(
          (failure) async {
            print(
              '❌ TokenExpiryMonitor: Failed to get expiry date - ${failure.message}',
            );
            _isMonitoring = false;
          },
          (expiresAt) async {
            if (expiresAt == null) {
              print('📝 TokenExpiryMonitor: No expiry date found');
              _isMonitoring = false;
              return;
            }

            final now = DateTime.now();
            final timeUntilExpiry = expiresAt.difference(now);

            print(
              '⏰ TokenExpiryMonitor: Token expires in ${timeUntilExpiry.inMinutes} minutes',
            );

            // Already expired
            if (timeUntilExpiry.isNegative) {
              print('🔴 TokenExpiryMonitor: Token already expired!');
              _handleTokenExpired();
              return;
            }

            // Schedule warning (e.g., 5 minutes before expiry)
            final warningTime = timeUntilExpiry - const Duration(minutes: 5);
            if (!warningTime.isNegative) {
              _warningTimer = Timer(warningTime, () {
                print(
                  '⚠️ TokenExpiryMonitor: Token expiring soon (5 minutes warning)',
                );
                _tokenExpiringController.add(const Duration(minutes: 5));
              });
            } else {
              // Token expires in less than 5 minutes, warn immediately
              print(
                '⚠️ TokenExpiryMonitor: Token expires in less than 5 minutes',
              );
              _tokenExpiringController.add(timeUntilExpiry);
            }

            // Schedule expiry event
            _expiryTimer = Timer(timeUntilExpiry, () {
              print('🔴 TokenExpiryMonitor: Token expired!');
              _handleTokenExpired();
            });

            print('✅ TokenExpiryMonitor: Monitoring started successfully');
          },
        );
      },
    );
  }

  /// Stop monitoring
  Future<void> stopMonitoring() async {
    _expiryTimer?.cancel();
    _warningTimer?.cancel();
    _expiryTimer = null;
    _warningTimer = null;
    _isMonitoring = false;
    print('🛑 TokenExpiryMonitor: Monitoring stopped');
  }

  void _handleTokenExpired() {
    if (!_isMonitoring) {
      print('⚠️ TokenExpiryMonitor: Not monitoring, ignoring expiry event');
      return;
    }

    _tokenExpiredController.add(null);
    stopMonitoring();
  }

  void dispose() {
    stopMonitoring();
    _tokenExpiredController.close();
    _tokenExpiringController.close();
  }
}
