import 'package:flutter/material.dart';
import '../helper/road_level.dart';
import '../helper/road_selection_result.dart';
import 'road_selection_flow.dart';

/// Helper function to show road selection bottomsheet
///
/// This function can be called from any page that needs road selection
/// without needing to include the RoadFieldTile widget.
///
/// Usage:
/// ```dart
/// showRoadSelection(
///   context: context,
///   startFrom: RoadLevel.provinces,
///   endAt: RoadLevel.roads,
///   onRoadSelected: (selectedData) {
///     // Handle selected road data
///     print('Selected UID: ${selectedData.selectedRoad?.uid}');
///   },
/// );
/// ```

void showRoadSelection({
  required BuildContext context,
  required RoadLevel startFrom,
  required RoadLevel endAt,
  String? preSelectedCountryUid,
  String? preSelectedProvinceUid,
  String? preSelectedDistrictUid,
  required Function(RoadSelectionResult) onRoadSelected,
}) {
  RoadSelectionFlow.show(
    context: context,
    startFrom: startFrom,
    endAt: endAt,
    preSelectedCountryUid: preSelectedCountryUid,
    preSelectedProvinceUid: preSelectedProvinceUid,
    preSelectedDistrictUid: preSelectedDistrictUid,
    onSelected: onRoadSelected,
  );
}
