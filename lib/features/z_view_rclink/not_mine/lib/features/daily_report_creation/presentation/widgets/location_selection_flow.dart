import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../bloc/report_creation_bloc.dart';
import '../bloc/report_creation_event.dart';
import '../bloc/report_creation_state.dart';

/// Handles the location selection flow: State → District → Road
class LocationSelectionFlow {
  /// Show state selection bottom sheet
  static void showStateSelection(
    BuildContext context,
    ReportCreationState state,
    Function(String) onLocationSelected,
  ) {
    final states = state.maybeWhen(
      selectingBasicInfo: (apiData, selections) => apiData.states,
      basicInfoError: (apiData, selections, errorMessage) => apiData.states,
      orElse: () => null,
    );

    if (states == null || states.isEmpty) {
      CustomSnackBar.show(context, 'No states available');
      return;
    }

    final attributes = states
        .map((state) => state.name)
        .whereType<String>()
        .toList();

    showFlexibleBottomsheet(
      context: context,
      title: 'Select State',
      attributes: attributes,
      isRadio: true,
      onSelectionChanged: (selectedName) {
        final selectedState = states.firstWhere(
          (state) => state.name == selectedName,
        );

        context.read<ReportCreationBloc>().add(SelectState(selectedState.uid!));

        // Trigger loading districts
        context.read<ReportCreationBloc>().add(
              LoadDistricts(stateUid: selectedState.uid!),
            );

        Future.delayed(const Duration(milliseconds: 500), () {
          showDistrictSelection(context, onLocationSelected);
        });
      },
    );
  }

  /// Show district selection bottom sheet
  static void showDistrictSelection(
    BuildContext context,
    Function(String) onLocationSelected,
  ) {
    final state = context.read<ReportCreationBloc>().state;

    final districts = state.maybeWhen(
      selectingBasicInfo: (apiData, selections) => apiData.districts,
      basicInfoError: (apiData, selections, errorMessage) => apiData.districts,
      orElse: () => null,
    );

    if (districts == null || districts.isEmpty) {
      CustomSnackBar.show(context, 'No districts available for selected state');
      return;
    }

    showFlexibleBottomsheet(
      context: context,
      title: 'Select District',
      attributes: districts
          .where(
            (district) => district.name != null && district.name!.isNotEmpty,
          )
          .map((district) => district.name!)
          .toList(),
      isRadio: true,
      onSelectionChanged: (selectedName) {
        final selectedDistrict = districts.firstWhere(
          (district) => district.name == selectedName,
        );
        if (selectedDistrict.uid != null) {
          context.read<ReportCreationBloc>().add(
                SelectDistrict(selectedDistrict.uid!),
              );

          // Trigger loading roads
          context.read<ReportCreationBloc>().add(
                LoadRoads(districtUid: selectedDistrict.uid!),
              );

          Future.delayed(const Duration(milliseconds: 500), () {
            showRoadSelection(context, onLocationSelected);
          });
        } else {
          CustomSnackBar.show(context, 'Invalid district selection');
        }
      },
    );
  }

  /// Show road selection bottom sheet
  static void showRoadSelection(
    BuildContext context,
    Function(String) onLocationSelected,
  ) {
    final state = context.read<ReportCreationBloc>().state;

    final roads = state.maybeWhen(
      selectingBasicInfo: (apiData, selections) => apiData.roads,
      basicInfoError: (apiData, selections, errorMessage) => apiData.roads,
      orElse: () => null,
    );

    if (roads == null || roads.isEmpty) {
      CustomSnackBar.show(context, 'No roads available for selected district');
      return;
    }

    showFlexibleBottomsheet(
      context: context,
      title: 'Select Road',
      attributes: roads
          .where((road) => road.name != null && road.name!.isNotEmpty)
          .map((road) => '${road.name!} (${road.roadNo ?? ''})')
          .toList(),
      isRadio: true,
      onSelectionChanged: (selectedName) {
        final selectedRoad = roads.firstWhere(
          (road) => '${road.name!} (${road.roadNo ?? ''})' == selectedName,
        );
        if (selectedRoad.uid != null) {
          context.read<ReportCreationBloc>().add(SelectRoad(selectedRoad.uid!));

          // Notify parent with the full location string
          onLocationSelected(selectedName);
        } else {
          CustomSnackBar.show(context, 'Invalid road selection');
        }
      },
    );
  }
}
