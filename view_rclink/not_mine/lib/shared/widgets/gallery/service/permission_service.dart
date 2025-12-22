import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:io';

import '../../location_service_check_dialog.dart';

class PermissionService {
  static Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.request();

    if (status.isDenied || status.isPermanentlyDenied) {
      // Show dialog to open settings
      return false;
    }

    return status.isGranted;
  }

  static Future<bool> requestStoragePermission() async {
    // For Android 13+ (API 33+), we need to use photos permission
    if (Platform.isAndroid) {
      final androidInfo = await _getAndroidVersion();
      if (androidInfo >= 33) {
        // Android 13+ uses photos permission instead of storage
        final status = await Permission.photos.request();

        if (status.isDenied || status.isPermanentlyDenied) {
          return false;
        }

        return status.isGranted || status.isLimited;
      } else {
        // Android 12 and below use storage permission
        final status = await Permission.storage.request();

        if (status.isDenied || status.isPermanentlyDenied) {
          return false;
        }

        return status.isGranted || status.isLimited;
      }
    } else if (Platform.isIOS) {
      // iOS uses photos permission
      final status = await Permission.photos.request();

      if (status.isDenied || status.isPermanentlyDenied) {
        return false;
      }

      return status.isGranted || status.isLimited;
    }

    return true;
  }

  static Future<int> _getAndroidVersion() async {
    if (Platform.isAndroid) {
      final deviceInfo = DeviceInfoPlugin();
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.version.sdkInt;
    }
    return 0;
  }

  static Future<bool> requestLocationPermission() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return false;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return false;
    }

    return true;
  }

  static Future<Position?> getCurrentLocation() async {
    try {
      final hasPermission = await requestLocationPermission();
      if (!hasPermission) return null;

      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      return null;
    }
  }

  static Future<void> openAppSettings() async {
    await openAppSettings();
  }

  /// Checks if location service is enabled and shows dialog if not
  /// Returns true if enabled or user enabled it, false otherwise
  static Future<bool> checkLocationService(BuildContext context) async {
    final isEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isEnabled && context.mounted) {
      // Import the LocationServiceCheckDialog at the top of the file
      final shouldContinue = await LocationServiceCheckDialog.check(context);
      if (!shouldContinue) {
        return false;
      }

      // Check again after user potentially enabled it
      return await Geolocator.isLocationServiceEnabled();
    }

    return isEnabled;
  }
}
