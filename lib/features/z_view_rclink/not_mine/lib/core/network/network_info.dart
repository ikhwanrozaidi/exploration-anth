import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

// NetworkInfo interface
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

@LazySingleton(as: NetworkInfo)
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity) {
    print('🌐 NetworkInfoImpl: Constructor called with Connectivity instance');
  }

  @override
  Future<bool> get isConnected async {
    try {
      print('🌐 NetworkInfoImpl: Checking connectivity...');
      final connectivityResult = await connectivity.checkConnectivity();
      print('🌐 NetworkInfoImpl: Connectivity result: $connectivityResult');

      if (connectivityResult.contains(ConnectivityResult.none)) {
        print('🌐 NetworkInfoImpl: No connectivity detected');
        return false;
      }

      // Additional check to ensure actual internet connectivity
      print('🌐 NetworkInfoImpl: Performing DNS lookup to google.com...');
      final result = await InternetAddress.lookup('google.com');
      final isConnected = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      print('🌐 NetworkInfoImpl: DNS lookup result: ${isConnected ? "Connected" : "Not connected"}');
      return isConnected;
    } catch (e, stackTrace) {
      print('❌ NetworkInfoImpl: Error checking connectivity: $e');
      print('❌ NetworkInfoImpl: Stack trace: $stackTrace');
      return false;
    }
  }
}
