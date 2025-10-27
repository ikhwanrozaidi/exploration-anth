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
import '../widgets/road_bottom_sheet.dart';

class RoadFieldTile extends StatefulWidget {
  final RoadLevel startFrom;
  final RoadLevel endAt;
  final String? preSelectedCountryUid;
  final String? preSelectedProvinceUid;
  final String? preSelectedDistrictUid;
  final Function(RoadSelectionResult)? onRoadSelected;
  final String? label;
  final IconData? icon;
  final String? placeholder;

  const RoadFieldTile({
    Key? key,
    this.startFrom = RoadLevel.provinces,
    this.endAt = RoadLevel.roads,
    this.preSelectedCountryUid,
    this.preSelectedProvinceUid,
    this.preSelectedDistrictUid,
    this.onRoadSelected,
    this.label,
    this.icon,
    this.placeholder,
  }) : super(key: key);

  @override
  State<RoadFieldTile> createState() => _RoadFieldTileState();
}

class _RoadFieldTileState extends State<RoadFieldTile> {
  String selectedRoadDisplay = '';
  RoadSelectionResult? selectedRoad;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = getIt<RoadBloc>();

        switch (widget.startFrom) {
          case RoadLevel.provinces:
            bloc.add(
              RoadEvent.loadProvinces(countryUid: widget.preSelectedCountryUid),
            );
            break;
          case RoadLevel.districts:
            if (widget.preSelectedProvinceUid != null) {
              bloc.add(
                RoadEvent.loadDistricts(
                  provinceUid: widget.preSelectedProvinceUid!,
                ),
              );
            }
            break;
          case RoadLevel.roads:
            if (widget.preSelectedDistrictUid != null) {
              bloc.add(
                RoadEvent.loadRoads(
                  districtUid: widget.preSelectedDistrictUid!,
                ),
              );
            }
            break;
        }

        return bloc;
      },
      child: BlocConsumer<RoadBloc, RoadState>(
        listener: (context, state) {
          // Handle errors
          state.maybeWhen(
            error: (message) {
              CustomSnackBar.show(
                context,
                message.isNotEmpty ? message : 'Failed to load roads',
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return SelectionFieldCard(
            icon: widget.icon ?? Icons.location_on,
            label: widget.label ?? 'Select Location',
            value: selectedRoadDisplay,
            placeholder: widget.placeholder ?? 'Tap to select',
            onTap: () {
              showRoadSelection(
                context: context,
                startFrom: widget.startFrom,
                endAt: widget.endAt,
                preSelectedCountryUid: widget.preSelectedCountryUid,
                preSelectedProvinceUid: widget.preSelectedProvinceUid,
                preSelectedDistrictUid: widget.preSelectedDistrictUid,
                onRoadSelected: (result) {
                  setState(() {
                    selectedRoad = result;
                    selectedRoadDisplay = result.toString();
                  });

                  if (widget.onRoadSelected != null) {
                    widget.onRoadSelected!(result);
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
