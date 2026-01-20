import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../../contractor_relation/domain/entities/contractor_relation_entity.dart';
import '../../../daily_report/presentation/widgets/report_creation/notes_bottomsheet.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../bloc/create_program/ create_program_bloc.dart';
import '../bloc/create_program/create_program_event.dart';
import '../bloc/create_program/create_program_state.dart';
import '../bloc/program/program_bloc.dart';
import '../bloc/program/program_event.dart';
import '../bloc/program/program_state.dart';
import '../bloc/program_draft/program_draft_bloc.dart';
import '../bloc/program_draft/program_draft_event.dart';
import '../bloc/program_draft/program_draft_state.dart';
import '../widgets/fixed_count_input_widget.dart';
import '../widgets/section_based_input_widget.dart';
import '../widgets/select_date_program_widget.dart';
import 'program_month_selection_widget.dart';

class ProgramCreationDraftPage extends StatefulWidget {
  final String? draftUID;
  final String workScopeUID;
  final String workScopeName;
  final String workScopeCode;
  final int workScopeID;
  final ContractorRelation contractor;
  final List<Road> selectedRoads;

  const ProgramCreationDraftPage({
    super.key,
    this.draftUID,
    required this.workScopeUID,
    required this.workScopeName,
    required this.workScopeCode,
    required this.workScopeID,
    required this.contractor,
    required this.selectedRoads,
  });

  @override
  State<ProgramCreationDraftPage> createState() =>
      _ProgramCreationDraftPageState();
}

class _ProgramCreationDraftPageState extends State<ProgramCreationDraftPage> {
  late final ProgramDraftBloc _programDraftBloc;
  late final CompanyBloc _companyBloc;
  late final ProgramBloc _programBloc;
  late final CreateProgramBloc _createProgramBloc;
  Timer? _autoSaveDebounce;

  double? _latitude;
  double? _longitude;
  bool _isLoadingLocation = false;

  // Road input data: Map<roadUID, Map<'fromSection'/'toSection' or 'inputValue', value>>
  Map<String, Map<String, dynamic>> _roadInputData = {};

  DateTime? _periodStart;
  DateTime? _periodEnd;
  List<Map<String, String>> _periods = [];

  List<Map<String, String>> _selectedPeriods = [];

  String _description = '';

  @override
  void initState() {
    super.initState();

    _programDraftBloc = getIt<ProgramDraftBloc>();
    _companyBloc = getIt<CompanyBloc>();
    _programBloc = context.read<ProgramBloc>();
    _createProgramBloc = getIt<CreateProgramBloc>();

    // Load program settings
    _loadProgramSettings();

    if (widget.draftUID != null) {
      _loadExistingDraft();
    } else {
      _initializeNewDraft();
      _getCurrentLocation();
    }
  }

  void _loadProgramSettings() {
    print('📊 Loading program settings');
    _programBloc.add(
      const ProgramEvent.loadProgramSettings(forceRefresh: false),
    );
  }

  void _loadExistingDraft() {
    print('📂 Loading existing program draft: ${widget.draftUID}');

    _programDraftBloc.add(
      ProgramDraftEvent.loadExistingDraft(draftUID: widget.draftUID!),
    );

    print('✅ Load existing draft event dispatched');
  }

  void _initializeNewDraft() {
    final companyState = _companyBloc.state;
    if (companyState is CompanyLoaded && companyState.selectedCompany != null) {
      print('📝 Initializing new multi-road program draft...');

      _programDraftBloc.add(
        ProgramDraftEvent.initializeDraftMultiRoad(
          companyUID: companyState.selectedCompany!.uid!,
          workScopeID: widget.workScopeID,
          workScopeUID: widget.workScopeUID,
          workScopeName: widget.workScopeName,
          workScopeCode: widget.workScopeCode,
          roads: widget.selectedRoads,
          contractor: widget.contractor,
        ),
      );

      print('✅ Multi-road draft initialization event dispatched');
    }
  }

  @override
  void dispose() {
    _autoSaveDebounce?.cancel();
    _createProgramBloc.close();
    super.dispose();
  }

