import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import 'package:rclink_app/features/company/presentation/bloc/company_bloc.dart';

import 'package:rclink_app/features/daily_report/presentation/bloc/daily_report_create/daily_report_create_state.dart';
import 'package:rclink_app/features/daily_report/presentation/widgets/report_creation/equipment_page.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_equipment.dart';
import 'package:rclink_app/features/work_scope/domain/entities/work_quantity_type.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/custom_snackbar.dart';
import '../../../../../shared/widgets/divider_config.dart';
import '../../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../../../shared/widgets/gallery/gallery_widget.dart';
import '../../../../../shared/widgets/gallery/models/gallery_image.dart';
import '../../../../../shared/widgets/gallery/models/gallery_result.dart';
import '../../../../../shared/widgets/gallery/service/permission_service.dart';
import '../../../../company/presentation/bloc/company_state.dart';
import '../../bloc/daily_report_create/daily_report_create_bloc.dart';
import '../../bloc/daily_report_create/daily_report_create_event.dart';
import '../../bloc/daily_report_view/daily_report_view_bloc.dart';
import '../../bloc/daily_report_view/daily_report_view_event.dart';
import 'notes_bottomsheet.dart';
import 'quantity_selection_page.dart';
import 'shared/custom_fields_tile_widget.dart';
import 'show_tips_selections.dart';
import 'worker_number_bottomsheet.dart';

class DraftDailyReportPage extends StatefulWidget {
  const DraftDailyReportPage({super.key});

  @override
  State<DraftDailyReportPage> createState() => _DraftDailyReportPageState();
}

class _DraftDailyReportPageState extends State<DraftDailyReportPage> {
  late final DailyReportCreateBloc _dailyReportCreateBloc;
  late final CompanyBloc _companyBloc;

  // Debounce timer for auto-save to prevent race conditions
  Timer? _autoSaveDebounce;

  // GPS fetching state for background location retrieval
  Position? _lastKnownPosition;
  bool _isFetchingGPS = false;

  @override
  void initState() {
    super.initState();
    _dailyReportCreateBloc = getIt<DailyReportCreateBloc>();
    _companyBloc = getIt<CompanyBloc>();
  }

  @override
  void dispose() {
    _autoSaveDebounce?.cancel();
    super.dispose();
  }

  /// Debounced auto-save to prevent race conditions when multiple fields are updated rapidly
  void _triggerAutoSave() {
    _autoSaveDebounce?.cancel();
    _autoSaveDebounce = Timer(const Duration(milliseconds: 500), () {
      final companyState = _companyBloc.state;
      if (companyState is CompanyLoaded &&
          companyState.selectedCompany != null) {
        _dailyReportCreateBloc.add(
          AutoSaveDraft(companyUID: companyState.selectedCompany!.uid),
        );
      }
    });
  }

