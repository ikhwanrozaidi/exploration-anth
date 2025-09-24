import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../bloc/report_creation_bloc.dart';
import '../bloc/report_creation_event.dart';
import '../bloc/report_creation_state.dart';
import '../constant/field_enhancements.dart';
import 'widgets/tips_page.dart';

class DailyReportCreationPage extends StatefulWidget {
  const DailyReportCreationPage({Key? key}) : super(key: key);

  @override
  State<DailyReportCreationPage> createState() =>
      _DailyReportCreationPageState();
}

class _DailyReportCreationPageState extends State<DailyReportCreationPage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _sectionController = TextEditingController();
  late ReportCreationBloc _bloc;

  String? selectedScopeOfWork;
  String? selectedWeather;
  String? selectedLocation;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<ReportCreationBloc>();

    // Load initial data
    _bloc.add(const LoadWorkScopesRequested());
    _bloc.add(const LoadStatesRequested());
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _sectionController.dispose();
    _bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color defaultPrimaryColor =
        primaryColor ?? Theme.of(context).primaryColor;

    return BlocProvider.value(
      value: _bloc,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 135, 167, 247), primaryColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.2],
              ),
            ),
            child: BlocListener<ReportCreationBloc, ReportCreationState>(
              listener: (context, state) {
                // Show errors
                if (state.hasErrors) {
                  for (final error in state.allErrors) {
                    CustomSnackBar.show(context, error);
                  }
                }
                // Update section controller when section changes externally
                if (state.section != _sectionController.text) {
                  _sectionController.text = state.section ?? '';
                }
              },

              child: BlocBuilder<ReportCreationBloc, ReportCreationState>(
                builder: (context, state) {
                  final hasError = state.hasFieldError('section');
                  final errorMessage = state.getFieldError('section');

                  return SafeArea(
                    bottom: false,
                    child: Column(
                      children: [
                        // Header section
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      IconButton(
                                        style: IconButton.styleFrom(
                                          shape: const CircleBorder(),
                                          backgroundColor: Colors.white,
                                          padding: const EdgeInsets.all(5),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: const Icon(
                                          Icons.arrow_back_rounded,
                                          color: primaryColor,
                                          size: 25,
                                        ),
                                      ),

                                      SizedBox(
                                        width: ResponsiveHelper.spacing(
                                          context,
                                          10,
                                        ),
                                      ),

                                      Text(
                                        'Add Daily Report',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              SizedBox(height: 30),
                            ],
                          ),
                        ),

                        // Form section
                        Expanded(
                          child: Container(
                            padding: ResponsiveHelper.padding(
                              context,
                              horizontal: 25,
                              vertical: 20,
                            ),
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(24),
                                topRight: Radius.circular(24),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  offset: Offset(0, -2),
                                ),
                              ],
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: ResponsiveHelper.spacing(
                                            context,
                                            10,
                                          ),
                                        ),

                                        // Scope of work
                                        GestureDetector(
                                          onTap: () {
                                            _showScopeSelection(context, state);
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 15),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 15,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              12,
                                                            ),
                                                        decoration:
                                                            BoxDecoration(
                                                              color:
                                                                  Color.fromARGB(
                                                                    255,
                                                                    214,
                                                                    226,
                                                                    255,
                                                                  ),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                        child: Center(
                                                          child: Icon(
                                                            Icons
                                                                .restaurant_menu,
                                                            color:
                                                                defaultPrimaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 20),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Scope of Work',
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets.only(
                                                                    right: 12.0,
                                                                  ),
                                                              child: Text(
                                                                selectedScopeOfWork ??
                                                                    'Choose scope of work',
                                                                style: TextStyle(
                                                                  fontSize:
                                                                      ResponsiveHelper.fontSize(
                                                                        context,
                                                                        base:
                                                                            14,
                                                                      ),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color:
                                                                      selectedScopeOfWork ==
                                                                          null
                                                                      ? Colors
                                                                            .red
                                                                      : Colors
                                                                            .black,
                                                                ),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.all(
                                                    2,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          7,
                                                        ),
                                                    color: Color.fromARGB(
                                                      255,
                                                      214,
                                                      226,
                                                      255,
                                                    ),
                                                  ),
                                                  child: Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: defaultPrimaryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: ResponsiveHelper.spacing(
                                            context,
                                            10,
                                          ),
                                        ),

                                        // Weather
                                        GestureDetector(
                                          onTap: () {
                                            _showWeatherSelection(
                                              context,
                                              state,
                                            );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 15),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 15,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            12,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        color: Color.fromARGB(
                                                          255,
                                                          214,
                                                          226,
                                                          255,
                                                        ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.sunny,
                                                          color:
                                                              defaultPrimaryColor,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text('Weather'),
                                                        Text(
                                                          selectedWeather ??
                                                              'Choose current weather',
                                                          style: TextStyle(
                                                            fontSize:
                                                                ResponsiveHelper.fontSize(
                                                                  context,
                                                                  base: 14,
                                                                ),
                                                            fontWeight:
                                                                FontWeight.w700,

                                                            color:
                                                                selectedWeather ==
                                                                    null
                                                                ? Colors.red
                                                                : Colors.black,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.all(
                                                    2,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          7,
                                                        ),
                                                    color: Color.fromARGB(
                                                      255,
                                                      214,
                                                      226,
                                                      255,
                                                    ),
                                                  ),
                                                  child: Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: defaultPrimaryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        SizedBox(
                                          height: ResponsiveHelper.spacing(
                                            context,
                                            10,
                                          ),
                                        ),

                                        // Location
                                        GestureDetector(
                                          onTap: () {
                                            _showLocationSelection(
                                              context,
                                              state,
                                            );
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(bottom: 15),
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 15,
                                            ),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.grey.shade400,
                                                width: 0.5,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets.all(
                                                              12,
                                                            ),
                                                        decoration:
                                                            BoxDecoration(
                                                              color:
                                                                  Color.fromARGB(
                                                                    255,
                                                                    214,
                                                                    226,
                                                                    255,
                                                                  ),
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                        child: Center(
                                                          child: Icon(
                                                            Icons.location_on,
                                                            color:
                                                                defaultPrimaryColor,
                                                          ),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 20),
                                                      Expanded(
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text('Location'),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets.only(
                                                                    right: 12.0,
                                                                  ),
                                                              child: Text(
                                                                selectedLocation ??
                                                                    'Choose location',
                                                                style: TextStyle(
                                                                  fontSize:
                                                                      ResponsiveHelper.fontSize(
                                                                        context,
                                                                        base:
                                                                            14,
                                                                      ),
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color:
                                                                      selectedLocation ==
                                                                          null
                                                                      ? Colors
                                                                            .red
                                                                      : Colors
                                                                            .black,
                                                                  // overflow:
                                                                  //     TextOverflow
                                                                  //         .ellipsis,
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.all(
                                                    2,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          7,
                                                        ),
                                                    color: Color.fromARGB(
                                                      255,
                                                      214,
                                                      226,
                                                      255,
                                                    ),
                                                  ),
                                                  child: Icon(
                                                    Icons.chevron_right_rounded,
                                                    color: defaultPrimaryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),

                                        // _buildLocationField(context, state),

                                        // Section
                                        Container(
                                          margin: EdgeInsets.only(bottom: 15),
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 20,
                                            vertical: 15,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  hasError &&
                                                      errorMessage != null
                                                  ? Colors.red
                                                  : Colors.grey.shade400,
                                              width: 0.5,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                            12,
                                                          ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            hasError &&
                                                                errorMessage !=
                                                                    null
                                                            ? Colors.red.shade50
                                                            : Color.fromARGB(
                                                                255,
                                                                214,
                                                                226,
                                                                255,
                                                              ),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons.swap_calls,
                                                          color:
                                                              hasError &&
                                                                  errorMessage !=
                                                                      null
                                                              ? Colors.red
                                                              : defaultPrimaryColor,
                                                        ),
                                                      ),
                                                    ),

                                                    const SizedBox(width: 20),

                                                    Expanded(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Section',
                                                            style: TextStyle(
                                                              color: hasError
                                                                  ? Colors
                                                                        .red
                                                                        .shade600
                                                                  : Colors
                                                                        .black,
                                                            ),
                                                          ),

                                                          SizedBox(height: 5),

                                                          SizedBox(
                                                            child: TextField(
                                                              controller:
                                                                  _sectionController,

                                                              onChanged: (value) {
                                                                context
                                                                    .read<
                                                                      ReportCreationBloc
                                                                    >()
                                                                    .add(
                                                                      SectionUpdated(
                                                                        value,
                                                                      ),
                                                                    );
                                                              },
                                                              keyboardType:
                                                                  TextInputType.numberWithOptions(
                                                                    decimal:
                                                                        true,
                                                                  ),
                                                              decoration: InputDecoration(
                                                                isDense: true,
                                                                hintText:
                                                                    "Type section",
                                                                contentPadding:
                                                                    EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          12,
                                                                      vertical:
                                                                          8,
                                                                    ),
                                                                border: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        8.0,
                                                                      ),
                                                                  borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300,
                                                                    width: 1,
                                                                  ),
                                                                ),
                                                                enabledBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        8.0,
                                                                      ),
                                                                  borderSide: BorderSide(
                                                                    color: Colors
                                                                        .grey
                                                                        .shade300,
                                                                    width: 1,
                                                                  ),
                                                                ),
                                                                focusedBorder: OutlineInputBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        8.0,
                                                                      ),
                                                                  borderSide: BorderSide(
                                                                    color:
                                                                        hasError &&
                                                                            errorMessage !=
                                                                                null
                                                                        ? Colors
                                                                              .red
                                                                        : primaryColor,
                                                                    width: 1.5,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),

                                                          SizedBox(height: 5),

                                                          if (state
                                                                      .selectedRoad
                                                                      ?.sectionStart !=
                                                                  null &&
                                                              state
                                                                      .selectedRoad
                                                                      ?.sectionFinish !=
                                                                  null)
                                                            Text(
                                                              'Range from ${state.selectedRoad!.sectionStart} - ${state.selectedRoad!.sectionFinish}',
                                                              style: TextStyle(
                                                                fontWeight:
                                                                    hasError &&
                                                                        errorMessage !=
                                                                            null
                                                                    ? FontWeight
                                                                          .bold
                                                                    : FontWeight
                                                                          .normal,
                                                                fontSize:
                                                                    ResponsiveHelper.fontSize(
                                                                      context,
                                                                      base: 10,
                                                                    ),
                                                                color:
                                                                    hasError &&
                                                                        errorMessage !=
                                                                            null
                                                                    ? Colors.red
                                                                    : Colors
                                                                          .black,
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
                                        ),

                                        // _buildSectionField(context, state),
                                        SizedBox(
                                          height: ResponsiveHelper.spacing(
                                            context,
                                            40,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                // Add button
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed:
                                        state.canProceedToTips &&
                                            !hasError &&
                                            errorMessage == null
                                        ? () => _navigateToTips(context, state)
                                        : null,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryColor,
                                      padding: ResponsiveHelper.padding(
                                        context,
                                        vertical: 12,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      elevation: 2,
                                    ),
                                    child: state.isLoading
                                        ? const SizedBox(
                                            height: 20,
                                            width: 20,
                                            child: CircularProgressIndicator(
                                              color: Colors.white,
                                              strokeWidth: 2,
                                            ),
                                          )
                                        : Text(
                                            'Add',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  ResponsiveHelper.fontSize(
                                                    context,
                                                    base: 14,
                                                  ),
                                            ),
                                          ),
                                  ),
                                ),
                                SizedBox(
                                  height: ResponsiveHelper.spacing(context, 40),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================================
  // SELECTION METHODS
  // ============================================================================

  void _showScopeSelection(BuildContext context, ReportCreationState state) {
    if (state.workScopes == null || state.workScopes!.isEmpty) {
      if (state.isLoadingWorkScopes) {
        CustomSnackBar.show(context, 'Loading work scopes...');
      } else {
        CustomSnackBar.show(context, 'No work scopes available');
      }
      return;
    }

    showFlexibleBottomsheet(
      context: context,
      title: 'Select Scope of Work',
      attributes: state.workScopes!
          .where((scope) => scope.name.isNotEmpty)
          .map((scope) => '${scope.code} - ${scope.name}')
          .toList(),
      isRadio: true,
      onSelectionChanged: (selectedName) {
        final selectedScope = state.workScopes!.firstWhere(
          (scope) => '${scope.code} - ${scope.name}' == selectedName,
        );
        context.read<ReportCreationBloc>().add(
          ScopeOfWorkSelected(selectedScope.uid),
        );

        setState(() {
          selectedScopeOfWork = selectedName;
        });
      },
    );
  }

  void _showWeatherSelection(BuildContext context, ReportCreationState state) {
    final weatherOptions = WeatherEnhancements.getAllWeatherDisplayNames();

    showFlexibleBottomsheet(
      context: context,
      title: 'Select Weather Condition',
      attributes: weatherOptions,
      isRadio: true,
      onSelectionChanged: (selectedDisplayName) {
        // Find the enum key for the selected display name
        final weatherData = WeatherEnhancements.weatherData.entries.firstWhere(
          (entry) => entry.value.displayName == selectedDisplayName,
        );
        context.read<ReportCreationBloc>().add(
          WeatherSelected(weatherData.key),
        );

        setState(() {
          selectedWeather = selectedDisplayName;
        });
      },
    );
  }

  void _showLocationSelection(BuildContext context, ReportCreationState state) {
    if (state.states == null || state.states!.isEmpty) {
      CustomSnackBar.show(context, 'No states available');
      return;
    }

    // Show state selection first
    showFlexibleBottomsheet(
      context: context,
      title: 'Select State',
      attributes: state.states!
          .map((state) => state.name)
          .whereType<String>()
          .toList(),
      isRadio: true,
      onSelectionChanged: (selectedName) {
        final selectedState = state.states!.firstWhere(
          (state) => state.name == selectedName,
        );
        context.read<ReportCreationBloc>().add(
          StateSelected(selectedState.uid!),
        );

        // Show district selection after state is selected
        Future.delayed(const Duration(milliseconds: 500), () {
          _showDistrictSelection(context);
        });
      },
    );
  }

  void _showDistrictSelection(BuildContext context) {
    final state = context.read<ReportCreationBloc>().state;

    if (state.districts == null || state.districts!.isEmpty) {
      if (state.isLoadingDistricts) {
        CustomSnackBar.show(context, 'Loading districts...');
      } else {
        CustomSnackBar.show(
          context,
          'No districts available for selected state',
        );
      }
      return;
    }

    showFlexibleBottomsheet(
      context: context,
      title: 'Select District',
      attributes: state.districts!
          .where(
            (district) => district.name != null && district.name!.isNotEmpty,
          )
          .map((district) => district.name!)
          .toList(),
      isRadio: true,
      onSelectionChanged: (selectedName) {
        final selectedDistrict = state.districts!.firstWhere(
          (district) => district.name == selectedName,
        );
        if (selectedDistrict.uid != null) {
          context.read<ReportCreationBloc>().add(
            DistrictSelected(selectedDistrict.uid!),
          );

          // Show road selection after district is selected
          Future.delayed(const Duration(milliseconds: 500), () {
            _showRoadSelection(context);
          });
        } else {
          CustomSnackBar.show(context, 'Invalid district selection');
        }
      },
    );
  }

  void _showRoadSelection(BuildContext context) {
    final state = context.read<ReportCreationBloc>().state;

    if (state.roads == null || state.roads!.isEmpty) {
      if (state.isLoadingRoads) {
        CustomSnackBar.show(context, 'Loading roads...');
      } else {
        CustomSnackBar.show(
          context,
          'No roads available for selected district',
        );
      }
      return;
    }

    showFlexibleBottomsheet(
      context: context,
      title: 'Select Road',
      attributes: state.roads!
          .where((road) => road.name != null && road.name!.isNotEmpty)
          .map((road) => '${road.name!} (${road.roadNo ?? ''})')
          .toList(),
      isRadio: true,
      onSelectionChanged: (selectedName) {
        final selectedRoad = state.roads!.firstWhere(
          (road) => '${road.name!} (${road.roadNo ?? ''})' == selectedName,
        );
        if (selectedRoad.uid != null) {
          context.read<ReportCreationBloc>().add(
            RoadSelected(selectedRoad.uid!),
          );
        } else {
          CustomSnackBar.show(context, 'Invalid road selection');
        }

        setState(() {
          selectedLocation = selectedName;
        });
      },
    );
  }

  Widget _buildSectionField(BuildContext context, ReportCreationState state) {
    final hasError = state.hasFieldError('section');
    final errorMessage = state.getFieldError('section');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: ResponsiveHelper.padding(context, all: 16),
          decoration: BoxDecoration(
            border: Border.all(
              color: hasError ? Colors.red.shade300 : Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(
                Icons.straighten,
                color: hasError ? Colors.red.shade600 : Colors.grey.shade600,
                size: ResponsiveHelper.fontSize(context, base: 20),
              ),
              SizedBox(width: ResponsiveHelper.spacing(context, 12)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Section',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 12),
                        color: hasError
                            ? Colors.red.shade600
                            : Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: ResponsiveHelper.spacing(context, 4)),
                    TextFormField(
                      controller: _sectionController,
                      focusNode: _focusNode,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 14),
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        hintText: state.selectedRoad != null
                            ? 'Enter section (${state.selectedRoad!.sectionStart ?? '0'} - ${state.selectedRoad!.sectionFinish ?? '0'})'
                            : 'Enter section',
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: (value) {
                        context.read<ReportCreationBloc>().add(
                          SectionUpdated(value),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (hasError && errorMessage != null)
          Padding(
            padding: ResponsiveHelper.padding(context, top: 8, left: 12),
            child: Text(
              errorMessage,
              style: TextStyle(
                fontSize: ResponsiveHelper.fontSize(context, base: 12),
                color: Colors.red.shade600,
              ),
            ),
          ),
      ],
    );
  }

  void _navigateToTips(BuildContext context, ReportCreationState state) {
    if (!state.canProceedToTips) {
      List<String> missingFields = [];

      if (state.selectedScopeUid == null) missingFields.add('Scope of Work');
      if (state.selectedWeather == null) missingFields.add('Weather');
      if (state.selectedRoadUid == null) missingFields.add('Location');
      if (state.section == null || state.section!.isEmpty)
        missingFields.add('Section');

      CustomSnackBar.show(
        context,
        'Please complete: ${missingFields.join(', ')}',
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => BlocProvider.value(
          value: _bloc,
          child: TipsOnboardingPage(
            scopeOfWork:
                '${state.selectedScope!.code} - ${state.selectedScope!.name}',
            weather:
                WeatherEnhancements.getWeatherData(
                  state.selectedWeather!,
                )?.displayName ??
                state.selectedWeather!,
            location:
                '${state.selectedRoad?.name ?? ''}, ${state.selectedDistrict?.name ?? ''}',
            section: state.section!,
          ),
        ),
      ),
    );
  }
}