  void _triggerAutoSave() {
    _autoSaveDebounce?.cancel();
    _autoSaveDebounce = Timer(const Duration(milliseconds: 500), () {
      print('⏱️ Auto-save debounce timer fired');
      _programDraftBloc.add(const ProgramDraftEvent.autoSaveDraft());
    });
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoadingLocation = true;
    });

    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (mounted) {
          CustomSnackBar.show(
            context,
            'Location services are disabled. Please enable location services.',
            type: SnackBarType.warning,
          );
        }
        setState(() {
          _isLoadingLocation = false;
        });
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (mounted) {
            CustomSnackBar.show(
              context,
              'Location permission denied',
              type: SnackBarType.error,
            );
          }
          setState(() {
            _isLoadingLocation = false;
          });
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (mounted) {
          CustomSnackBar.show(
            context,
            'Location permissions are permanently denied',
            type: SnackBarType.error,
          );
        }
        setState(() {
          _isLoadingLocation = false;
        });
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _latitude = position.latitude;
        _longitude = position.longitude;
        _isLoadingLocation = false;
      });

      _programDraftBloc.add(
        ProgramDraftEvent.updateLocation(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );

      _triggerAutoSave();

      print('📍 Location updated: ${position.latitude}, ${position.longitude}');
    } catch (e) {
      print('❌ Error getting location: $e');
      if (mounted) {
        CustomSnackBar.show(
          context,
          'Failed to get location: $e',
          type: SnackBarType.error,
        );
      }
      setState(() {
        _isLoadingLocation = false;
      });
    }
  }

  void _handlePeriodTap() async {
    final result = await Navigator.push<Map<String, dynamic>>(
      context,
      MaterialPageRoute(
        builder: (context) => SelectDateProgramPage(
          initialStartDate: _periodStart,
          initialEndDate: _periodEnd,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        _periodStart = result['startDate'] as DateTime;
        _periodEnd = result['endDate'] as DateTime;
        _periods = List<Map<String, String>>.from(result['periods']);
      });

      print('📅 Period selected: $_periodStart to $_periodEnd');
      print('   Monthly periods: ${_periods.length}');

      _programDraftBloc.add(
        ProgramDraftEvent.updatePeriods(
          periodStart: _periodStart!,
          periodEnd: _periodEnd!,
        ),
      );

      _triggerAutoSave();
    }
  }

  void _handleNotesTap() async {
    final result = await showNotesBottomSheet(
      context: context,
      initialNotes: _description,
    );

    if (result != null) {
      setState(() {
        _description = result;
      });

      print('📝 Description saved: $result');

      _programDraftBloc.add(
        ProgramDraftEvent.updateDescription(description: result),
      );

      _triggerAutoSave();
    }
  }

  void _handleRoadInputChanged(String roadUID, Map<String, dynamic> inputData) {
    setState(() {
      _roadInputData[roadUID] = inputData;
    });

    print('✏️ Road input updated for $roadUID: $inputData');

    _programDraftBloc.add(
      ProgramDraftEvent.updateRoadInputData(roadInputData: _roadInputData),
    );

    _triggerAutoSave();
  }

  void _handleMonthsChanged(List<Map<String, String>> periods) {
    setState(() {
      _selectedPeriods = periods;
    });

    print('📅 Selected periods: ${periods.length}');
    periods.forEach((period) {
      print('   - ${period['periodStart']} to ${period['periodEnd']}');
    });

    // Update draft with periods
    if (periods.isNotEmpty) {
      final firstPeriod = periods.first;
      final lastPeriod = periods.last;

      _programDraftBloc.add(
        ProgramDraftEvent.updatePeriods(
          periodStart: DateTime.parse(firstPeriod['periodStart']!),
          periodEnd: DateTime.parse(lastPeriod['periodEnd']!),
        ),
      );

      _triggerAutoSave();
    }
  }

  List<Map<String, String>> _reconstructMonthlyPeriods(
    DateTime start,
    DateTime end,
  ) {
    final List<Map<String, String>> periods = [];
    DateTime current = DateTime(start.year, start.month, 1);
    final endMonth = DateTime(end.year, end.month, 1);

    while (current.isBefore(endMonth) || current == endMonth) {
      final firstDay = DateTime(current.year, current.month, 1);
      final lastDay = DateTime(current.year, current.month + 1, 0);

      periods.add({
        'periodStart': DateFormat('yyyy-MM-dd').format(firstDay),
        'periodEnd': DateFormat('yyyy-MM-dd').format(lastDay),
      });

      current = DateTime(current.year, current.month + 1, 1);
    }

    return periods;
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProgramDraftBloc, ProgramDraftState>(
      bloc: _programDraftBloc,
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          editing: (draftData) {
            setState(() {
              _roadInputData = Map.from(draftData.roadInputData ?? {});
              _latitude = draftData.latitude;
              _longitude = draftData.longitude;
              _periodStart = draftData.periodStart;
              _periodEnd = draftData.periodEnd;
              _description = draftData.description ?? '';

              // ✅ Reconstruct _selectedPeriods from periodStart and periodEnd
              if (draftData.periodStart != null &&
                  draftData.periodEnd != null) {
                _selectedPeriods = _reconstructMonthlyPeriods(
                  draftData.periodStart!,
                  draftData.periodEnd!,
                );
                print(
                  '📅 Reconstructed ${_selectedPeriods.length} periods from draft',
                );
              }
            });
          },
          autoSaving: (draftData) {},
          autoSaved: (draftData) {},
          submitting: (draftData) {},
          submitted: (draftData) {
            CustomSnackBar.show(
              context,
              'Program submitted successfully!',
              type: SnackBarType.success,
            );
            Navigator.of(context).pop();
          },
          draftListLoaded: (drafts) {
            // This state is not relevant for this page, ignore it
          },
          error: (failure, draftData) {
            CustomSnackBar.show(
              context,
              failure.message,
              type: SnackBarType.error,
            );
          },
        );
      },
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
          child: SafeArea(
            bottom: false,
            child: Column(
              children: [
                SizedBox(height: ResponsiveHelper.getHeight(context, 0.02)),

                // Header
                Padding(
                  padding: ResponsiveHelper.padding(context, horizontal: 20),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.1),
                                blurRadius: 5,
                                offset: const Offset(-2, 6),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.black,
                            size: ResponsiveHelper.iconSize(context, base: 20),
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          'Program',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 18,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 30),

                // Content
                Expanded(
                  child: Container(
                    padding: ResponsiveHelper.padding(
                      context,
                      vertical: 20,
                      horizontal: 20,
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
                    child: BlocBuilder<ProgramBloc, ProgramState>(
                      builder: (context, programState) {
                        return programState.maybeWhen(
                          loaded: (settings, _) {
                            // Use workScopeUID from draft data if available, otherwise use widget parameter
                            final workScopeUIDToFilter =
                                _programDraftBloc.state.maybeWhen(
                                  editing: (draftData) =>
                                      draftData.workScopeUID,
                                  autoSaving: (draftData) =>
                                      draftData.workScopeUID,
                                  autoSaved: (draftData) =>
                                      draftData.workScopeUID,
                                  orElse: () => widget.workScopeUID,
                                ) ??
                                widget.workScopeUID;

                            print(
                              '🔍 Filtering program settings with workScopeUID: $workScopeUIDToFilter',
                            );

                            final filteredSettings = settings
                                .where(
                                  (setting) =>
                                      setting.workScope?.uid ==
                                      workScopeUIDToFilter,
                                )
                                .toList();

                            print(
                              '✅ Found ${filteredSettings.length} program settings',
                            );

                            if (filteredSettings.isEmpty) {
                              return Center(
                                child: Text(
                                  'No program settings found',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 14,
                                    ),
                                  ),
                                ),
                              );
                            }

                            final programSetting = filteredSettings.first;

                            final calculationType =
                                programSetting.calculationType ??
                                'SECTION_BASED';

                            return ListView(
                              children: [
                                // Contractor Selected
                                BlocBuilder<
                                  ProgramDraftBloc,
                                  ProgramDraftState
                                >(
                                  bloc: _programDraftBloc,
                                  builder: (context, state) {
                                    final contractorName =
                                        state.maybeWhen(
                                          editing: (draftData) =>
                                              draftData.contractor?.name,
                                          autoSaving: (draftData) =>
                                              draftData.contractor?.name,
                                          autoSaved: (draftData) =>
                                              draftData.contractor?.name,
                                          orElse: () => null,
                                        ) ??
                                        widget.contractor.name;

                                    return Text(
                                      contractorName ?? 'N/A',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: ResponsiveHelper.fontSize(
                                          context,
                                          base: 14,
                                        ),
                                      ),
                                    );
                                  },
                                ),

                                SizedBox(height: 20),

                                Row(
                                  children: [
                                    Container(
                                      width: ResponsiveHelper.getWidth(
                                        context,
                                        0.14,
                                      ),
                                      height: ResponsiveHelper.getWidth(
                                        context,
                                        0.14,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: ResponsiveHelper.spacing(
                                          context,
                                          8,
                                        ),
                                        vertical: ResponsiveHelper.spacing(
                                          context,
                                          4,
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                        color: primaryColor,
                                        borderRadius:
                                            ResponsiveHelper.borderRadius(
                                              context,
                                              all: 6,
                                            ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          widget.workScopeCode,
                                          style: TextStyle(
                                            fontSize: ResponsiveHelper.fontSize(
                                              context,
                                              base: 14,
                                            ),
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ),

                                    SizedBox(width: 15),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          widget.workScopeName,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: ResponsiveHelper.fontSize(
                                              context,
                                              base: 14,
                                            ),
                                          ),
                                        ),

                                        BlocBuilder<
                                          ProgramDraftBloc,
                                          ProgramDraftState
                                        >(
                                          bloc: _programDraftBloc,
                                          builder: (context, state) {
                                            final roads =
                                                state.maybeWhen(
                                                  editing: (draftData) =>
                                                      draftData.roads,
                                                  autoSaving: (draftData) =>
                                                      draftData.roads,
                                                  autoSaved: (draftData) =>
                                                      draftData.roads,
                                                  orElse: () => null,
                                                ) ??
                                                widget.selectedRoads;

                                            final roadCount =
                                                roads?.length ?? 0;

                                            return Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on,
                                                  color: Colors.black,
                                                  size:
                                                      ResponsiveHelper.iconSize(
                                                        context,
                                                        base: 12,
                                                      ),
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  '$roadCount Route',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize:
                                                        ResponsiveHelper.fontSize(
                                                          context,
                                                          base: 12,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                SizedBox(height: 20),

                                // Render one container per road
                                ...widget.selectedRoads.map((road) {
                                  final roadUID = road.uid ?? '';
                                  final initialData = _roadInputData[roadUID];

                                  return Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey.withOpacity(0.5),
                                            width: 1,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          gradient: const LinearGradient(
                                            colors: [
                                              Colors.white,
                                              Color.fromARGB(
                                                255,
                                                238,
                                                242,
                                                254,
                                              ),
                                            ],
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                          ),
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.location_on_sharp,
                                                  color: Colors.black,
                                                  size:
                                                      ResponsiveHelper.iconSize(
                                                        context,
                                                        base: 20,
                                                      ),
                                                ),

                                                SizedBox(width: 20),

                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        road.district?.name ??
                                                            'Route',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          color: Colors.grey,
                                                          fontSize:
                                                              ResponsiveHelper.fontSize(
                                                                context,
                                                                base: 12,
                                                              ),
                                                        ),
                                                      ),
                                                      SizedBox(height: 2),
                                                      Text(
                                                        '${road.roadNo ?? 'N/A'} - ${road.name ?? 'Unnamed Road'}',
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        maxLines: 1,
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black,
                                                          fontSize:
                                                              ResponsiveHelper.fontSize(
                                                                context,
                                                                base: 12,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),

                                            SizedBox(height: 20),

                                            // Render input widget based on calculationType
                                            if (calculationType ==
                                                'SECTION_BASED')
                                              SectionBasedInputWidget(
                                                road: road,
                                                initialData: initialData,
                                                onChanged: (inputData) {
                                                  _handleRoadInputChanged(
                                                    roadUID,
                                                    inputData,
                                                  );
                                                },
                                              )
                                            else if (calculationType ==
                                                'FIXED_COUNT')
                                              FixedCountInputWidget(
                                                inputLabel:
                                                    programSetting.inputLabel ??
                                                    'Input',
                                                unitMeasurement:
                                                    programSetting
                                                        .unitMeasurement ??
                                                    'UNIT',
                                                initialData: initialData,
                                                onChanged: (inputData) {
                                                  _handleRoadInputChanged(
                                                    roadUID,
                                                    inputData,
                                                  );
                                                },
                                              ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(height: 15),
                                    ],
                                  );
                                }).toList(),

                                SizedBox(height: 10),

                                ProgramMonthSelectionWidget(
                                  initialSelectedMonths: _selectedPeriods
                                      .map(
                                        (p) =>
                                            DateTime.parse(p['periodStart']!),
                                      )
                                      .toList(),
                                  onMonthsChanged: _handleMonthsChanged,
                                ),

                                SizedBox(height: 50),

                                BlocListener<
                                  CreateProgramBloc,
                                  CreateProgramState
                                >(
                                  bloc: _createProgramBloc,
                                  listener: (context, state) {
                                    state.maybeWhen(
                                      success: (program) async {
                                        print(
                                          '✅ Program created: ${program.uid}',
                                        );

                                        // Delete draft
                                        _programDraftBloc.add(
                                          ProgramDraftEvent.deleteDraft(
                                            draftUID: program.uid.toString(),
                                          ),
                                        );

                                        CustomSnackBar.show(
                                          context,
                                          'Program created successfully!',
                                          type: SnackBarType.success,
                                        );

                                        Navigator.pop(context);
                                      },
                                      error: (message) {
                                        CustomSnackBar.show(
                                          context,
                                          message,
                                          type: SnackBarType.error,
                                        );
                                      },
                                      orElse: () {},
                                    );
                                  },
                                  child: BlocBuilder<CreateProgramBloc, CreateProgramState>(
                                    bloc: _createProgramBloc,
                                    builder: (context, createState) {
                                      final isSubmitting =
                                          createState
                                              is CreateProgramSubmitting;

                                      return SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: isSubmitting
                                              ? null
                                              : () {
                                                  // Get states
                                                  final companyState =
                                                      _companyBloc.state;

                                                  // Validate company
                                                  if (companyState
                                                          is! CompanyLoaded ||
                                                      companyState
                                                              .selectedCompany ==
                                                          null) {
                                                    CustomSnackBar.show(
                                                      context,
                                                      'Company not loaded',
                                                      type: SnackBarType.error,
                                                    );
                                                    return;
                                                  }

                                                  // Validate periods
                                                  if (_selectedPeriods
                                                      .isEmpty) {
                                                    CustomSnackBar.show(
                                                      context,
                                                      'Please select at least one period',
                                                      type: SnackBarType.error,
                                                    );
                                                    return;
                                                  }

                                                  // Validate roads input data
                                                  if (_roadInputData.isEmpty) {
                                                    CustomSnackBar.show(
                                                      context,
                                                      'Please fill in road section/input data',
                                                      type: SnackBarType.error,
                                                    );
                                                    return;
                                                  }

                                                  // Validate that all roads have input data
                                                  for (final road
                                                      in widget.selectedRoads) {
                                                    if (!_roadInputData
                                                        .containsKey(
                                                          road.uid,
                                                        )) {
                                                      CustomSnackBar.show(
                                                        context,
                                                        'Please complete input for ${road.name}',
                                                        type:
                                                            SnackBarType.error,
                                                      );
                                                      return;
                                                    }
                                                  }

                                                  // Build selectedRoads for API submission
                                                  final selectedRoadsForAPI =
                                                      widget.selectedRoads.map((
                                                        road,
                                                      ) {
                                                        final roadUID =
                                                            road.uid!;
                                                        final inputData =
                                                            _roadInputData[roadUID]!;

                                                        return {
                                                          'roadUID': roadUID,
                                                          'fromSection':
                                                              inputData['fromSection']
                                                                  as double,
                                                          'toSection':
                                                              inputData['toSection']
                                                                  as double?,
                                                          'inputValue':
                                                              inputData['inputValue']
                                                                  as int?,
                                                        };
                                                      }).toList();

                                                  print(
                                                    '📋 Submitting Non-R02 Program:',
                                                  );
                                                  print(
                                                    '   Company: ${companyState.selectedCompany!.uid}',
                                                  );
                                                  print(
                                                    '   Work Scope: ${widget.workScopeName}',
                                                  );
                                                  print(
                                                    '   Roads: ${selectedRoadsForAPI.length}',
                                                  );
                                                  print(
                                                    '   Periods: ${_selectedPeriods.length}',
                                                  );
                                                  print(
                                                    '   Contractor: ${widget.contractor.uid}',
                                                  );

                                                  // Submit program
                                                  _createProgramBloc.add(
                                                    CreateProgramEvent.submitNonR02Program(
                                                      companyUID: companyState
                                                          .selectedCompany!
                                                          .uid,
                                                      workScopeUID:
                                                          widget.workScopeUID,
                                                      workScopeCode:
                                                          widget.workScopeCode,
                                                      workScopeName:
                                                          widget.workScopeName,
                                                      selectedRoads:
                                                          selectedRoadsForAPI,
                                                      periods: _selectedPeriods,
                                                      periodStart: DateTime.parse(
                                                        _selectedPeriods
                                                            .first['periodStart']!,
                                                      ),
                                                      contractRelationUID:
                                                          widget.contractor.uid,
                                                    ),
                                                  );
                                                },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: primaryColor,
                                            padding: ResponsiveHelper.padding(
                                              context,
                                              vertical: 12,
                                            ),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            elevation: 2,
                                          ),
                                          child: isSubmitting
                                              ? SizedBox(
                                                  height: 20,
                                                  width: 20,
                                                  child:
                                                      CircularProgressIndicator(
                                                        color: Colors.white,
                                                        strokeWidth: 2,
                                                      ),
                                                )
                                              : Text(
                                                  'Submit',
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
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                          loading: () {
                            return Center(
                              child: CircularProgressIndicator(
                                color: primaryColor,
                              ),
                            );
                          },
                          orElse: () {
                            return Center(
                              child: Text(
                                'Loading program settings...',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 14,
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
