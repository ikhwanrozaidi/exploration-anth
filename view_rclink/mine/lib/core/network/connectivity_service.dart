import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@singleton
class ConnectivityService {
  final Connectivity _connectivity;
  StreamController<bool>? _connectivityController;

  ConnectivityService(this._connectivity) {
    print('📡 ConnectivityService: Constructor called with Connectivity instance');
  }

  Stream<bool> get connectivityStream {
    print('📡 ConnectivityService: connectivityStream getter called');
    _connectivityController ??= StreamController<bool>.broadcast();
    _connectivity.onConnectivityChanged.listen((result) {
      print('📡 ConnectivityService: Connectivity changed - $result');
      _connectivityController?.add(!result.contains(ConnectivityResult.none));
    });
    return _connectivityController!.stream;
  }

  bool get isCurrentlyConnected {
    // This is synchronous approximation, use checkConnectivity for accurate result
    return true;
  }

  void startMonitoring() {
    print('📡 ConnectivityService: startMonitoring() called');
    try {
      _connectivity.onConnectivityChanged.listen((result) {
        print('📡 ConnectivityService: Connectivity changed in monitoring - $result');
        _connectivityController?.add(!result.contains(ConnectivityResult.none));
      });
      print('📡 ConnectivityService: Monitoring started successfully');
    } catch (e, stackTrace) {
      print('❌ ConnectivityService: Error starting monitoring: $e');
      print('❌ ConnectivityService: Stack trace: $stackTrace');
    }
  }

  Future<bool> checkConnectivity() async {
    print('📡 ConnectivityService: checkConnectivity() called');
    try {
      final result = await _connectivity.checkConnectivity();
      final isConnected = !result.contains(ConnectivityResult.none);
      print('📡 ConnectivityService: checkConnectivity result: $result (connected: $isConnected)');
      return isConnected;
    } catch (e, stackTrace) {
      print('❌ ConnectivityService: Error checking connectivity: $e');
      print('❌ ConnectivityService: Stack trace: $stackTrace');
      return false;
    }
  }

  void dispose() {
    print('📡 ConnectivityService: dispose() called');
    _connectivityController?.close();
  }
}
