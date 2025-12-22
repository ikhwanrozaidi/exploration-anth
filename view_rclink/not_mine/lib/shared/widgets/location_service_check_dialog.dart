import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import '../utils/responsive_helper.dart';
import '../utils/theme.dart';

/// A reusable widget that checks if location services are enabled
/// and shows a dialog prompting users to enable them if disabled.
///
/// Usage:
/// ```dart
/// final isEnabled = await LocationServiceCheckDialog.check(context);
/// if (isEnabled) {
///   // Proceed with location-dependent functionality
/// } else {
///   // Handle case where user cancelled or location is still disabled
/// }
/// ```
class LocationServiceCheckDialog {
  /// Checks if location service is enabled
  /// Returns true if enabled, false if disabled or user cancelled
  /// Shows dialog if location service is disabled
  static Future<bool> check(BuildContext context) async {
    final isEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isEnabled && context.mounted) {
      return await _showEnableLocationDialog(context) ?? false;
    }

    return isEnabled;
  }

  /// Shows a dialog asking user to enable location services
  /// Returns true if user tapped Continue (and settings were opened)
  /// Returns false if user tapped Cancel
  /// Returns null if dialog was dismissed
  static Future<bool?> _showEnableLocationDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: ResponsiveHelper.borderRadius(context, all: 20),
        ),
        elevation: 0,
        child: Container(
          constraints: ResponsiveHelper.getDialogConstraints(context),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: ResponsiveHelper.borderRadius(context, all: 20),
          ),
          padding: ResponsiveHelper.padding(context, all: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon
              Container(
                padding: ResponsiveHelper.padding(context, all: 16),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.location_off,
                  size: ResponsiveHelper.adaptive<double>(
                    context,
                    mobile: 48,
                    tablet: 56,
                    desktop: 64,
                  ),
                  color: primaryColor,
                ),
              ),
              SizedBox(height: ResponsiveHelper.spacing(context, 20)),

              // Title
              Text(
                'Location Service Disabled',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(context, base: 20),
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: ResponsiveHelper.spacing(context, 12)),

              // Description
              Text(
                'This feature requires location services to be enabled. Please turn on location services in your device settings.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(context, base: 14),
                  color: Colors.grey.shade600,
                  height: 1.5,
                ),
              ),
              SizedBox(height: ResponsiveHelper.spacing(context, 24)),

              // Buttons
              Row(
                children: [
                  // Cancel Button
                  Expanded(
                    child: TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      style: TextButton.styleFrom(
                        padding: ResponsiveHelper.padding(
                          context,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: ResponsiveHelper.borderRadius(
                            context,
                            all: 12,
                          ),
                          side: BorderSide(
                            color: Colors.grey.shade300,
                            width: 1,
                          ),
                        ),
                        foregroundColor: Colors.grey.shade700,
                      ),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 15,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: ResponsiveHelper.spacing(context, 12)),

                  // Continue Button
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        Navigator.of(context).pop(true);
                        // Open location settings
                        await Geolocator.openLocationSettings();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.white,
                        padding: ResponsiveHelper.padding(
                          context,
                          vertical: 14,
                        ),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: ResponsiveHelper.borderRadius(
                            context,
                            all: 12,
                          ),
                        ),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 15,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
