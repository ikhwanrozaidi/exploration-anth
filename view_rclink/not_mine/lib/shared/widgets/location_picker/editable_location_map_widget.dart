import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../utils/responsive_helper.dart';
import '../../utils/theme.dart';
import '../location_map_widget.dart';
import 'location_map_widget_2.dart';
import 'location_picker_page.dart';

/// Editable location map widget with "Update Location" button
///
/// Displays current location on map and allows user to update it
/// by opening LocationPickerPage
class EditableLocationMapWidget extends StatefulWidget {
  final double? latitude;
  final double? longitude;
  final String? markerTitle;
  final Function(double latitude, double longitude)? onLocationUpdated;

  const EditableLocationMapWidget({
    Key? key,
    this.latitude,
    this.longitude,
    this.markerTitle,
    this.onLocationUpdated,
  }) : super(key: key);

  @override
  State<EditableLocationMapWidget> createState() =>
      _EditableLocationMapWidgetState();
}

class _EditableLocationMapWidgetState extends State<EditableLocationMapWidget> {
  late double? _currentLatitude;
  late double? _currentLongitude;

  @override
  void initState() {
    super.initState();
    _currentLatitude = widget.latitude;
    _currentLongitude = widget.longitude;
  }

  Future<void> _openLocationPicker() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationPickerPage(
          initialLatitude: _currentLatitude,
          initialLongitude: _currentLongitude,
          markerTitle: widget.markerTitle,
        ),
      ),
    );

    if (result != null && result is Map<String, dynamic>) {
      setState(() {
        _currentLatitude = result['latitude'] as double;
        _currentLongitude = result['longitude'] as double;
      });

      // Notify parent widget
      if (widget.onLocationUpdated != null) {
        widget.onLocationUpdated!(_currentLatitude!, _currentLongitude!);
      }

      // print('📍 Location updated: $_currentLatitude, $_currentLongitude');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Map display
        if (_currentLatitude != null && _currentLongitude != null)
          Stack(
            children: [
              Container(
                height: 150,
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 5,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: LocationMapWidget2(
                  latitude: _currentLatitude!,
                  longitude: _currentLongitude!,
                  markerTitle: widget.markerTitle,
                ),
              ),

              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Center(
                  child: TextButton(
                    onPressed: _openLocationPicker,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: primaryColor,
                      side: BorderSide(color: primaryColor, width: 1),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 2,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      'Update Location',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: ResponsiveHelper.fontSize(context, base: 12),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        else
          Container(
            height: ResponsiveHelper.getHeight(context, 0.25),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade300, width: 0.5),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_off,
                    size: 48,
                    color: Colors.grey.shade400,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'No location set',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 12),
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ),

        // Display coordinates
        if (_currentLatitude != null && _currentLongitude != null) ...[
          SizedBox(height: 8),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Latitude',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 10,
                          ),
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        _currentLatitude!.toStringAsFixed(6),
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 12,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Longitude',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 10,
                          ),
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Text(
                        _currentLongitude!.toStringAsFixed(6),
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 12,
                          ),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
