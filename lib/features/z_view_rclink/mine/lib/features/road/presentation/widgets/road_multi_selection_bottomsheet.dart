import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../domain/entities/road_entity.dart';
import '../bloc/road_bloc.dart';
import '../bloc/road_event.dart';
import '../bloc/road_state.dart';

/// Multi-selection bottomsheet for selecting multiple roads with checkboxes
class RoadMultiSelectionBottomsheet extends StatefulWidget {
  final RoadBloc bloc;
  final List<Road> roads;
  final List<Road> initialSelectedRoads;
  final List<String>? preSelectedRoadUids;
  final Function(List<Road>) onConfirm;

  const RoadMultiSelectionBottomsheet({
    Key? key,
    required this.bloc,
    required this.roads,
    required this.initialSelectedRoads,
    this.preSelectedRoadUids,
    required this.onConfirm,
  }) : super(key: key);

  static Future<void> show({
    required BuildContext context,
    required RoadBloc bloc,
    required List<Road> roads,
    required List<Road> initialSelectedRoads,
    List<String>? preSelectedRoadUids,
    required Function(List<Road>) onConfirm,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => BlocProvider.value(
        value: bloc,
        child: RoadMultiSelectionBottomsheet(
          bloc: bloc,
          roads: roads,
          initialSelectedRoads: initialSelectedRoads,
          preSelectedRoadUids: preSelectedRoadUids,
          onConfirm: onConfirm,
        ),
      ),
    );
  }

  @override
  State<RoadMultiSelectionBottomsheet> createState() =>
      _RoadMultiSelectionBottomsheetState();
}

class _RoadMultiSelectionBottomsheetState
    extends State<RoadMultiSelectionBottomsheet> {
  final TextEditingController _searchController = TextEditingController();
  List<Road> _filteredRoads = [];

  @override
  void initState() {
    super.initState();
    _filteredRoads = widget.roads;
    _searchController.addListener(_onSearchChanged);

    if (widget.preSelectedRoadUids != null &&
        widget.preSelectedRoadUids!.isNotEmpty) {
      for (final uid in widget.preSelectedRoadUids!) {
        widget.bloc.add(RoadEvent.addRoadSelection(uid));
      }
    }
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredRoads = widget.roads;
      } else {
        _filteredRoads = widget.roads.where((road) {
          final name = road.name?.toLowerCase() ?? '';
          final roadNo = road.roadNo?.toLowerCase() ?? '';
          return name.contains(query) || roadNo.contains(query);
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: EdgeInsets.all(ResponsiveHelper.spacing(context, 20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'Choose Route',
                  style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(context, base: 16),
                    fontWeight: FontWeight.w600,
                  ),
                ),

                SizedBox(height: ResponsiveHelper.spacing(context, 15)),

                // Search bar
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Search Route',
                      hintStyle: TextStyle(
                        color: Colors.grey[500],
                        fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey[500],
                        size: ResponsiveHelper.iconSize(context, base: 20),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: ResponsiveHelper.spacing(context, 15),
                        vertical: ResponsiveHelper.spacing(context, 12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Roads list with checkboxes
          Expanded(
            child: BlocBuilder<RoadBloc, RoadState>(
              builder: (context, state) {
                return state.maybeWhen(
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
                        selectedRoads,
                      ) {
                        if (_filteredRoads.isEmpty) {
                          return Center(
                            child: Text(
                              _searchController.text.isEmpty
                                  ? 'No roads available'
                                  : 'No roads found',
                              style: TextStyle(
                                fontSize: ResponsiveHelper.fontSize(
                                  context,
                                  base: 14,
                                ),
                                color: Colors.grey[600],
                              ),
                            ),
                          );
                        }

                        return ListView.builder(
                          padding: EdgeInsets.symmetric(
                            horizontal: ResponsiveHelper.spacing(context, 20),
                          ),
                          itemCount: _filteredRoads.length,
                          itemBuilder: (context, index) {
                            final road = _filteredRoads[index];
                            final isSelected = selectedRoads.any(
                              (r) => r.uid == road.uid,
                            );

                            final displayName = road.roadNo != null
                                ? '${road.roadNo} ${road.name ?? ''}'.trim()
                                : road.name ?? 'Unknown';

                            return InkWell(
                              onTap: () {
                                if (isSelected) {
                                  widget.bloc.add(
                                    RoadEvent.removeRoadSelection(
                                      road.uid ?? '',
                                    ),
                                  );
                                } else {
                                  widget.bloc.add(
                                    RoadEvent.addRoadSelection(road.uid ?? ''),
                                  );
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: ResponsiveHelper.spacing(
                                    context,
                                    12,
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    // Checkbox
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: isSelected
                                            ? primaryColor
                                            : Colors.transparent,
                                        border: Border.all(
                                          color: isSelected
                                              ? primaryColor
                                              : Colors.grey[400]!,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: isSelected
                                          ? Icon(
                                              Icons.check,
                                              size: 16,
                                              color: Colors.white,
                                            )
                                          : null,
                                    ),

                                    SizedBox(
                                      width: ResponsiveHelper.spacing(
                                        context,
                                        12,
                                      ),
                                    ),

                                    // Road name
                                    Expanded(
                                      child: Text(
                                        displayName,
                                        style: TextStyle(
                                          fontSize: ResponsiveHelper.fontSize(
                                            context,
                                            base: 14,
                                          ),
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ),

          // Bottom button
          Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(ResponsiveHelper.spacing(context, 20)),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  offset: const Offset(0, -3),
                ),
              ],
            ),
            child: BlocBuilder<RoadBloc, RoadState>(
              builder: (context, state) {
                final selectedRoads = state.maybeWhen(
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
                        selectedRoads,
                      ) => selectedRoads,
                  orElse: () => <Road>[],
                );

                final count = selectedRoads.length;
                final buttonText = count == 0
                    ? 'Select Route'
                    : 'Add $count ${count == 1 ? 'Route' : 'Route'}';

                return SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: selectedRoads.isEmpty
                        ? null
                        : () {
                            Navigator.pop(context);
                            widget.onConfirm(selectedRoads);
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                      disabledBackgroundColor: Colors.grey[300],
                      padding: ResponsiveHelper.padding(
                        context,
                        vertical: 10,
                        horizontal: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: ResponsiveHelper.borderRadius(
                          context,
                          all: 14,
                        ),
                      ),
                      elevation: ResponsiveHelper.adaptive(
                        context,
                        mobile: 1,
                        tablet: 2,
                        desktop: 3,
                      ),
                    ),
                    child: Text(
                      buttonText,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 13),
                        fontWeight: FontWeight.w500,
                        color: selectedRoads.isEmpty
                            ? Colors.grey[600]
                            : Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
