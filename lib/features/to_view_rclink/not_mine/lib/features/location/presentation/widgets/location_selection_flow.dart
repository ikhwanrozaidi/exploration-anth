import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../bloc/location_bloc.dart';
import '../bloc/location_event.dart';
import '../bloc/location_state.dart';
import '../models/location_level.dart';
import '../models/location_selection_result.dart';

class LocationSelectionFlow {
  /// Show location selection flow with flexible level configuration
  static Future<void> show({
    required BuildContext context,
    required LocationLevel startFrom,
    required LocationLevel endAt,
    String? preSelectedCountryUid,
    String? preSelectedProvinceUid,
    String? preSelectedDistrictUid,
    required Function(LocationSelectionResult) onSelected,
  }) async {
    // Validate: startFrom must be before or equal to endAt
    if (startFrom.isAfter(endAt)) {
      CustomSnackBar.show(
        context,
        'Invalid configuration: startFrom must be before or equal to endAt',
      );
      return;
    }

    // Create a new LocationBloc instance for this flow
    final locationBloc = getIt<LocationBloc>();

    // Pre-load first level data
    switch (startFrom) {
      case LocationLevel.countries:
        locationBloc.add(const LocationEvent.loadCountries());
        break;
      case LocationLevel.provinces:
        locationBloc.add(
          LocationEvent.loadProvinces(countryUid: preSelectedCountryUid),
        );
        break;
      case LocationLevel.districts:
        locationBloc.add(
          LocationEvent.loadDistricts(provinceUid: preSelectedProvinceUid),
        );
        break;
      case LocationLevel.roads:
        locationBloc.add(
          LocationEvent.loadRoads(districtUid: preSelectedDistrictUid),
        );
        break;
    }

    // Wait for initial load
    await Future.delayed(const Duration(milliseconds: 300));

    // Show first level
    await _showLevelSelection(
      context: context,
      bloc: locationBloc,
      currentLevel: startFrom,
      endLevel: endAt,
      onSelected: onSelected,
    );

    // Clear selections and close bloc when flow completes
    locationBloc.add(const LocationEvent.clearSelections());
    locationBloc.close();
  }

  static Future<void> _showLevelSelection({
    required BuildContext context,
    required LocationBloc bloc,
    required LocationLevel currentLevel,
    required LocationLevel endLevel,
    required Function(LocationSelectionResult) onSelected,
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
            countries,
            provinces,
            districts,
            roads,
            selectedCountry,
            selectedProvince,
            selectedDistrict,
            selectedRoad,
          ) {
            // Get data for current level
            final items = _getItemsForLevel(
              currentLevel,
              countries,
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
              if (currentLevel == LocationLevel.roads) {
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
                  if (currentLevel == LocationLevel.roads) {
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
    LocationLevel level,
    List countries,
    List provinces,
    List districts,
    List roads,
  ) {
    switch (level) {
      case LocationLevel.countries:
        return countries.map((c) => {'uid': c.uid, 'name': c.name}).toList();
      case LocationLevel.provinces:
        return provinces.map((p) => {'uid': p.uid, 'name': p.name}).toList();
      case LocationLevel.districts:
        return districts.map((d) => {'uid': d.uid, 'name': d.name}).toList();
      case LocationLevel.roads:
        return roads
            .map((r) => {'uid': r.uid, 'name': r.name, 'roadNo': r.roadNo})
            .toList();
    }
  }

  static LocationEvent _getLoadEventForLevel(
    LocationLevel level,
    String? parentUid,
  ) {
    switch (level) {
      case LocationLevel.countries:
        return const LocationEvent.loadCountries();
      case LocationLevel.provinces:
        return LocationEvent.loadProvinces(countryUid: parentUid);
      case LocationLevel.districts:
        return LocationEvent.loadDistricts(provinceUid: parentUid);
      case LocationLevel.roads:
        return LocationEvent.loadRoads(districtUid: parentUid);
    }
  }

  static LocationEvent _getSelectEventForLevel(
    LocationLevel level,
    String uid,
  ) {
    switch (level) {
      case LocationLevel.countries:
        return LocationEvent.selectCountry(uid);
      case LocationLevel.provinces:
        return LocationEvent.selectProvince(uid);
      case LocationLevel.districts:
        return LocationEvent.selectDistrict(uid);
      case LocationLevel.roads:
        return LocationEvent.selectRoad(uid);
    }
  }

  static LocationLevel? _getNextLevel(LocationLevel current) {
    switch (current) {
      case LocationLevel.countries:
        return LocationLevel.provinces;
      case LocationLevel.provinces:
        return LocationLevel.districts;
      case LocationLevel.districts:
        return LocationLevel.roads;
      case LocationLevel.roads:
        return null;
    }
  }

  static LocationSelectionResult _buildResult(LocationState state) {
    return state.maybeWhen(
      loaded:
          (
            countries,
            provinces,
            districts,
            roads,
            selectedCountry,
            selectedProvince,
            selectedDistrict,
            selectedRoad,
          ) {
            return LocationSelectionResult(
              country: selectedCountry != null
                  ? {'uid': selectedCountry.uid, 'name': selectedCountry.name}
                  : null,
              province: selectedProvince != null
                  ? {'uid': selectedProvince.uid, 'name': selectedProvince.name}
                  : null,
              district: selectedDistrict != null
                  ? {'uid': selectedDistrict.uid, 'name': selectedDistrict.name}
                  : null,
              road: selectedRoad != null
                  ? {
                      'uid': selectedRoad.uid,
                      'name': selectedRoad.name,
                      'roadNo': selectedRoad.roadNo,
                    }
                  : null,
            );
          },
      orElse: () => LocationSelectionResult(),
    );
  }
}
