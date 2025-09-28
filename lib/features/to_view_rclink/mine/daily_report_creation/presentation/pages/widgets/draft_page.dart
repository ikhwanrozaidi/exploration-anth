import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rclink_app/features/company/presentation/bloc/company_bloc.dart';
import 'package:rclink_app/features/daily_report_creation/presentation/bloc/report_creation_state.dart';
import 'package:rclink_app/features/daily_report_creation/presentation/pages/widgets/equipment_page.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/divider_config.dart';
import '../../../../company/presentation/bloc/company_state.dart';
import '../../../domain/entities/scope_of_work/work_equipment.dart';
import '../../../domain/entities/scope_of_work/work_quantity_type.dart';
import '../../bloc/report_creation_bloc.dart';
import '../../bloc/report_creation_event.dart';
import 'quantity_selection_page.dart';
import 'shared/custom_fields_tile_widget.dart';

class DraftDailyReportPage extends StatefulWidget {
  const DraftDailyReportPage({super.key});

  @override
  State<DraftDailyReportPage> createState() => _DraftDailyReportPageState();
}

class _DraftDailyReportPageState extends State<DraftDailyReportPage> {
  late final ReportCreationBloc _reportCreationBloc;
  late final CompanyBloc _companyBloc;

  String? worker;
  String? equipment;
  String? conditionSnapshot;

  bool _isLoadingQuantities = false;
  List<Map<String, dynamic>> addedQuantities = [];
  List<Map<String, dynamic>> addedEquipments = [];

  // final List<DraftJsonList> quantitiesDraft;

