import 'package:flutter/material.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../bloc/road_bloc.dart';
import '../bloc/road_event.dart';
import '../bloc/road_state.dart';
import '../helper/road_level.dart';
import '../helper/road_selection_result.dart';

class RoadSelectionFlow {
  /// Show road selection flow with flexible level configuration
  static Future<void> show({
    required BuildContext context,
    required RoadLevel startFrom,
    required RoadLevel endAt,
    String? preSelectedCountryUid,
    String? preSelectedProvinceUid,
    String? preSelectedDistrictUid,
    required Function(RoadSelectionResult) onSelected,
  }) async {
    // Validate: startFrom must be before or equal to endAt
    if (startFrom.isAfter(endAt)) {
      CustomSnackBar.show(
        context,
        'Invalid configuration: startFrom must be before or equal to endAt',
      );
      return;
    }

    // Create a new RoadBloc instance for this flow
    final roadBloc = getIt<RoadBloc>();

    // Pre-load first level data
    switch (startFrom) {
      case RoadLevel.provinces:
        roadBloc.add(
          RoadEvent.loadProvinces(countryUid: preSelectedCountryUid),
        );
        break;
      case RoadLevel.districts:
        if (preSelectedProvinceUid != null) {
          roadBloc.add(
            RoadEvent.loadDistricts(provinceUid: preSelectedProvinceUid),
          );
        }
        break;
      case RoadLevel.roads:
        if (preSelectedDistrictUid != null) {
          roadBloc.add(
            RoadEvent.loadRoads(districtUid: preSelectedDistrictUid),
          );
        }
        break;
    }

    // Wait for initial load
    await Future.delayed(const Duration(milliseconds: 300));

    // Show first level
    await _showLevelSelection(
      context: context,
      bloc: roadBloc,
      currentLevel: startFrom,
      endLevel: endAt,
      onSelected: (result) {
        // Call the user's callback
        onSelected(result);

        // Clear selections and close bloc after callback completes
        roadBloc.add(const RoadEvent.clearSelections());

        // Close bloc after a short delay to ensure all events are processed
        Future.delayed(const Duration(milliseconds: 100), () {
          roadBloc.close();
        });
      },
    );
  }

  static Future<void> _showLevelSelection({
    required BuildContext context,
    required RoadBloc bloc,
    required RoadLevel currentLevel,
    required RoadLevel endLevel,
    required Function(RoadSelectionResult) onSelected,
  }) async {
    final state = bloc.state;

    state.maybeWhen(
      loading: () {
        CustomSnackBar.show(context, 'Loading...');
      },
      error: (message) {
        CustomSnackBar.show(context, message);
      },
      loaded:
          (
            provinces,
            districts,
            roads,
            selectedProvince,
            selectedDistrict,
            selectedRoad,
          ) {
            // Get data for current level
            final items = _getItemsForLevel(
              currentLevel,
              provinces,
              districts,
              roads,
            );

            if (items.isEmpty) {
              CustomSnackBar.show(
                context,
                'No ${currentLevel.displayName.toLowerCase()}s available',
              );
              return;
            }

            // Get display names
            final displayNames = items.map((item) {
              if (currentLevel == RoadLevel.roads) {
                final road = item as Map<String, dynamic>;
                final roadNo = road['roadNo'] as String?;
                return roadNo != null
                    ? '${road['name']} ($roadNo)'
                    : road['name'] as String;
              }
              return item['name'] as String;
            }).toList();

            // Show bottom sheet
            showFlexibleBottomsheet(
              context: context,
              title: 'Select ${currentLevel.displayName}',
              attributes: displayNames,
              isRadio: true,
              onSelectionChanged: (selectedName) async {
                // Find selected item
                final selectedItem = items.firstWhere((item) {
                  if (currentLevel == RoadLevel.roads) {
                    final road = item as Map<String, dynamic>;
                    final roadNo = road['roadNo'] as String?;
                    final display = roadNo != null
                        ? '${road['name']} ($roadNo)'
                        : road['name'] as String;
                    return display == selectedName;
                  }
                  return item['name'] == selectedName;
                });

                final uid = selectedItem['uid'] as String;

                // Update bloc with selection
                bloc.add(_getSelectEventForLevel(currentLevel, uid));

                // Wait for state update
                await Future.delayed(const Duration(milliseconds: 200));

                // If this is the end level, return result
                if (currentLevel == endLevel) {
                  final result = _buildResult(bloc.state);
                  onSelected(result);
                  return;
                }

                // Otherwise, load and show next level
                final nextLevel = _getNextLevel(currentLevel);
                if (nextLevel != null && !nextLevel.isAfter(endLevel)) {
                  // Load next level data
                  bloc.add(_getLoadEventForLevel(nextLevel, uid));

                  // Wait for data to load
                  await Future.delayed(const Duration(milliseconds: 500));

                  // Show next level selection
                  await _showLevelSelection(
                    context: context,
                    bloc: bloc,
                    currentLevel: nextLevel,
                    endLevel: endLevel,
                    onSelected: onSelected,
                  );
                }
              },
            );
          },
      orElse: () {},
    );
  }

  static List<Map<String, dynamic>> _getItemsForLevel(
    RoadLevel level,
    List provinces,
    List districts,
    List roads,
  ) {
    switch (level) {
      case RoadLevel.provinces:
        return provinces.map((p) => {'uid': p.uid, 'name': p.name}).toList();
      case RoadLevel.districts:
        return districts.map((d) => {'uid': d.uid, 'name': d.name}).toList();
      case RoadLevel.roads:
        return roads
            .map((r) => {'uid': r.uid, 'name': r.name, 'roadNo': r.roadNo})
            .toList();
    }
  }

  static RoadEvent _getLoadEventForLevel(RoadLevel level, String? parentUid) {
    switch (level) {
      case RoadLevel.provinces:
        return RoadEvent.loadProvinces(countryUid: parentUid);
      case RoadLevel.districts:
        return RoadEvent.loadDistricts(provinceUid: parentUid!);
      case RoadLevel.roads:
        return RoadEvent.loadRoads(districtUid: parentUid!);
    }
  }

  static RoadEvent _getSelectEventForLevel(RoadLevel level, String uid) {
    switch (level) {
      case RoadLevel.provinces:
        return RoadEvent.selectProvince(uid);
      case RoadLevel.districts:
        return RoadEvent.selectDistrict(uid);
      case RoadLevel.roads:
        return RoadEvent.selectRoad(uid);
    }
  }

  static RoadLevel? _getNextLevel(RoadLevel current) {
    switch (current) {
      case RoadLevel.provinces:
        return RoadLevel.districts;
      case RoadLevel.districts:
        return RoadLevel.roads;
      case RoadLevel.roads:
        return null;
    }
  }

  static RoadSelectionResult _buildResult(RoadState state) {
    return state.maybeWhen(
      loaded:
          (
            provinces,
            districts,
            roads,
            selectedProvince,
            selectedDistrict,
            selectedRoad,
          ) {
            return RoadSelectionResult(
              selectedProvince: selectedProvince,
              selectedDistrict: selectedDistrict,
              selectedRoad: selectedRoad,
            );
          },
      orElse: () => RoadSelectionResult(),
    );
  }
}