  /// Start GPS fetching in the background without blocking UI
  /// This allows camera to open immediately while location is being retrieved
  /// GPS coordinates are saved to both images and the daily report form
  Future<void> _startBackgroundGPSFetch() async {
    // Prevent multiple concurrent GPS fetches
    if (_isFetchingGPS) {
      print('⚠️ GPS fetch already in progress, skipping...');
      return;
    }

    setState(() => _isFetchingGPS = true);
    print('📍 Starting background GPS fetch...');

    try {
      final position = await PermissionService.getCurrentLocation();

      if (position != null && mounted) {
        setState(() {
          _lastKnownPosition = position;
        });

        print('✅ GPS location acquired: ${position.latitude}, ${position.longitude}');

        // Update daily report form with GPS coordinates
        _dailyReportCreateBloc.add(
          UpdateFieldValue(
            fieldKey: 'longitude',
            value: position.longitude.toString(),
          ),
        );
        _dailyReportCreateBloc.add(
          UpdateFieldValue(
            fieldKey: 'latitude',
            value: position.latitude.toString(),
          ),
        );

        print('📍 GPS coordinates saved to daily report form');
      } else {
        print('⚠️ GPS location unavailable');
      }
    } catch (e) {
      print('❌ GPS fetch error: $e');
    } finally {
      if (mounted) {
        setState(() => _isFetchingGPS = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DailyReportCreateBloc, DailyReportCreateState>(
      bloc: _dailyReportCreateBloc,
      listener: (context, state) {
        state.maybeWhen(
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
      child: BlocBuilder<DailyReportCreateBloc, DailyReportCreateState>(
        bloc: _dailyReportCreateBloc,
        builder: (context, reportState) {
          // Extract selections data once for reuse throughout the widget
          final workerCount = reportState.maybeWhen(
            selectingBasicInfo: (apiData, selections) => selections.workerCount,
            editingDetails: (apiData, selections, formData) =>
                selections.workerCount,
            basicInfoError: (apiData, selections, errorMessage) =>
                selections.workerCount,
            detailsError: (apiData, selections, formData, errorMessage) =>
                selections.workerCount,
            submitting: (reportData) => reportData.selections.workerCount,
            submitted: (reportData) => reportData.selections.workerCount,
            submissionError: (reportData, errorMessage) =>
                reportData.selections.workerCount,
            orElse: () => null,
          );

          final workerImage = reportState.maybeWhen(
            selectingBasicInfo: (apiData, selections) => selections.workerImage,
            editingDetails: (apiData, selections, formData) =>
                selections.workerImage,
            basicInfoError: (apiData, selections, errorMessage) =>
                selections.workerImage,
            detailsError: (apiData, selections, formData, errorMessage) =>
                selections.workerImage,
            submitting: (reportData) => reportData.selections.workerImage,
            submitted: (reportData) => reportData.selections.workerImage,
            submissionError: (reportData, errorMessage) =>
                reportData.selections.workerImage,
            orElse: () => null,
          );

          final selectedEquipment = reportState.maybeWhen(
            selectingBasicInfo: (apiData, selections) =>
                selections.selectedEquipment.map((e) => e.uid).toList(),
            editingDetails: (apiData, selections, formData) =>
                selections.selectedEquipment.map((e) => e.uid).toList(),
            basicInfoError: (apiData, selections, errorMessage) =>
                selections.selectedEquipment.map((e) => e.uid).toList(),
            detailsError: (apiData, selections, formData, errorMessage) =>
                selections.selectedEquipment.map((e) => e.uid).toList(),
            submitting: (reportData) => reportData.selections.selectedEquipment
                .map((e) => e.uid)
                .toList(),
            submitted: (reportData) => reportData.selections.selectedEquipment
                .map((e) => e.uid)
                .toList(),
            submissionError: (reportData, errorMessage) => reportData
                .selections
                .selectedEquipment
                .map((e) => e.uid)
                .toList(),
            orElse: () => <String>[],
          );

          final conditionSnapshots = reportState.maybeWhen(
            selectingBasicInfo: (apiData, selections) =>
                selections.conditionSnapshots,
            editingDetails: (apiData, selections, formData) =>
                selections.conditionSnapshots,
            basicInfoError: (apiData, selections, errorMessage) =>
                selections.conditionSnapshots,
            detailsError: (apiData, selections, formData, errorMessage) =>
                selections.conditionSnapshots,
            submitting: (reportData) =>
                reportData.selections.conditionSnapshots,
            submitted: (reportData) => reportData.selections.conditionSnapshots,
            submissionError: (reportData, errorMessage) =>
                reportData.selections.conditionSnapshots,
            orElse: () => <String, List<Map<String, dynamic>>>{},
          );

          final notes = reportState.maybeWhen(
            selectingBasicInfo: (apiData, selections) => selections.notes,
            editingDetails: (apiData, selections, formData) => selections.notes,
            basicInfoError: (apiData, selections, errorMessage) =>
                selections.notes,
            detailsError: (apiData, selections, formData, errorMessage) =>
                selections.notes,
            submitting: (reportData) => reportData.selections.notes,
            submitted: (reportData) => reportData.selections.notes,
            submissionError: (reportData, errorMessage) =>
                reportData.selections.notes,
            orElse: () => null,
          );

          final additionalImages = reportState.maybeWhen(
            selectingBasicInfo: (apiData, selections) =>
                selections.additionalImages,
            editingDetails: (apiData, selections, formData) =>
                selections.additionalImages,
            basicInfoError: (apiData, selections, errorMessage) =>
                selections.additionalImages,
            detailsError: (apiData, selections, formData, errorMessage) =>
                selections.additionalImages,
            submitting: (reportData) => reportData.selections.additionalImages,
            submitted: (reportData) => reportData.selections.additionalImages,
            submissionError: (reportData, errorMessage) =>
                reportData.selections.additionalImages,
            orElse: () => <Map<String, dynamic>>[],
          );

          final scopeString = reportState.maybeWhen(
            selectingBasicInfo: (apiData, selections) =>
                selections.selectedScope?.name,
            editingDetails: (apiData, selections, formData) =>
                selections.selectedScope?.name,
            basicInfoError: (apiData, selections, errorMessage) =>
                selections.selectedScope?.name,
            detailsError: (apiData, selections, formData, errorMessage) =>
                selections.selectedScope?.name,
            submitting: (reportData) =>
                reportData.selections.selectedScope?.name,
            submitted: (reportData) =>
                reportData.selections.selectedScope?.name,
            submissionError: (reportData, errorMessage) =>
                reportData.selections.selectedScope?.name,
            orElse: () => null,
          );

          final roadString = reportState.maybeWhen(
            selectingBasicInfo: (apiData, selections) =>
                selections.selectedRoad?.name,
            editingDetails: (apiData, selections, formData) =>
                selections.selectedRoad?.name,
            basicInfoError: (apiData, selections, errorMessage) =>
                selections.selectedRoad?.name,
            detailsError: (apiData, selections, formData, errorMessage) =>
                selections.selectedRoad?.name,
            submitting: (reportData) =>
                reportData.selections.selectedRoad?.name,
            submitted: (reportData) => reportData.selections.selectedRoad?.name,
            submissionError: (reportData, errorMessage) =>
                reportData.selections.selectedRoad?.name,
            orElse: () => null,
          );

          final sectionString = reportState.maybeWhen(
            selectingBasicInfo: (apiData, selections) => selections.section,
            editingDetails: (apiData, selections, formData) =>
                selections.section,
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

          // Get quantity field data from BLoC state
          final quantityFieldData = reportState.maybeWhen(
            editingDetails: (apiData, selections, formData) =>
                selections.quantityFieldData,
            detailsError: (apiData, selections, formData, errorMessage) =>
                selections.quantityFieldData,
            submitting: (reportData) => reportData.selections.quantityFieldData,
            submitted: (reportData) => reportData.selections.quantityFieldData,
            submissionError: (reportData, errorMessage) =>
                reportData.selections.quantityFieldData,
            orElse: () => <String, Map<String, dynamic>>{},
          );

          return PopScope(
            canPop: true, // Data already auto-saved to BLoC, safe to navigate
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
                      SizedBox(
                        height: ResponsiveHelper.getHeight(context, 0.03),
                      ),

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
                                        showTipsSelection(
                                          context: context,
                                          onTipSelected: (tipType) {
                                            if (tipType ==
                                                'traffic_management') {
                                              print(
                                                'Navigate to Traffic Management Plan',
                                              );
                                            } else if (tipType ==
                                                'work_specification') {
                                              print(
                                                'Navigate to Work Specification',
                                              );
                                            }
                                          },
                                        );
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
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
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
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
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
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                              ),
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
                                        padding: const EdgeInsets.all(14),
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
                                          child: SizedBox(
                                            height: 20,
                                            child: Image.asset(
                                              'assets/images/icons/scope_of_work.png',
                                              fit: BoxFit.contain,
                                            ),
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
                                    ],
                                  ),
                                ),
                                dividerConfig(),
                              ],

                              // Worker
                              CustomFieldTile(
                                icon: Icons.person,
                                title: 'Worker',
                                titleDetails: workerImage == null
                                    ? 'Take picture of worker'
                                    : '$workerCount workers added',
                                isFilled: workerImage != null,
                                onTap: () async {
                                  final result =
                                      await Navigator.push<GalleryResult>(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => GalleryWidget(
                                            title: 'Worker',
                                            workerPicture: true,
                                            maxImages: 1,
                                            pictures: workerImage != null
                                                ? [
                                                    GalleryImage.fromJson(
                                                      workerImage,
                                                    ).path,
                                                  ]
                                                : null,
                                            onImagesChanged: (result) {},
                                            onDialogConfirm: () async {
                                              final newWorkerCount =
                                                  await WorkerNumberBottomsheet.showWithInfoBottomsheet(
                                                    context,
                                                    initialWorkerCount:
                                                        workerCount,
                                                  );

                                              if (newWorkerCount != null) {
                                                // Save worker count to BLoC
                                                _dailyReportCreateBloc.add(
                                                  UpdateWorkerCount(
                                                    newWorkerCount,
                                                  ),
                                                );
                                              }
                                            },
                                          ),
                                        ),
                                      );

                                  if (result != null) {
                                    if (result.images.isNotEmpty) {
                                      // Save worker image to BLoC
                                      final workerImageData = result
                                          .images
                                          .first
                                          .toJson();
                                      _dailyReportCreateBloc.add(
                                        UpdateWorkerImage(workerImageData),
                                      );

                                      // Trigger debounced auto-save
                                      _triggerAutoSave();
                                    } else {
                                      // Clear worker image in BLoC
                                      _dailyReportCreateBloc.add(
                                        const UpdateWorkerImage(null),
                                      );

                                      // Trigger debounced auto-save
                                      _triggerAutoSave();
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
                                titleDetails: selectedEquipment.isEmpty
                                    ? 'Choose tools'
                                    : '${selectedEquipment.length} equipment added',
                                isFilled: selectedEquipment.isNotEmpty,
                                onTap: () async {
                                  // Build addedEquipments map for EquipmentPage from selectedEquipment UIDs
                                  final addedEquipmentsForPage =
                                      selectedEquipment.map((uid) {
                                        final equipment = availableEquipments
                                            .firstWhere((eq) => eq.uid == uid);
                                        return {
                                          'uid': equipment.uid,
                                          'name': equipment.name,
                                        };
                                      }).toList();

                                  final result = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EquipmentPage(
                                        equipmentLists: availableEquipments,
                                        addedEquipments: addedEquipmentsForPage,
                                      ),
                                    ),
                                  );

                                  if (result != null) {
                                    final equipmentUids =
                                        (result as List<Map<String, dynamic>>)
                                            .map(
                                              (equipment) =>
                                                  equipment['uid'] as String,
                                            )
                                            .toList();

                                    _dailyReportCreateBloc.add(
                                      SelectEquipment(equipmentUids),
                                    );

                                    // Trigger debounced auto-save after equipment selection
                                    _triggerAutoSave();
                                  }
                                },
                                isRequired: true,
                              ),

                              // Condition Snapshot
                              CustomFieldTile(
                                icon: Icons.camera_alt,
                                title: 'Condition Snapshot',
                                titleDetails: _getConditionSnapshotSummary(
                                  conditionSnapshots,
                                ),
                                isFilled: conditionSnapshots.values.any(
                                  (list) => list.isNotEmpty,
                                ),
                                onTap: () async {
                                  // Start GPS fetching in background (non-blocking)
                                  // This allows camera to open immediately while location is retrieved
                                  _startBackgroundGPSFetch();

                                  // Convert conditionSnapshots from Map<String, List<Map>> to Map<String, List<GalleryImage>>
                                  final initialTabImages = conditionSnapshots
                                      .map((tab, images) {
                                        final galleryImages = images
                                            .map(
                                              (imgData) =>
                                                  GalleryImage.fromJson(
                                                    imgData,
                                                  ),
                                            )
                                            .toList();
                                        return MapEntry(tab, galleryImages);
                                      });

                                  final result =
                                      await Navigator.push<GalleryResult>(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => GalleryWidget(
                                            title: 'Condition Snapshot',
                                            inputProgress: true,
                                            pinPointFirst: false, // ✅ Camera opens immediately!
                                            maxImages: 10,
                                            minimumImage: 4,
                                            tabLock: true,
                                            initialTabImages: initialTabImages,
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
                                    final snapshotsData =
                                        <String, List<Map<String, dynamic>>>{};

                                    // Attach GPS coordinates from background fetch to images that don't have them
                                    result.tabImages!.forEach((tab, images) {
                                      final imagesWithGPS = images.map((img) {
                                        // If image already has GPS coordinates, keep them
                                        if (img.latitude != null && img.longitude != null) {
                                          return img;
                                        }

                                        // Otherwise, attach GPS from background fetch if available
                                        if (_lastKnownPosition != null) {
                                          print('📍 Attaching GPS to image: ${_lastKnownPosition!.latitude}, ${_lastKnownPosition!.longitude}');
                                          return img.copyWith(
                                            latitude: _lastKnownPosition!.latitude,
                                            longitude: _lastKnownPosition!.longitude,
                                          );
                                        }

                                        // No GPS available
                                        return img;
                                      }).toList();

                                      snapshotsData[tab] = imagesWithGPS
                                          .map((img) => img.toJson())
                                          .toList();
                                    });

                                    _dailyReportCreateBloc.add(
                                      UpdateConditionSnapshots(snapshotsData),
                                    );

                                    // Trigger debounced auto-save after condition snapshot update
                                    _triggerAutoSave();
                                  } else {
                                    print('⚠️ No result or tabImages is null');
                                  }
                                },
                                isRequired: true,
                              ),

                              // Quantity
                              CustomFieldTile(
                                imageIcon: 'assets/images/icons/quantity.png',
                                title: 'Quantity',
                                isFilled: quantityFieldData.isNotEmpty,
                                titleDetails: quantityFieldData.isEmpty
                                    ? 'Work-related quantity info'
                                    : '${quantityFieldData.length} added',
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
                                    _getNotesDisplayText(
                                      notes,
                                      additionalImages,
                                    ) ??
                                    'Notes or photos if additional',
                                isFilled:
                                    (notes != null && notes.isNotEmpty) ||
                                    additionalImages.isNotEmpty,
                                isRequired: true,
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
                                        final result =
                                            await showNotesBottomSheet(
                                              context: context,
                                              initialNotes: notes,
                                            );

                                        if (result != null) {
                                          // Save notes to BLoC
                                          _dailyReportCreateBloc.add(
                                            UpdateNotes(result),
                                          );

                                          print('Notes saved to BLoC: $result');

                                          // Trigger debounced auto-save after notes update
                                          _triggerAutoSave();
                                        }
                                      } else if (selectedOption ==
                                          'Additional Images') {
                                        // Convert additionalImages from List<Map> to List<GalleryImage>
                                        final currentImages = additionalImages
                                            .map(
                                              (imgData) =>
                                                  GalleryImage.fromJson(
                                                    imgData,
                                                  ),
                                            )
                                            .toList();

                                        final result =
                                            await Navigator.push<GalleryResult>(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    GalleryWidget(
                                                      title:
                                                          'Additional Images',

                                                      maxImages: 1,
                                                      pictures: currentImages
                                                          .map((e) => e.path)
                                                          .toList(),
                                                      onImagesChanged:
                                                          (result) {},
                                                    ),
                                              ),
                                            );

                                        if (result != null) {
                                          // Save additional images to BLoC
                                          final imagesData = result.images
                                              .map((img) => img.toJson())
                                              .toList();

                                          _dailyReportCreateBloc.add(
                                            UpdateAdditionalImages(imagesData),
                                          );

                                          print(
                                            'Additional images saved to BLoC: ${imagesData.length} images',
                                          );

                                          // Trigger debounced auto-save after additional images update
                                          _triggerAutoSave();
                                        }
                                      }
                                    },
                                  );
                                },
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
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        elevation: 2,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 16,
                                            height: 16,
                                            child: CircularProgressIndicator(
                                              strokeWidth: 2,
                                              valueColor:
                                                  AlwaysStoppedAnimation<Color>(
                                                    Colors.white,
                                                  ),
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Text(
                                            'Submitting...',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize:
                                                  ResponsiveHelper.fontSize(
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
                                            companyState.selectedCompany !=
                                                null) {
                                          _dailyReportCreateBloc.add(
                                            SubmitReport(
                                              companyUID: companyState
                                                  .selectedCompany!
                                                  .uid,
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
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
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
            ),
          );
        },
      ),
    );
  }

  void _handleQuantityTap() async {
    final reportState = _dailyReportCreateBloc.state;

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
        selectingBasicInfo: (apiData, selections) =>
            selections.selectedScope?.uid,
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

      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _dailyReportCreateBloc,
            child: QuantitySelectionPage(
              addedQuantities: [],
              quantityLists: availableQuantities,
              selectedScopeUid: selectedScopeUid,
            ),
          ),
        ),
      );

      // await Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => QuantitySelectionPage(
      //       addedQuantities: [], // Not used anymore, page reads from BLoC
      //       quantityLists: availableQuantities,
      //       selectedScopeUid: selectedScopeUid,
      //     ),
      //   ),
      // );

      // Trigger debounced auto-save after quantity selection
      // (matches pattern used by Worker, Equipment, Notes fields)
      _triggerAutoSave();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Loading quantities, please try again...'),
          backgroundColor: Colors.orange,
        ),
      );

      final companyState = _companyBloc.state;
      final selectedWorkScopeUID = reportState.maybeWhen(
        selectingBasicInfo: (apiData, selections) =>
            selections.selectedScope?.uid,
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
        _dailyReportCreateBloc.add(
          LoadQuantities(
            companyUID: companyState.selectedCompany!.uid,
            workScopeUID: selectedWorkScopeUID,
            forceRefresh: true,
          ),
        );
      }
    }
  }

  String _getConditionSnapshotSummary(
    Map<String, List<Map<String, dynamic>>> conditionSnapshots,
  ) {
    int totalImages = 0;
    conditionSnapshots.forEach((key, images) {
      totalImages += images.length;
    });

    if (totalImages == 0) {
      return "Please take a 'before' photo";
    }

    final before = conditionSnapshots['before']?.length ?? 0;
    final current = conditionSnapshots['current']?.length ?? 0;
    final after = conditionSnapshots['after']?.length ?? 0;

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

  String? _getNotesDisplayText(
    String? notes,
    List<Map<String, dynamic>> additionalImages,
  ) {
    if (notes != null && notes.isNotEmpty) {
      if (additionalImages.isNotEmpty) {
        return 'Notes added | ${additionalImages.length} image(s)';
      }
      return 'Notes added';
    } else if (additionalImages.isNotEmpty) {
      return '${additionalImages.length} image(s) added';
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
      // Get the draft UID from current state
      final reportState = _dailyReportCreateBloc.state;
      final draftUID = reportState.maybeWhen(
        editingDetails: (apiData, selections, formData) =>
            selections.draftReportUID,
        orElse: () => null,
      );

      if (draftUID != null) {
        // Delete the draft from database
        _dailyReportCreateBloc.add(DeleteDraft(draftUID: draftUID));

        // Refresh the draft list using injector
        final companyState = getIt<CompanyBloc>().state;
        if (companyState is CompanyLoaded &&
            companyState.selectedCompany != null) {
          getIt<DailyReportViewBloc>().add(
            DailyReportViewEvent.loadDraftReports(
              companyUID: companyState.selectedCompany!.uid,
            ),
          );
        }

        print('✅ Draft deleted from database: $draftUID');
      } else {
        // If no draft UID, just reset form
        _dailyReportCreateBloc.add(const ResetForm());

        print('✅ All draft data cleared');
      }

      // Show success message (with mounted check)
      if (mounted) {
        CustomSnackBar.show(
          context,
          'Draft has been removed',
          type: SnackBarType.success,
        );

        // ScaffoldMessenger.of(context).showSnackBar(
        //   const SnackBar(
        //     content: Text('Draft has been removed from local storage'),
        //     backgroundColor: Colors.green,
        //   ),
        // );

        Navigator.of(context).pop();
      }
    }
  }
}
