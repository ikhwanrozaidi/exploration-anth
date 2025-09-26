import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../bloc/report_creation_bloc.dart';
import '../bloc/report_creation_data.dart';
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

    // Load initial data sequentially
    _bloc.add(const LoadWorkScopes());

    // Delay the states loading slightly to avoid race condition
    Future.delayed(const Duration(milliseconds: 100), () {
      _bloc.add(const LoadStates());
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _sectionController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                // Handle errors
                state.maybeWhen(
                  page1Error: (apiData, selections, errorMessage) {
                    CustomSnackBar.show(context, errorMessage);
                  },
                  page2Error: (apiData, selections, formData, errorMessage) {
                    CustomSnackBar.show(context, errorMessage);
                  },
                  submissionError: (reportData, errorMessage) {
                    CustomSnackBar.show(context, errorMessage);
                  },
                  draftError: (reportData, errorMessage) {
                    CustomSnackBar.show(context, errorMessage);
                  },
                  orElse: () {},
                );

                final currentSection = state.maybeWhen(
                  page1Ready: (apiData, selections) => selections.section,
                  page1Error: (apiData, selections, errorMessage) =>
                      selections.section,
                  page2Ready: (apiData, selections, formData) =>
                      selections.section,
                  page2Error: (apiData, selections, formData, errorMessage) =>
                      selections.section,
                  orElse: () => null,
                );

                if (currentSection != _sectionController.text) {
                  _sectionController.text = currentSection ?? '';
                }
              },

              child: BlocBuilder<ReportCreationBloc, ReportCreationState>(
                builder: (context, state) {
                  // Extract section error from selections (Page 1 validation)
                  final sectionError = state.maybeWhen(
                    page1Ready: (apiData, selections) =>
                        selections.sectionError,
                    page1Error: (apiData, selections, errorMessage) =>
                        selections.sectionError,
                    orElse: () => null,
                  );

                  final hasError = sectionError != null;
                  final errorMessage = sectionError;

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
                                          context
                                              .read<ReportCreationBloc>()
                                              .add(const ClearAllCache());
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
                                                            color: primaryColor,
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
                                                    color: primaryColor,
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
                                                          color: primaryColor,
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
                                                    color: primaryColor,
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
                                                            color: primaryColor,
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
                                                    color: primaryColor,
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
                                                              : primaryColor,
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
                                                                      UpdateSection(
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

                                                          Builder(
                                                            builder: (context) {
                                                              final selectedRoad = state.maybeWhen(
                                                                page1Ready:
                                                                    (
                                                                      apiData,
                                                                      selections,
                                                                    ) => selections
                                                                        .selectedRoad,
                                                                page1Error:
                                                                    (
                                                                      apiData,
                                                                      selections,
                                                                      errorMessage,
                                                                    ) => selections
                                                                        .selectedRoad,
                                                                orElse: () =>
                                                                    null,
                                                              );

                                                              if (selectedRoad
                                                                          ?.sectionStart !=
                                                                      null &&
                                                                  selectedRoad
                                                                          ?.sectionFinish !=
                                                                      null)
                                                                return Text(
                                                                  'Range from ${selectedRoad!.sectionStart} - ${selectedRoad!.sectionFinish}',
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
                                                                          base:
                                                                              10,
                                                                        ),
                                                                    color:
                                                                        hasError &&
                                                                            errorMessage !=
                                                                                null
                                                                        ? Colors
                                                                              .red
                                                                        : Colors
                                                                              .black,
                                                                  ),
                                                                );
                                                              return const SizedBox.shrink();
                                                            },
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
                                  child: Builder(
                                    builder: (context) {
                                      // Check if form is complete and valid
                                      final canProceed = state.maybeWhen(
                                        page1Ready: (apiData, selections) =>
                                            selections.selectedScopeUid !=
                                                null &&
                                            selections.selectedWeather !=
                                                null &&
                                            selections.selectedRoadUid !=
                                                null &&
                                            selections.section != null &&
                                            selections.section!.isNotEmpty,
                                        orElse: () => false,
                                      );

                                      final isButtonEnabled =
                                          canProceed && !hasError;

                                      return ElevatedButton(
                                        onPressed: isButtonEnabled
                                            ? () {
                                                _navigateToTips(context, state);
                                              }
                                            : () {
                                                // Show validation message when disabled button is pressed
                                                List<String> missingFields = [];

                                                final currentSelections = state
                                                    .maybeWhen(
                                                      page1Ready:
                                                          (
                                                            apiData,
                                                            selections,
                                                          ) => selections,
                                                      orElse: () => null,
                                                    );

                                                if (currentSelections != null) {
                                                  if (currentSelections
                                                          .selectedScopeUid ==
                                                      null)
                                                    missingFields.add(
                                                      'Scope of Work',
                                                    );
                                                  if (currentSelections
                                                          .selectedWeather ==
                                                      null)
                                                    missingFields.add(
                                                      'Weather',
                                                    );
                                                  if (currentSelections
                                                          .selectedRoadUid ==
                                                      null)
                                                    missingFields.add(
                                                      'Location',
                                                    );
                                                  if (currentSelections
                                                              .section ==
                                                          null ||
                                                      currentSelections
                                                          .section!
                                                          .isEmpty) {
                                                    missingFields.add(
                                                      'Section',
                                                    );
                                                  } else if (hasError) {
                                                    missingFields.add(
                                                      'Valid Section',
                                                    );
                                                  }
                                                }

                                                if (missingFields.isNotEmpty) {
                                                  CustomSnackBar.show(
                                                    context,
                                                    'Please complete: ${missingFields.join(', ')}',
                                                  );
                                                }
                                              },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: isButtonEnabled
                                              ? primaryColor
                                              : Colors.grey.shade400,
                                          padding: ResponsiveHelper.padding(
                                            context,
                                            vertical: 12,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12,
                                            ),
                                          ),
                                          elevation: 2,
                                        ),
                                        child: Text(
                                          'Add',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ResponsiveHelper.fontSize(
                                              context,
                                              base: 14,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
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
    final workScopes = state.maybeWhen(
      page1Ready: (apiData, selections) => apiData.workScopes,
      page1Error: (apiData, selections, errorMessage) => apiData.workScopes,
      orElse: () => null,
    );

    if (workScopes == null || workScopes.isEmpty) {
      CustomSnackBar.show(context, 'No work scopes available');
      return;
    }

    showFlexibleBottomsheet(
      context: context,
      title: 'Select Scope of Work',
      attributes: workScopes
          .where((scope) => scope.name.isNotEmpty)
          .map((scope) => '${scope.code} - ${scope.name}')
          .toList(),
      isRadio: true,
      onSelectionChanged: (selectedName) {
        final selectedScope = workScopes.firstWhere(
          (scope) => '${scope.code} - ${scope.name}' == selectedName,
        );
        context.read<ReportCreationBloc>().add(SelectScope(selectedScope.uid));

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
        final weatherData = WeatherEnhancements.weatherData.entries.firstWhere(
          (entry) => entry.value.displayName == selectedDisplayName,
        );
        context.read<ReportCreationBloc>().add(SelectWeather(weatherData.key));

        setState(() {
          selectedWeather = selectedDisplayName;
        });
      },
    );
  }

  void _showLocationSelection(BuildContext context, ReportCreationState state) {
    final states = state.maybeWhen(
      page1Ready: (apiData, selections) {
        return apiData.states;
      },
      page1Error: (apiData, selections, errorMessage) {
        return apiData.states;
      },
      orElse: () {
        return null;
      },
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
          _showDistrictSelection(context);
        });
      },
    );
  }

  void _showDistrictSelection(BuildContext context) {
    final state = context.read<ReportCreationBloc>().state;

    final districts = state.maybeWhen(
      page1Ready: (apiData, selections) => apiData.districts,
      page1Error: (apiData, selections, errorMessage) => apiData.districts,
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

    final roads = state.maybeWhen(
      page1Ready: (apiData, selections) => apiData.roads,
      page1Error: (apiData, selections, errorMessage) => apiData.roads,
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
        } else {
          CustomSnackBar.show(context, 'Invalid road selection');
        }

        setState(() {
          selectedLocation = selectedName;
        });
      },
    );
  }

  void _navigateToTips(BuildContext context, ReportCreationState state) {
    final selections = state.maybeWhen(
      page1Ready: (apiData, selections) => selections,
      page1Error: (apiData, selections, errorMessage) => selections,
      orElse: () => const ReportSelections(),
    );

    // Check if can proceed
    List<String> missingFields = [];
    if (selections.selectedScopeUid == null) missingFields.add('Scope of Work');
    if (selections.selectedWeather == null) missingFields.add('Weather');
    if (selections.selectedRoadUid == null) missingFields.add('Location');
    if (selections.section == null || selections.section!.isEmpty)
      missingFields.add('Section');

    if (missingFields.isNotEmpty) {
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
                '${selections.selectedScope!.code} - ${selections.selectedScope!.name}',
            weather:
                WeatherEnhancements.getWeatherData(
                  selections.selectedWeather!,
                )?.displayName ??
                selections.selectedWeather!,
            location:
                '${selections.selectedRoad?.name ?? ''}, ${selections.selectedDistrict?.name ?? ''}',
            section: selections.section!,
          ),
        ),
      ),
    );
  }
}
