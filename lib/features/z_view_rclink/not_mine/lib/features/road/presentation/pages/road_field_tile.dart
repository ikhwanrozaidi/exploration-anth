import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/selection_field_card.dart';
import '../bloc/road_bloc.dart';
import '../bloc/road_event.dart';
import '../bloc/road_state.dart';
import '../helper/road_level.dart';
import '../helper/road_selection_result.dart';
import '../widgets/road_selection_flow.dart';

/*
HOW TO USE:

 RoadFieldTile(
    startFrom: RoadLevel.provinces,
    endAt: RoadLevel.roads,
    label: 'Select Location',
    icon: Icons.place,
    placeholder: 'Select location',
    onRoadSelected: (RoadSelectionResult result) {
      print(
        'Selected Road UID: ${result.selectedRoad?.uid}',
      );
      print(
        'Selected Province: ${result.selectedProvince?.name}',
      );
      print(
        'Selected District: ${result.selectedDistrict?.name}',
      );
      print(
        'Selected Road: ${result.selectedRoad?.name}',
      );

      // setState(() {
      //   _selectedRoadUid = result.selectedRoad?.uid;
      // });
    },
  ),
*/

class RoadFieldTile extends StatefulWidget {
  final RoadLevel startFrom;
  final RoadLevel endAt;
  final String? preSelectedCountryUid;
  final String? preSelectedProvinceUid;
  final String? preSelectedDistrictUid;
  final Function(RoadSelectionResult)? onRoadSelected;
  final String? label;
  final String? placeholder;
  final bool forceRefresh;

  const RoadFieldTile({
    Key? key,
    this.startFrom = RoadLevel.provinces,
    this.endAt = RoadLevel.roads,
    this.preSelectedCountryUid,
    this.preSelectedProvinceUid,
    this.preSelectedDistrictUid,
    this.onRoadSelected,
    this.label,
    this.placeholder,
    this.forceRefresh = false,
  }) : super(key: key);

  @override
  State<RoadFieldTile> createState() => _RoadFieldTileState();
}

class _RoadFieldTileState extends State<RoadFieldTile> {
  String selectedRoadDisplay = '';
  RoadSelectionResult? selectedRoad;
  late RoadBloc _roadBloc;
  bool _isInitialized = false;

  @override
  void initState() {
    super.initState();
    _roadBloc = getIt<RoadBloc>();
    _initializeData();
  }

  Future<void> _initializeData() async {
    // Load data based on start level
    switch (widget.startFrom) {
      case RoadLevel.countries:
        _roadBloc.add(
          RoadEvent.loadProvinces(forceRefresh: widget.forceRefresh),
        );
        break;
      case RoadLevel.provinces:
        _roadBloc.add(
          RoadEvent.loadProvinces(
            countryUid: widget.preSelectedCountryUid,
            forceRefresh: widget.forceRefresh,
          ),
        );
        break;
      case RoadLevel.districts:
        if (widget.preSelectedProvinceUid != null) {
          _roadBloc.add(
            RoadEvent.loadDistricts(
              provinceUid: widget.preSelectedProvinceUid!,
              forceRefresh: widget.forceRefresh,
            ),
          );
        } else {
          // Load all data first
          _roadBloc.add(
            RoadEvent.loadProvinces(forceRefresh: widget.forceRefresh),
          );
        }
        break;
      case RoadLevel.roads:
        if (widget.preSelectedDistrictUid != null) {
          _roadBloc.add(
            RoadEvent.loadRoads(
              districtUid: widget.preSelectedDistrictUid!,
              forceRefresh: widget.forceRefresh,
            ),
          );
        } else {
          // Load all data first
          _roadBloc.add(
            RoadEvent.loadProvinces(forceRefresh: widget.forceRefresh),
          );
        }
        break;
    }

    // Wait for initial load
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      _isInitialized = true;
    });
  }

  @override
  void dispose() {
    // Don't close the bloc here - it's managed by RoadSelectionFlow
    super.dispose();
  }

  void _handleTap(BuildContext context) async {
    final state = _roadBloc.state;

    // Check if data is loaded
    final hasData = state.maybeWhen(
      loaded:
          (
            allCountries,
            allProvinces,
            allDistricts,
            allRoads,
            provinces,
            districts,
            roads,
            _,
            __,
            ___,
          ) {
            // Check if we have any data loaded
            return allProvinces.isNotEmpty ||
                allDistricts.isNotEmpty ||
                allRoads.isNotEmpty;
          },
      orElse: () => false,
    );

    if (!hasData) {
      // Show loading indicator and fetch data
      CustomSnackBar.show(context, 'Loading data...');

      // Trigger data load
      _roadBloc.add(RoadEvent.loadProvinces(forceRefresh: false));

      // Wait for data to load
      await Future.delayed(const Duration(milliseconds: 1000));

      // Check again if data is loaded
      final newState = _roadBloc.state;
      final isLoaded = newState.maybeWhen(
        loaded:
            (
              _,
              __,
              ___,
              ____,
              _____,
              ______,
              _______,
              ________,
              _________,
              __________,
            ) {
              return true;
            },
        error: (message) {
          CustomSnackBar.show(context, 'Error loading data: $message');
          return false;
        },
        orElse: () => false,
      );

      if (!isLoaded) {
        return;
      }
    }

    // Show selection flow
    await RoadSelectionFlow.show(
      context: context,
      startFrom: widget.startFrom,
      endAt: widget.endAt,
      preSelectedCountryUid: widget.preSelectedCountryUid,
      preSelectedProvinceUid: widget.preSelectedProvinceUid,
      preSelectedDistrictUid: widget.preSelectedDistrictUid,
      onSelected: (result) {
        setState(() {
          selectedRoad = result;
          // Build display text based on what was selected
          selectedRoadDisplay = _buildDisplayText(result);
        });

        if (widget.onRoadSelected != null) {
          widget.onRoadSelected!(result);
        }
      },
    );
  }

  String _buildDisplayText(RoadSelectionResult result) {
    switch (result.completedAt) {
      case RoadLevel.countries:
        return result.selectedCountry?.name ?? '';
      case RoadLevel.provinces:
        return result.selectedProvince?.name ?? '';
      case RoadLevel.districts:
        return result.selectedDistrict?.name ?? '';
      case RoadLevel.roads:
        final road = result.selectedRoad;
        if (road == null) return '';
        return road.roadNo != null
            ? '${road.name} (${road.roadNo})'
            : road.name ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _roadBloc,
      child: BlocConsumer<RoadBloc, RoadState>(
        listener: (context, state) {
          // Handle errors
          state.maybeWhen(
            error: (message) {
              if (mounted) {
                CustomSnackBar.show(
                  context,
                  message.isNotEmpty ? message : 'Failed to load data',
                );
              }
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          // Show loading indicator while initializing
          final isLoading = state.maybeWhen(
            loading: () => true,
            initial: () => !_isInitialized,
            orElse: () => false,
          );

          return SelectionFieldCard(
            imagePath: 'assets/images/icons/location.png',
            label: widget.label ?? 'Location',
            value: selectedRoadDisplay,
            placeholder: isLoading
                ? 'Loading...'
                : (widget.placeholder ?? 'Choose Location'),
            onTap: isLoading ? null : () => _handleTap(context),
          );
        },
      ),
    );
  }
}
