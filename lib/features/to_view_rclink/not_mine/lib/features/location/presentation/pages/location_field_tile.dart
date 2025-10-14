import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/selection_field_card.dart';
import '../bloc/location_bloc.dart';
import '../bloc/location_state.dart';
import '../helper/location_level.dart';
import '../widgets/location_selection_flow.dart';

class LocationFieldTile extends StatefulWidget {
  final Function(Map<String, dynamic>)? onRoadSelected;

  const LocationFieldTile({Key? key, this.onRoadSelected}) : super(key: key);

  @override
  State<LocationFieldTile> createState() => _LocationFieldTileState();
}

class _LocationFieldTileState extends State<LocationFieldTile> {
  String selectedRoadDisplay = '';
  String? selectedRoadUID;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
      listener: (context, state) {
        // Handle errors
        state.maybeWhen(
          error: (failure) {
            CustomSnackBar.show(context, 'Failed to load roads');
          },
          orElse: () {},
        );
      },
      builder: (context, state) {
        return SelectionFieldCard(
          icon: Icons.restaurant_menu,
          label: 'Locations',
          value: selectedRoadDisplay,
          placeholder: 'Choose Locations',
          onTap: () {
            LocationSelectionFlow.show(
              context: context,
              startFrom: LocationLevel.provinces,
              endAt: LocationLevel.districts,
              onSelected: (result) {
                print('Selected: ${result.fullPath}');
                print('Road UID: ${result.road?['uid']}');
                print('Road Name: ${result.road?['name']}');
              },
            );
          },
        );
      },
    );
  }
}
