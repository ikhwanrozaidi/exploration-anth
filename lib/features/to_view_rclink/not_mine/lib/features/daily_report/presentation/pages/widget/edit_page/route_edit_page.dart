import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/di/injection.dart';
import '../../../../../../shared/utils/responsive_helper.dart';
import '../../../../../../shared/utils/theme.dart';
import '../../../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../../domain/entities/daily_report_response.dart';
import '../../../../domain/entities/road_edit_entity.dart';
import '../../../bloc/daily_report_bloc.dart';
import '../../../bloc/daily_report_event.dart';
import '../../../bloc/daily_report_state.dart';

class RouteEditPage extends StatefulWidget {
  final DailyReportResponse report;

  const RouteEditPage({Key? key, required this.report}) : super(key: key);

  @override
  State<RouteEditPage> createState() => _RouteEditPageState();
}

class _RouteEditPageState extends State<RouteEditPage> {
  final TextEditingController _sectionController = TextEditingController();

  void _showRoadsBottomSheet(BuildContext parentContext, RoadsLoaded state) {
    final currentRoadUid = widget.report.road?.uid;

    showFlexibleBottomsheet(
      context: context,
      title: 'Select Road',
      attributes: state.roads
          .map((road) => road.name ?? 'Unknown Road')
          .toList(),
      isRadio: true,
      onSelectionChanged: (selectedRoadName) {
        // Find the road by name
        final selectedRoad = state.roads.firstWhere(
          (road) => road.name == selectedRoadName,
          orElse: () => state.roads.first,
        );

        // Use parentContext to access the bloc
        BlocProvider.of<DailyReportBloc>(
          parentContext,
        ).add(DailyReportEvent.selectRoadForEdit(selectedRoad: selectedRoad));
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // Initialize section controller with current fromSection
    _sectionController.text = widget.report.fromSection ?? '';
  }

  @override
  void dispose() {
    _sectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DailyReportBloc>()
        ..add(
          DailyReportEvent.loadRoadsForEdit(
            districtName: widget.report.road?.districtName ?? '',
            forceRefresh: false,
          ),
        ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: ResponsiveHelper.getHeight(context, 0.03)),

                IconButton(
                  style: IconButton.styleFrom(
                    elevation: 2,
                    shadowColor: Colors.black,
                    shape: const CircleBorder(),
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
                SizedBox(height: 13),
                Text(
                  'Update Route',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
                Text(
                  'Update the information below if required.',
                  style: TextStyle(fontSize: 13),
                ),

                SizedBox(height: 30),

                BlocBuilder<DailyReportBloc, DailyReportState>(
                  builder: (context, state) {
                    final isLoading = state is RoadsLoading;
                    final roadsLoaded = state is RoadsLoaded;

                    String displayText = 'Select road';
                    if (roadsLoaded) {
                      final roadsState = state as RoadsLoaded;
                      if (roadsState.selectedRoad != null) {
                        displayText =
                            roadsState.selectedRoad!.name ?? 'Unknown';
                      } else if (widget.report.road != null) {
                        displayText = widget.report.road!.name ?? 'Unknown';
                      }
                    } else if (widget.report.road != null) {
                      displayText = widget.report.road!.name ?? 'Unknown';
                    }

                    return GestureDetector(
                      onTap: isLoading
                          ? null
                          : () {
                              if (roadsLoaded) {
                                _showRoadsBottomSheet(
                                  context,
                                  state as RoadsLoaded,
                                );
                              }
                            },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.grey.shade400,
                            width: 0.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 214, 226, 255),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.location_on,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Location',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade600,
                                          ),
                                        ),
                                        isLoading
                                            ? SizedBox(
                                                height: 20,
                                                width: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                    ),
                                              )
                                            : Text(
                                                displayText,
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.black,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Color.fromARGB(255, 214, 226, 255),
                              ),
                              child: Icon(
                                Icons.chevron_right_rounded,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(height: ResponsiveHelper.getHeight(context, 0.03)),

                // Section TextField with validation
                BlocBuilder<DailyReportBloc, DailyReportState>(
                  builder: (context, state) {
                    String? errorMessage;
                    RoadEdit? selectedRoad;

                    if (state is RoadsLoaded) {
                      errorMessage = state.sectionError;
                      selectedRoad = state.selectedRoad;
                    }

                    bool hasError =
                        errorMessage != null && errorMessage.isNotEmpty;

                    return Container(
                      margin: EdgeInsets.only(bottom: 15),
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 15,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: hasError && errorMessage != null
                              ? Colors.red
                              : Colors.grey.shade400,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: hasError && errorMessage != null
                                        ? Colors.red.shade50
                                        : Color.fromARGB(255, 214, 226, 255),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.swap_calls,
                                      color: hasError && errorMessage != null
                                          ? Colors.red
                                          : primaryColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Section',
                                        style: TextStyle(
                                          color: hasError
                                              ? Colors.red.shade600
                                              : Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      SizedBox(
                                        child: TextField(
                                          controller: _sectionController,
                                          onChanged: (value) {
                                            context.read<DailyReportBloc>().add(
                                              DailyReportEvent.updateSectionForEdit(
                                                section: value,
                                              ),
                                            );
                                          },
                                          keyboardType:
                                              TextInputType.numberWithOptions(
                                                decimal: true,
                                              ),
                                          decoration: InputDecoration(
                                            isDense: true,
                                            hintText: "Type section",
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                  horizontal: 12,
                                                  vertical: 8,
                                                ),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide(
                                                color: Colors.grey.shade300,
                                                width: 1,
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide(
                                                color: Colors.grey.shade300,
                                                width: 1,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              borderSide: BorderSide(
                                                color:
                                                    hasError &&
                                                        errorMessage != null
                                                    ? Colors.red
                                                    : primaryColor,
                                                width: 1.5,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      if (selectedRoad != null &&
                                          selectedRoad.sectionStart != null &&
                                          selectedRoad.sectionFinish != null)
                                        Text(
                                          'Range from ${selectedRoad.sectionStart} - ${selectedRoad.sectionFinish}',
                                          style: TextStyle(
                                            fontWeight:
                                                hasError && errorMessage != null
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                            fontSize: ResponsiveHelper.fontSize(
                                              context,
                                              base: 10,
                                            ),
                                            color:
                                                hasError && errorMessage != null
                                                ? Colors.red
                                                : Colors.black,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

                SizedBox(height: 10),

                Spacer(),

                BlocBuilder<DailyReportBloc, DailyReportState>(
                  builder: (context, state) {
                    bool isButtonEnabled = false;

                    if (state is RoadsLoaded) {
                      final hasSelectedRoad = state.selectedRoad != null;
                      final hasSection = _sectionController.text.isNotEmpty;
                      final noError =
                          state.sectionError == null ||
                          state.sectionError!.isEmpty;

                      isButtonEnabled =
                          hasSelectedRoad && hasSection && noError;
                    }

                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isButtonEnabled
                            ? () {
                                print('hello');
                                // TODO: Will implement PUT API later
                                final currentState = state as RoadsLoaded;
                                print(
                                  'Selected Road: ${currentState.selectedRoad?.name}',
                                );
                                print('Section: ${_sectionController.text}');
                              }
                            : null,
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
                          'Update',
                          style: TextStyle(
                            color: isButtonEnabled
                                ? Colors.white
                                : Colors.grey.shade600,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
