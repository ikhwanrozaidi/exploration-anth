import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../../../../to_view_rclink/not_mine/lib/shared/widgets/selection_field_card.dart';
import '../bloc/location_bloc.dart';
import '../bloc/location_event.dart';
import '../bloc/location_state.dart';
import '../helper/location_level.dart';
import '../helper/location_selection_results.dart';
import '../widgets/location_bottom_sheet.dart';

class LocationFieldTile extends StatefulWidget {
  final LocationLevel startFrom;
  final LocationLevel endAt;
  final String? preSelectedCountryUid;
  final String? preSelectedProvinceUid;
  final String? preSelectedDistrictUid;
  final Function(LocationSelectionResult)? onLocationSelected;
  final String? label;
  final IconData? icon;

  const LocationFieldTile({
    Key? key,
    this.startFrom = LocationLevel.provinces,
    this.endAt = LocationLevel.roads,
    this.preSelectedCountryUid,
    this.preSelectedProvinceUid,
    this.preSelectedDistrictUid,
    this.onLocationSelected,
    this.label,
    this.icon,
  }) : super(key: key);

  @override
  State<LocationFieldTile> createState() => _LocationFieldTileState();
}

class _LocationFieldTileState extends State<LocationFieldTile> {
  String selectedLocationDisplay = '';
  LocationSelectionResult? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = getIt<LocationBloc>();

        switch (widget.startFrom) {
          case LocationLevel.countries:
            // bloc.add(const LocationEvent.loadCountries());
            break;
          case LocationLevel.provinces:
            bloc.add(
              LocationEvent.loadProvinces(
                countryUid: widget.preSelectedCountryUid,
              ),
            );
            break;
          case LocationLevel.districts:
            bloc.add(
              LocationEvent.loadDistricts(
                provinceUid: widget.preSelectedProvinceUid,
              ),
            );
            break;
          case LocationLevel.roads:
            bloc.add(
              LocationEvent.loadRoads(
                districtUid: widget.preSelectedDistrictUid,
              ),
            );
            break;
        }

        return bloc;
      },
      child: BlocConsumer<LocationBloc, LocationState>(
        listener: (context, state) {
          // Handle errors
          state.maybeWhen(
            error: (message) {
              CustomSnackBar.show(
                context,
                message.isNotEmpty ? message : 'Failed to load locations',
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return SelectionFieldCard(
            icon: widget.icon ?? Icons.location_on,
            label: widget.label ?? 'Location',
            value: selectedLocationDisplay,
            placeholder: 'Choose location',
            onTap: () {
              showLocationSelection(
                context: context,
                startFrom: widget.startFrom,
                endAt: widget.endAt,
                preSelectedCountryUid: widget.preSelectedCountryUid,
                preSelectedProvinceUid: widget.preSelectedProvinceUid,
                preSelectedDistrictUid: widget.preSelectedDistrictUid,
                onLocationSelected: (result) {
                  setState(() {
                    selectedLocationDisplay = result.fullPath;
                    selectedLocation = result;
                  });

                  widget.onLocationSelected?.call(result);
                },
              );
            },
          );
        },
      ),
    );
  }
}
