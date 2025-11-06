import 'package:flutter/material.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../domain/entities/country_entity.dart';
import '../../domain/entities/district_entity.dart';
import '../../domain/entities/province_entity.dart';
import '../../domain/entities/road_entity.dart';
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
      case RoadLevel.countries:
        // Load all data to show countries
        roadBloc.add(const RoadEvent.loadProvinces());
        break;
      case RoadLevel.provinces:
        roadBloc.add(
          RoadEvent.loadProvinces(countryUid: preSelectedCountryUid),
        );
        break;
      case RoadLevel.districts:
        roadBloc.add(
          RoadEvent.loadDistricts(provinceUid: preSelectedProvinceUid ?? ''),
        );
        break;
      case RoadLevel.roads:
        roadBloc.add(
          RoadEvent.loadRoads(districtUid: preSelectedDistrictUid ?? ''),
        );
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
        onSelected(result);

        roadBloc.add(const RoadEvent.clearSelections());
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
            allCountries,
            allProvinces,
            allDistricts,
            allRoads,
            provinces,
            districts,
            roads,
            selectedProvince,
            selectedDistrict,
            selectedRoad,
          ) {
            // If no data is loaded yet, show loading
            if (allProvinces.isEmpty &&
                allDistricts.isEmpty &&
                allRoads.isEmpty) {
              CustomSnackBar.show(context, 'Loading data, please wait...');
              return;
            }

            // Get data for current level - now returns the actual entities
            final items = _getItemsForLevel(
              currentLevel,
              allCountries,
              allProvinces,
              allDistricts,
              allRoads,
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

            // Get display names from entities
            final displayNames = items.map((item) {
              return _getDisplayName(currentLevel, item);
            }).toList();

            // Show bottom sheet
            showFlexibleBottomsheet(
              context: context,
              title: 'Select ${currentLevel.displayName}',
              attributes: displayNames,
              isRadio: true,
              onSelectionChanged: (selectedName) async {
                // Find selected item by matching display name
                final selectedItem = items.firstWhere((item) {
                  return _getDisplayName(currentLevel, item) == selectedName;
                });

                final uid = _getUid(currentLevel, selectedItem);

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

  /// Get items for the current level - returns actual entity objects
  static List<dynamic> _getItemsForLevel(
    RoadLevel level,
    List<Country> allCountries,
    List<Province> allProvinces,
    List<District> allDistricts,
    List<Road> allRoads,
    List<Province> provinces,
    List<District> districts,
    List<Road> roads,
  ) {
    switch (level) {
      case RoadLevel.countries:
        return allCountries;
      case RoadLevel.provinces:
        return provinces.isNotEmpty ? provinces : allProvinces;
      case RoadLevel.districts:
        return districts.isNotEmpty ? districts : allDistricts;
      case RoadLevel.roads:
        return roads.isNotEmpty ? roads : allRoads;
    }
  }

  /// Get display name from entity
  static String _getDisplayName(RoadLevel level, dynamic item) {
    switch (level) {
      case RoadLevel.countries:
        final country = item as Country;
        return country.name ?? 'Unknown';
      case RoadLevel.provinces:
        final province = item as Province;
        return province.name ?? 'Unknown';
      case RoadLevel.districts:
        final district = item as District;
        return district.name ?? 'Unknown';
      case RoadLevel.roads:
        final road = item as Road;
        final roadNo = road.roadNo;
        return roadNo != null
            ? '${road.name} ($roadNo)'
            : road.name ?? 'Unknown';
    }
  }

  /// Get UID from entity
  static String _getUid(RoadLevel level, dynamic item) {
    switch (level) {
      case RoadLevel.countries:
        return (item as Country).uid ?? '';
      case RoadLevel.provinces:
        return (item as Province).uid ?? '';
      case RoadLevel.districts:
        return (item as District).uid ?? '';
      case RoadLevel.roads:
        return (item as Road).uid ?? '';
    }
  }

  static RoadEvent _getLoadEventForLevel(RoadLevel level, String? parentUid) {
    switch (level) {
      case RoadLevel.countries:
        return const RoadEvent.loadProvinces();
      case RoadLevel.provinces:
        return RoadEvent.loadProvinces(countryUid: parentUid);
      case RoadLevel.districts:
        return RoadEvent.loadDistricts(provinceUid: parentUid ?? '');
      case RoadLevel.roads:
        return RoadEvent.loadRoads(districtUid: parentUid ?? '');
    }
  }

  static RoadEvent _getSelectEventForLevel(RoadLevel level, String uid) {
    switch (level) {
      case RoadLevel.countries:
        // Countries don't have select event, just load provinces with country filter
        return RoadEvent.loadProvinces(countryUid: uid);
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
      case RoadLevel.countries:
        return RoadLevel.provinces;
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
            allCountries,
            allProvinces,
            allDistricts,
            allRoads,
            provinces,
            districts,
            roads,
            selectedProvince,
            selectedDistrict,
            selectedRoad,
          ) {
            // Determine which level was completed based on what's selected
            RoadLevel completedAt = RoadLevel.provinces;
            if (selectedRoad != null) {
              completedAt = RoadLevel.roads;
            } else if (selectedDistrict != null) {
              completedAt = RoadLevel.districts;
            } else if (selectedProvince != null) {
              completedAt = RoadLevel.provinces;
            }

            return RoadSelectionResult(
              completedAt: completedAt,
              selectedProvince: selectedProvince,
              selectedDistrict: selectedDistrict,
              selectedRoad: selectedRoad,
            );
          },
      orElse: () => RoadSelectionResult(completedAt: RoadLevel.provinces),
    );
  }
}
