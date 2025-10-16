import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:rclink_app/features/company/presentation/bloc/company_bloc.dart';
import 'package:rclink_app/features/daily_report_creation/presentation/bloc/report_creation_state.dart';
import 'package:rclink_app/features/daily_report_creation/presentation/widgets/equipment_page.dart';
import 'package:rclink_app/shared/widgets/info_bottomsheet.dart';

import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/divider_config.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../../shared/widgets/gallery/gallery_widget.dart';
import '../../../../shared/widgets/gallery/models/gallery_image.dart';
import '../../../../shared/widgets/gallery/models/gallery_result.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../domain/entities/scope_of_work/work_equipment.dart';
import '../../domain/entities/scope_of_work/work_quantity_type.dart';
import '../bloc/report_creation_bloc.dart';
import '../bloc/report_creation_event.dart';
import 'notes_bottomsheet.dart';
import 'quantity_selection_page.dart';
import 'shared/custom_fields_tile_widget.dart';
import 'worker_number_bottomsheet.dart';

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
  Map<String, List<GalleryImage>> _conditionSnapshotImages = {
    'before': [],
    'current': [],
    'after': [],
  };
  GalleryImage? _workerImage;
  String? _notes;
  List<GalleryImage> _additionalImages = [];
  int? _workerCount;

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
      selectingBasicInfo: (apiData, selections) => selections.selectedScope?.uid,
      orElse: () => null,
    );

    if (selectedWorkScopeUID != null && selectedWorkScopeUID.isNotEmpty) {
      _reportCreationBloc.add(
        LoadQuantitiesAndEquipments(
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
        state.maybeWhen(
          editingDetails: (apiData, selections, formData) {
            if (_isLoadingQuantities &&
                apiData.quantities.isNotEmpty) {
              setState(() {
                _isLoadingQuantities = false;
              });
            }
          },
          detailsError: (apiData, selections, formData, errorMessage) {
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
          submitted: (reportData) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Daily report submitted successfully!'),
                backgroundColor: Colors.green,
              ),
            );
            // Navigate back to daily report listing page (pop twice - draft page and basic info page)
            Navigator.of(context).pop(); // Pop draft page
            Navigator.of(context).pop(); // Pop basic info page
          },
          submissionError: (reportData, errorMessage) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Submission failed: $errorMessage'),
                backgroundColor: Colors.red,
              ),
            );
          },
          orElse: () {},
        );
      },
      child: BlocBuilder<ReportCreationBloc, ReportCreationState>(
        bloc: _reportCreationBloc,
        builder: (context, reportState) {
          final scopeString = reportState.maybeWhen(
            selectingBasicInfo: (apiData, selections) => selections.selectedScope?.name,
            editingDetails: (apiData, selections, formData) =>
                selections.selectedScope?.name,
            basicInfoError: (apiData, selections, errorMessage) =>
                selections.selectedScope?.name,
            detailsError: (apiData, selections, formData, errorMessage) =>
                selections.selectedScope?.name,
            submitting: (reportData) => reportData.selections.selectedScope?.name,
            submitted: (reportData) => reportData.selections.selectedScope?.name,
            submissionError: (reportData, errorMessage) =>
                reportData.selections.selectedScope?.name,
            orElse: () => null,
          );

          final roadString = reportState.maybeWhen(
            selectingBasicInfo: (apiData, selections) => selections.selectedRoad?.name,
            editingDetails: (apiData, selections, formData) =>
                selections.selectedRoad?.name,
            basicInfoError: (apiData, selections, errorMessage) =>
                selections.selectedRoad?.name,
            detailsError: (apiData, selections, formData, errorMessage) =>
                selections.selectedRoad?.name,
            submitting: (reportData) => reportData.selections.selectedRoad?.name,
            submitted: (reportData) => reportData.selections.selectedRoad?.name,
            submissionError: (reportData, errorMessage) =>
                reportData.selections.selectedRoad?.name,
            orElse: () => null,
          );

          final sectionString = reportState.maybeWhen(
            selectingBasicInfo: (apiData, selections) => selections.section,
            editingDetails: (apiData, selections, formData) => selections.section,
            basicInfoError: (apiData, selections, errorMessage) =>
                selections.section,
            detailsError: (apiData, selections, formData, errorMessage) =>
                selections.section,
            submitting: (reportData) => reportData.selections.section,
            submitted: (reportData) => reportData.selections.section,
            submissionError: (reportData, errorMessage) =>
                reportData.selections.section,
            orElse: () => null,
          );

          final availableEquipments = reportState.maybeWhen(
            editingDetails: (apiData, selections, formData) =>
                apiData.equipment,
            detailsError: (apiData, selections, formData, errorMessage) =>
                apiData.equipment,
            submitting: (reportData) => reportData.apiData.equipment,
            submitted: (reportData) => reportData.apiData.equipment,
            submissionError: (reportData, errorMessage) =>
                reportData.apiData.equipment,
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
                    SizedBox(height: ResponsiveHelper.getHeight(context, 0.03)),

                    Padding(
                      padding: ResponsiveHelper.padding(
                        context,
                        horizontal: 20,
                      ),
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
                                      _handleRemoveData();
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
                        padding: ResponsiveHelper.padding(
                          context,
                          vertical: 30,
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
                        child: ListView(
                          children: [
                            SizedBox(height: 10),

                            // Scope of Work (keep existing code but add null safety)
                            if (scopeString != null) ...[
                              Padding(
                                padding: ResponsiveHelper.padding(
                                  context,
                                  horizontal: 15,
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
                                          Icons.restaurant_menu,
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
                                padding: ResponsiveHelper.padding(
                                  context,
                                  horizontal: 15,
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
                                          Icons.sunny,
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
                                padding: ResponsiveHelper.padding(
                                  context,
                                  horizontal: 15,
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
                                          Icons.location_on,
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

                            // Worker
                            CustomFieldTile(
                              icon: Icons.person,
                              title: 'Worker',
                              titleDetails: _workerImage == null
                                  ? 'Take picture of worker'
                                  : '$_workerCount workers added',
                              isFilled: _workerImage != null,
                              controller: worker,
                              onTap: () async {
                                final result = await Navigator.push<GalleryResult>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GalleryWidget(
                                      title: 'Worker',
                                      workerPicture: true,
                                      maxImages: 1,
                                      pictures: _workerImage != null
                                          ? [_workerImage!.path]
                                          : null,
                                      onImagesChanged: (result) {},
                                      onDialogConfirm: () async {
                                        final workerCount =
                                            await WorkerNumberBottomsheet.showWithInfoBottomsheet(
                                              context,
                                              initialWorkerCount: _workerCount,
                                            );

                                        if (workerCount != null) {
                                          setState(() {
                                            _workerCount = workerCount;
                                          });
                                          _saveWorkerData();
                                        }
                                      },
                                    ),
                                  ),
                                );

                                if (result != null) {
                                  if (result.images.isNotEmpty) {
                                    setState(() {
                                      _workerImage = result.images.first;
                                    });
                                    _saveWorkerData();
                                  } else {
                                    setState(() {
                                      _workerImage = null;
                                    });
                                    _saveWorkerData();
                                  }
                                } else {
                                  print('⚠️ Result is null - user cancelled');
                                }
                              },
                              isRequired: true,
                            ),

                            // Equipment
                            CustomFieldTile(
                              icon: Icons.business_center,
                              title: 'Equipment',
                              titleDetails: addedEquipments.isEmpty
                                  ? 'Choose tools'
                                  : '${addedEquipments.length} equipment added',
                              isFilled: addedEquipments.isEmpty ? false : true,
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

                            // Condition Snapshot
                            CustomFieldTile(
                              icon: Icons.camera_alt,
                              title: 'Condition Snapshot',
                              titleDetails: _getConditionSnapshotSummary(),
                              isFilled: _conditionSnapshotImages.values.any(
                                (list) => list.isNotEmpty,
                              ),
                              controller: conditionSnapshot,
                              onTap: () async {
                                final result = await Navigator.push<GalleryResult>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GalleryWidget(
                                      title: 'Condition Snapshot',
                                      inputProgress: true,
                                      pinPointFirst: true,
                                      maxImages: 10,
                                      minimumImage: 4,
                                      tabLock: true,
                                      initialTabImages:
                                          _conditionSnapshotImages,
                                      onImagesChanged: (result) {
                                        print(
                                          '🔄 onImagesChanged callback: ${result.tabImages?.keys}',
                                        );
                                      },
                                    ),
                                  ),
                                );

                                if (result != null &&
                                    result.tabImages != null) {
                                  setState(() {
                                    _conditionSnapshotImages =
                                        result.tabImages!;
                                  });
                                  final snapshotsData =
                                      <String, List<Map<String, dynamic>>>{};

                                  _conditionSnapshotImages.forEach((
                                    tab,
                                    images,
                                  ) {
                                    snapshotsData[tab] = images
                                        .map((img) => img.toJson())
                                        .toList();
                                  });

                                  _reportCreationBloc.add(
                                    UpdateConditionSnapshots(snapshotsData),
                                  );
                                } else {
                                  print('⚠️ No result or tabImages is null');
                                }
                              },
                              isRequired: true,
                            ),

                            // Quantity
                            CustomFieldTile(
                              icon: Icons.restaurant_menu,
                              title: 'Quantity',
                              isFilled: addedQuantities.isEmpty ? false : true,
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
                              icon: Icons.note_add_sharp,
                              title: 'Notes',
                              titleDetails:
                                  _getNotesDisplayText() ??
                                  'Notes or photos if additional',
                              isFilled:
                                  _notes != null ||
                                  _additionalImages.isNotEmpty,
                              onTap: () {
                                showFlexibleBottomsheet(
                                  context: context,
                                  title: 'Other Information',
                                  attributes: ['Notes', 'Additional Images'],
                                  isRadio: false,
                                  isNavigate: true,
                                  onTap: (selectedOption) async {
                                    Navigator.of(context).pop();

                                    await Future.delayed(
                                      const Duration(milliseconds: 300),
                                    );

                                    if (selectedOption == 'Notes') {
                                      final result = await showNotesBottomSheet(
                                        context: context,
                                        initialNotes: _notes,
                                      );

                                      if (result != null) {
                                        setState(() {
                                          _notes = result;
                                        });
                                        print('Notes saved: $_notes');
                                      }
                                    } else if (selectedOption ==
                                        'Additional Images') {
                                      final result =
                                          await Navigator.push<GalleryResult>(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  GalleryWidget(
                                                    title: 'Additional Images',

                                                    maxImages: 1,
                                                    pictures: _additionalImages
                                                        .map((e) => e.path)
                                                        .toList(),
                                                    onImagesChanged:
                                                        (result) {},
                                                  ),
                                            ),
                                          );

                                      if (result != null) {
                                        setState(() {
                                          _additionalImages = result.images;
                                        });
                                        final imagePaths = _additionalImages
                                            .map((e) => e.path)
                                            .toList();

                                        // TODO: Update your report_creation_data
                                        // Example:
                                        // context.read<ReportCreationBloc>().add(
                                        //   UpdateAdditionalImages(imagePaths),
                                        // );

                                        print(
                                          'Additional images saved: ${imagePaths.length} images',
                                        );
                                      }
                                    }
                                  },
                                );
                              },
                              isRequired: true,
                            ),

                            // Submit Button
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              width: double.infinity,
                              child: reportState.maybeWhen(
                                submitting: (reportData) {
                                  return ElevatedButton(
                                    onPressed: null,
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
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Text(
                                          'Submitting...',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: ResponsiveHelper.fontSize(
                                              context,
                                              base: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                orElse: () {
                                  return ElevatedButton(
                                    onPressed: () {
                                      final companyState = _companyBloc.state;
                                      if (companyState is CompanyLoaded &&
                                          companyState.selectedCompany != null) {
                                        _reportCreationBloc.add(
                                          SubmitReport(
                                            companyUID: companyState.selectedCompany!.uid,
                                          ),
                                        );
                                      }
                                    },
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
                                  );
                                },
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
      editingDetails: (apiData, selections, formData) {
        return apiData.quantities;
      },
      detailsError: (apiData, selections, formData, errorMessage) {
        return apiData.quantities;
      },
      submitting: (reportData) => reportData.apiData.quantities,
      submitted: (reportData) => reportData.apiData.quantities,
      submissionError: (reportData, errorMessage) =>
          reportData.apiData.quantities,
      orElse: () {
        return <WorkQuantityType>[];
      },
    );

    if (availableQuantities.isNotEmpty) {
      // Get selectedScopeUid from current state
      final selectedScopeUid = reportState.maybeWhen(
        selectingBasicInfo: (apiData, selections) => selections.selectedScope?.uid,
        editingDetails: (apiData, selections, formData) =>
            selections.selectedScope?.uid,
        basicInfoError: (apiData, selections, errorMessage) =>
            selections.selectedScope?.uid,
        detailsError: (apiData, selections, formData, errorMessage) =>
            selections.selectedScope?.uid,
        submitting: (reportData) => reportData.selections.selectedScope?.uid,
        submitted: (reportData) => reportData.selections.selectedScope?.uid,
        submissionError: (reportData, errorMessage) =>
            reportData.selections.selectedScope?.uid,
        orElse: () => null,
      );

      final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuantitySelectionPage(
            addedQuantities: addedQuantities,
            quantityLists: availableQuantities,
            selectedScopeUid: selectedScopeUid,
          ),
        ),
      );

      if (result != null) {
        setState(() {
          addedQuantities = result;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Loading quantities, please try again...'),
          backgroundColor: Colors.orange,
        ),
      );

      final companyState = _companyBloc.state;
      final selectedWorkScopeUID = reportState.maybeWhen(
        selectingBasicInfo: (apiData, selections) => selections.selectedScope?.uid,
        editingDetails: (apiData, selections, formData) =>
            selections.selectedScope?.uid,
        basicInfoError: (apiData, selections, errorMessage) =>
            selections.selectedScope?.uid,
        detailsError: (apiData, selections, formData, errorMessage) =>
            selections.selectedScope?.uid,
        submitting: (reportData) => reportData.selections.selectedScope?.uid,
        submitted: (reportData) => reportData.selections.selectedScope?.uid,
        submissionError: (reportData, errorMessage) =>
            reportData.selections.selectedScope?.uid,
        orElse: () => null,
      );

      if (companyState is CompanyLoaded &&
          companyState.selectedCompany != null &&
          selectedWorkScopeUID != null) {
        _reportCreationBloc.add(
          LoadQuantities(
            companyUID: companyState.selectedCompany!.uid,
            workScopeUID: selectedWorkScopeUID,
            forceRefresh: true,
          ),
        );
      }
    }
  }

  String _getConditionSnapshotSummary() {
    int totalImages = 0;
    _conditionSnapshotImages.forEach((key, images) {
      totalImages += images.length;
    });

    if (totalImages == 0) {
      return "Please take a 'before' photo";
    }

    final before = _conditionSnapshotImages['before']?.length ?? 0;
    final current = _conditionSnapshotImages['current']?.length ?? 0;
    final after = _conditionSnapshotImages['after']?.length ?? 0;

    List<String> summaryParts = [];

    if (before > 0) {
      summaryParts.add('$before image${before > 1 ? 's' : ''} Before');
    }

    if (current > 0) {
      summaryParts.add('$current image${current > 1 ? 's' : ''} Current');
    }

    if (after > 0) {
      summaryParts.add('$after image${after > 1 ? 's' : ''} After');
    }

    // return summaryParts.join(', ');
    return '$totalImages images added';
  }

  void _saveWorkerData() {
    final workerImagePath = _workerImage?.path;

    // TODO: Update your report_creation_data
    // Example:
    // context.read<ReportCreationBloc>().add(
    //   UpdateWorkerData(
    //     imagePath: workerImagePath,
    //     workerCount: _workerCount,
    //   ),
    // );

    print('Worker data saved:');
    print('  Image: $workerImagePath');
    print('  Worker count: $_workerCount');
  }

  String? _getNotesDisplayText() {
    if (_notes != null && _notes!.isNotEmpty) {
      if (_additionalImages.isNotEmpty) {
        return 'Notes added | ${_additionalImages.length} image(s)';
      }
      return 'Notes added';
    } else if (_additionalImages.isNotEmpty) {
      return '${_additionalImages.length} image(s) added';
    }
    return null;
  }

  Future<void> _handleRemoveData() async {
    // Show confirmation dialog
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Draft Data'),
        content: const Text(
          'Are you sure you want to remove all draft data? This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text('Remove'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      // Clear local state
      setState(() {
        _workerImage = null;
        _workerCount = null;
        _notes = null;
        _additionalImages.clear();
        addedQuantities.clear();
        addedEquipments.clear();
        _conditionSnapshotImages = {'before': [], 'current': [], 'after': []};
      });

      // Clear BLoC state - Reset selections and formData
      _reportCreationBloc.add(const ResetForm());

      // Show success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Draft data has been removed'),
          backgroundColor: Colors.green,
        ),
      );

      print('✅ All draft data cleared');
    }
  }
}