  @override
  void initState() {
    super.initState();

    _reportCreationBloc = getIt<ReportCreationBloc>();
    _companyBloc = getIt<CompanyBloc>();

    final companyState = _companyBloc.state;
    if (companyState is! CompanyLoaded ||
        companyState.selectedCompany == null) {
      return;
    }

    final companyUID = companyState.selectedCompany!.uid;
    final reportState = _reportCreationBloc.state;
    final selectedWorkScopeUID = reportState.maybeWhen(
      page1Ready: (apiData, selections) => selections.selectedScopeUid,
      orElse: () => null,
    );

    if (selectedWorkScopeUID != null && selectedWorkScopeUID.isNotEmpty) {
      // Temporary Commment until LoadlEquipment Works
      //
      _reportCreationBloc.add(
        LoadQuantities(
          companyUID: companyUID,
          workScopeUID: selectedWorkScopeUID,
        ),
      );

      _reportCreationBloc.add(
        LoadEquipments(
          companyUID: companyUID,
          workScopeUID: selectedWorkScopeUID,
        ),
      );
    } else {
      print('DraftDailyReportPage: No work scopes detected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReportCreationBloc, ReportCreationState>(
      bloc: _reportCreationBloc,
      listener: (context, state) {
        // Handle automatic navigation when quantities are loaded in initState
        state.maybeWhen(
          page2Ready: (apiData, selections, formData) {
            print(
              'DEBUG: BlocListener - page2Ready with ${apiData.quantities?.length ?? 0} quantities',
            );
            if (_isLoadingQuantities &&
                apiData.quantities != null &&
                apiData.quantities!.isNotEmpty) {
              setState(() {
                _isLoadingQuantities = false;
              });
            }
          },
          page2Error: (apiData, selections, formData, errorMessage) {
            print('DEBUG: BlocListener - page2Error: $errorMessage');
            if (_isLoadingQuantities) {
              setState(() {
                _isLoadingQuantities = false;
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Failed to load quantities: $errorMessage'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<ReportCreationBloc, ReportCreationState>(
        bloc: _reportCreationBloc,
        builder: (context, reportState) {
          // Get data from current state - check both page1 and page2 states
          final scopeString = reportState.maybeWhen(
            page1Ready: (apiData, selections) => selections.selectedScope?.name,
            page2Ready: (apiData, selections, formData) =>
                selections.selectedScope?.name,
            page1Error: (apiData, selections, errorMessage) =>
                selections.selectedScope?.name,
            page2Error: (apiData, selections, formData, errorMessage) =>
                selections.selectedScope?.name,
            orElse: () => null,
          );

          final roadString = reportState.maybeWhen(
            page1Ready: (apiData, selections) => selections.selectedRoad?.name,
            page2Ready: (apiData, selections, formData) =>
                selections.selectedRoad?.name,
            page1Error: (apiData, selections, errorMessage) =>
                selections.selectedRoad?.name,
            page2Error: (apiData, selections, formData, errorMessage) =>
                selections.selectedRoad?.name,
            orElse: () => null,
          );

          final sectionString = reportState.maybeWhen(
            page1Ready: (apiData, selections) => selections.section,
            page2Ready: (apiData, selections, formData) => selections.section,
            page1Error: (apiData, selections, errorMessage) =>
                selections.section,
            page2Error: (apiData, selections, formData, errorMessage) =>
                selections.section,
            orElse: () => null,
          );

          // final availableQuantities = reportState.maybeWhen(
          //   page2Ready: (apiData, selections, formData) =>
          //       apiData.quantities ?? <WorkQuantityType>[],
          //   page2Error: (apiData, selections, formData, errorMessage) =>
          //       apiData.quantities ?? <WorkQuantityType>[],
          //   orElse: () => <WorkQuantityType>[],
          // );

          final availableEquipments = reportState.maybeWhen(
            page2Ready: (apiData, selections, formData) =>
                apiData.equipment ?? <WorkEquipment>[],
            page2Error: (apiData, selections, formData, errorMessage) =>
                apiData.equipment ?? <WorkEquipment>[],
            orElse: () => <WorkEquipment>[],
          );

          return Scaffold(
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
                    // Header (keep your existing header code)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                style: IconButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.all(5),
                                ),
                                onPressed: () => Navigator.pop(context),
                                icon: const Icon(
                                  Icons.arrow_back_rounded,
                                  color: primaryColor,
                                  size: 25,
                                ),
                              ),
                              // ... rest of your header code
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      print('Tips button pressed');
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: primaryColor,
                                      side: BorderSide(
                                        color: primaryColor,
                                        width: 1.5,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 5,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Text('Tips'),
                                  ),
                                  SizedBox(width: 6),
                                  TextButton(
                                    onPressed: () {
                                      print('Remove button pressed');
                                    },
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.red,
                                      side: BorderSide(
                                        color: Colors.red,
                                        width: 1.5,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 5,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Text(
                                      'Remove',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 13),
                          Text(
                            'Draft Report',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            'Please fill in the information listed below',
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),

                    // Content
                    Expanded(
                      child: Container(
                        padding: ResponsiveHelper.padding(context, all: 30),
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
                        child: ListView(
                          children: [
                            SizedBox(height: 10),

                            // Scope of Work (keep existing code but add null safety)
                            if (scopeString != null) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
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
                                          Icons.abc,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Scope of Work'),
                                          Text(
                                            scopeString.toUpperCase(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize:
                                                  ResponsiveHelper.fontSize(
                                                    context,
                                                    base: 14,
                                                  ),
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              dividerConfig(),
                            ],

                            // Location (add null safety)
                            if (roadString != null) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
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
                                          Icons.abc,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Location'),
                                          Text(
                                            roadString.toUpperCase(),
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize:
                                                  ResponsiveHelper.fontSize(
                                                    context,
                                                    base: 14,
                                                  ),
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              dividerConfig(),
                            ],

                            // Section (add null safety)
                            if (sectionString != null) ...[
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 18.0,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(12),
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
                                          Icons.abc,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Section'),
                                        Text(
                                          sectionString.toUpperCase(),
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: ResponsiveHelper.fontSize(
                                              context,
                                              base: 14,
                                            ),
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              dividerConfig(),
                            ],

                            CustomFieldTile(
                              icon: Icons.abc,
                              title: 'Worker',
                              titleDetails: 'Take picture of worker',
                              controller: worker,
                              onTap: () => print('Worker selection tapped'),
                              isRequired: true,
                            ),

                            CustomFieldTile(
                              icon: Icons.abc,
                              title: 'Equipment',
                              titleDetails: 'Choose tools',
                              controller: equipment,
                              onTap: () async {
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EquipmentPage(
                                      equipmentLists: availableEquipments,
                                      addedEquipments: addedEquipments,
                                    ),
                                  ),
                                );

                                if (result != null) {
                                  setState(() {
                                    addedEquipments =
                                        List<Map<String, dynamic>>.from(result);
                                  });

                                  // Update BLoC with selected equipment UIDs
                                  final equipmentUids = addedEquipments
                                      .map(
                                        (equipment) =>
                                            equipment['uid'] as String,
                                      )
                                      .toList();

                                  _reportCreationBloc.add(
                                    SelectEquipment(equipmentUids),
                                  );
                                }
                              },
                              isRequired: true,
                            ),

                            CustomFieldTile(
                              icon: Icons.abc,
                              title: 'Condition Snapshot',
                              titleDetails: "Please take a 'before' photo",
                              controller: conditionSnapshot,
                              onTap: () => print('Condition selection tapped'),
                              isRequired: true,
                            ),

                            // Quantity
                            CustomFieldTile(
                              icon: Icons.abc,
                              title: 'Quantity',
                              titleDetails: _isLoadingQuantities
                                  ? 'Loading quantities...'
                                  : (addedQuantities.isEmpty
                                        ? 'Work-related quantity info'
                                        : '${addedQuantities.length} added'),
                              onTap: () {
                                _handleQuantityTap();
                              },
                              isRequired: true,
                            ),

                            // Notes
                            CustomFieldTile(
                              icon: Icons.abc,
                              title: 'Notes',
                              titleDetails: 'Notes or photos if additional',
                              onTap: () => print('Notes selection tapped'),
                              isRequired: true,
                            ),

                            // Submit Button
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {},
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
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _handleQuantityTap() async {
    final reportState = _reportCreationBloc.state;

    // Get available quantities from current state
    final availableQuantities = reportState.maybeWhen(
      page2Ready: (apiData, selections, formData) =>
          apiData.quantities ?? <WorkQuantityType>[],
      page2Error: (apiData, selections, formData, errorMessage) =>
          apiData.quantities ?? <WorkQuantityType>[],
      orElse: () => <WorkQuantityType>[],
    );

    if (availableQuantities.isNotEmpty) {
      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuantitySelectionPage(
            addedQuantities: addedQuantities,
            quantityLists: availableQuantities,
          ),
        ),
      );

      if (result != null) {
        setState(() {
          addedQuantities = result;
        });
      }
    } else {
      setState(() {
        _isLoadingQuantities = true;
      });

      final companyState = _companyBloc.state;
      if (companyState is CompanyLoaded &&
          companyState.selectedCompany != null) {
        final selectedWorkScopeUID = reportState.maybeWhen(
          page1Ready: (apiData, selections) => selections.selectedScopeUid,
          page1Error: (apiData, selections, errorMessage) =>
              selections.selectedScopeUid,
          orElse: () => null,
        );

        if (selectedWorkScopeUID != null && selectedWorkScopeUID.isNotEmpty) {
          _reportCreationBloc.add(
            LoadQuantities(
              companyUID: companyState.selectedCompany!.uid,
              workScopeUID: selectedWorkScopeUID,
              forceRefresh: true,
            ),
          );
        } else {
          setState(() {
            _isLoadingQuantities = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Please select a work scope first.'),
              backgroundColor: Colors.orange,
            ),
          );
        }
      }
    }
  }
}
