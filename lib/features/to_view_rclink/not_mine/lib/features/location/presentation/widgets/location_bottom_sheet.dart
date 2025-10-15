import 'package:flutter/material.dart';
import '../helper/location_level.dart';
import '../helper/location_selection_results.dart';
import '../widgets/location_selection_flow.dart';

/// Helper function to show location selection bottomsheet
///
/// This function can be called from any page that needs location selection
/// without needing to include the LocationFieldTile widget.
///
/// Usage:
/// ```dart
/// showLocationSelection(
///   context: context,
///   startFrom: LocationLevel.provinces,
///   endAt: LocationLevel.roads,
///   onLocationSelected: (selectedData) {
///     // Handle selected location data
///     print('Selected UID: ${selectedData['uid']}');
///   },
/// );
/// ```

void showLocationSelection({
  required BuildContext context,
  required LocationLevel startFrom,
  required LocationLevel endAt,
  String? preSelectedCountryUid,
  String? preSelectedProvinceUid,
  String? preSelectedDistrictUid,
  required Function(LocationSelectionResult) onLocationSelected,
}) {
  LocationSelectionFlow.show(
    context: context,
    startFrom: startFrom,
    endAt: endAt,
    preSelectedCountryUid: preSelectedCountryUid,
    preSelectedProvinceUid: preSelectedProvinceUid,
    preSelectedDistrictUid: preSelectedDistrictUid,
    onSelected: onLocationSelected,
  );
}
