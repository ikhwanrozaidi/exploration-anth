import 'package:flutter/material.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/selection_field_card.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../../../road/presentation/helper/road_level.dart';
import '../../../road/presentation/helper/road_selection_result.dart';
import '../../../road/presentation/widgets/road_multi_selection_bottomsheet.dart';
import '../../../road/presentation/bloc/road_bloc.dart';
import '../../../../core/di/injection.dart';

class ContractorRoadFieldTile extends StatefulWidget {
  final List<Road> contractorRoads;
  final Function(RoadSelectionResult)? onRoadSelected;
  final String? label;
  final String? placeholder;

  const ContractorRoadFieldTile({
    Key? key,
    required this.contractorRoads,
    this.onRoadSelected,
    this.label,
    this.placeholder,
  }) : super(key: key);

  @override
  State<ContractorRoadFieldTile> createState() =>
      _ContractorRoadFieldTileState();
}

class _ContractorRoadFieldTileState extends State<ContractorRoadFieldTile> {
  String selectedRoadDisplay = '';
  List<Road> _selectedRoads = [];

  void _handleTap(BuildContext context) async {
    if (widget.contractorRoads.isEmpty) {
      CustomSnackBar.show(context, 'No roads available for this contractor');
      return;
    }

    final roadBloc = getIt<RoadBloc>();

    // Show multi-selection bottomsheet
    await RoadMultiSelectionBottomsheet.show(
      context: context,
      bloc: roadBloc,
      roads: widget.contractorRoads,
      initialSelectedRoads: _selectedRoads,
      preSelectedRoadUids: _selectedRoads.map((r) => r.uid ?? '').toList(),
      onConfirm: (selectedRoads) {
        setState(() {
          _selectedRoads = selectedRoads;

          // Build display text
          final count = selectedRoads.length;
          selectedRoadDisplay =
              '$count ${count == 1 ? 'road' : 'roads'} selected';
        });

        // Create result with selected roads
        final result = RoadSelectionResult(
          completedAt: RoadLevel.roads,
          selectedRoads: selectedRoads,
        );

        // Callback to parent
        if (widget.onRoadSelected != null) {
          widget.onRoadSelected!(result);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SelectionFieldCard(
      imagePath: 'assets/images/icons/location.png',
      label: widget.label ?? 'Route',
      value: selectedRoadDisplay,
      placeholder: widget.placeholder ?? 'Select Routes',
      onTap: () => _handleTap(context),
    );
  }
}
