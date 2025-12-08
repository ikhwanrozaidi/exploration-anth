import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../utils/responsive_helper.dart';
import '../location_map_widget.dart';

/// Reusable widget to display a location on Google Maps
///
/// Shows a map with a pin marker at the specified coordinates.
/// Used across multiple features to display location information.
class LocationMapWidget2 extends StatefulWidget {
  final double latitude;
  final double longitude;
  final double? height;
  final String? markerTitle;

  const LocationMapWidget2({
    Key? key,
    required this.latitude,
    required this.longitude,
    this.height,
    this.markerTitle,
  }) : super(key: key);

  @override
  State<LocationMapWidget2> createState() => _LocationMapWidget2State();
}

class _LocationMapWidget2State extends State<LocationMapWidget2> {
  late GoogleMapController _mapController;
  late LatLng _position;
  late Set<Marker> _markers;

  @override
  void initState() {
    super.initState();
    _position = LatLng(widget.latitude, widget.longitude);
    _markers = {
      Marker(
        markerId: const MarkerId('location'),
        position: _position,
        infoWindow: InfoWindow(title: widget.markerTitle ?? 'Location'),
      ),
    };
  }

  @override
  void didUpdateWidget(LocationMapWidget2 oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Check if latitude or longitude has changed
    if (oldWidget.latitude != widget.latitude ||
        oldWidget.longitude != widget.longitude) {
      final newPosition = LatLng(widget.latitude, widget.longitude);

      setState(() {
        _position = newPosition;
        _markers = {
          Marker(
            markerId: const MarkerId('location'),
            position: _position,
            infoWindow: InfoWindow(title: widget.markerTitle ?? 'Location'),
          ),
        };
      });

      // Animate camera to new position only if controller is ready
      // Use a small delay to ensure map is fully initialized
      Future.delayed(Duration(milliseconds: 100), () {
        if (mounted) {
          _mapController.animateCamera(
            CameraUpdate.newLatLngZoom(newPosition, 15.0),
          );
        }
      });
    }
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mapHeight =
        widget.height ??
        ResponsiveHelper.getHeight(context, 0.25); // Default to 25% of screen

    return Container(
      height: mapHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300, width: 0.5),
      ),
      clipBehavior: Clip.antiAlias,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(target: _position, zoom: 15.0),
        markers: _markers,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: true,
        mapToolbarEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          _mapController = controller;
        },
      ),
    );
  }
}
