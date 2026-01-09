import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/divider_config.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../../shared/widgets/gallery/gallery_widget.dart';
import '../../../../shared/widgets/gallery/models/gallery_image.dart';
import '../../../../shared/widgets/gallery/models/gallery_result.dart';
import '../../../../shared/widgets/location_picker/editable_location_map_widget.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../../contractor_relation/domain/entities/contractor_relation_entity.dart';
import '../../../contractor_relation/presentation/bloc/contractor_relation_bloc.dart';
import '../../../contractor_relation/presentation/bloc/contractor_relation_state.dart';
import '../../../daily_report/presentation/widgets/report_creation/shared/custom_fields_tile_widget.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../bloc/program/program_bloc.dart';
import '../bloc/program_draft/program_draft_bloc.dart';
import '../bloc/program_draft/program_draft_event.dart';
import '../bloc/program_draft/program_draft_state.dart';

class R02ProgramCreationDraftPage extends StatefulWidget {
  final String? draftUID;
  final int? workScopeID;
  final String? workScopeUID;
  final String? workScopeName;
  final String? workScopeCode;
  final Road? road;
  final double? section;

  const R02ProgramCreationDraftPage({
    super.key,
    this.draftUID,
    this.workScopeID,
    this.workScopeUID,
    this.workScopeName,
    this.workScopeCode,
    this.road,
    this.section,
  });

  @override
  State<R02ProgramCreationDraftPage> createState() =>
      _R02ProgramCreationDraftPageState();
}

class _R02ProgramCreationDraftPageState
    extends State<R02ProgramCreationDraftPage> {
  late final ProgramDraftBloc _programDraftBloc;
  late final CompanyBloc _companyBloc;
  late final ProgramBloc _programBloc;
  Timer? _autoSaveDebounce;

  double? _latitude;
  double? _longitude;
  bool _isLoadingLocation = false;
  ContractorRelation? _selectedContractor;
  Map<String, Map<String, dynamic>> _quantityFieldData = {};

  @override
  void initState() {
    super.initState();

    _programDraftBloc = getIt<ProgramDraftBloc>();
    _companyBloc = getIt<CompanyBloc>();
    _programBloc = context.read<ProgramBloc>();

    if (widget.draftUID != null) {
      _loadExistingDraft();
    } else {
      _initializeNewDraft();
      _getCurrentLocation();
    }
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
      print('📝 Initializing new program draft...');

      _programDraftBloc.add(
        ProgramDraftEvent.initializeDraft(
          companyUID: companyState.selectedCompany!.uid,
          workScopeID: widget.workScopeID!,
          workScopeUID: widget.workScopeUID!,
          workScopeName: widget.workScopeName!,
          workScopeCode: widget.workScopeCode!,
          road: widget.road,
          section: widget.section,
        ),
      );

      print('✅ Draft initialization event dispatched');
    }
  }

  @override
  void dispose() {
    _autoSaveDebounce?.cancel();
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
            CustomSnackBar.show(context, 'Location permissions are denied');
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
            'Location permissions are permanently denied. Please enable in settings.',
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

      print('📍 Location obtained: $_latitude, $_longitude');

      _programDraftBloc.add(
        ProgramDraftEvent.updateLocation(
          latitude: position.latitude,
          longitude: position.longitude,
        ),
      );

      _triggerAutoSave();
    } catch (e) {
      print('❌ Error getting location: $e');
      if (mounted) {
        CustomSnackBar.show(
          context,
          'Failed to get current location: ${e.toString()}',
        );
      }
      setState(() {
        _isLoadingLocation = false;
      });
    }
  }

  Future<void> _handleRemoveData() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Draft'),
        content: const Text(
          'Are you sure you want to remove this draft? This action cannot be undone.',
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
      final draftUID = widget.draftUID;

      if (draftUID != null) {
        _programDraftBloc.add(
          ProgramDraftEvent.deleteDraft(draftUID: draftUID),
        );
        print('✅ Draft deleted from database: $draftUID');
      } else {
        _programDraftBloc.add(const ProgramDraftEvent.resetForm());
        print('✅ All draft data cleared');
      }

      if (mounted) {
        CustomSnackBar.show(
          context,
          'Draft has been removed',
          type: SnackBarType.success,
        );
        Navigator.of(context).pop();
      }
    }
  }

  void _showContractorSelection() {
    final contractorState = context.read<ContractorRelationBloc>().state;

    contractorState.when(
      initial: () {
        CustomSnackBar.show(context, 'Loading contractors...');
      },
      loading: () {
        CustomSnackBar.show(context, 'Loading contractors...');
      },
      loaded: (contractors, selectedContractor) {
        if (contractors.isEmpty) {
          CustomSnackBar.show(context, 'No contractors available');
          return;
        }

        showFlexibleBottomsheet(
          context: context,
          title: 'Select Contractor',
          attributes: contractors.map((contractor) => contractor.name).toList(),
          isRadio: true,
          onSelectionChanged: (selectedName) {
            final selected = contractors.firstWhere(
              (contractor) => contractor.name == selectedName,
            );

            setState(() {
              _selectedContractor = selected;
            });

            print(
              '✅ Selected contractor: ${selected.name} (${selected.contractRelationUID})',
            );

            _programDraftBloc.add(
              ProgramDraftEvent.updateContractor(contractor: selected),
            );

            _triggerAutoSave();
          },
        );
      },
      failure: (errorMessage) {
        CustomSnackBar.show(
          context,
          'Failed to load contractors: $errorMessage',
        );
      },
    );
  }

  void _handleQuantityTap() {
    // Get program settings from ProgramBloc
    final programState = _programBloc.state;

    programState.maybeWhen(
      loaded: (programSettings, contractorRoads) {
        if (programSettings.isEmpty) {
          CustomSnackBar.show(
            context,
            'No program settings available',
            type: SnackBarType.warning,
          );
          return;
        }

        // Find the current work scope's program setting
        final currentSetting = programSettings.firstWhere(
          (setting) => setting.workScope?.uid == widget.workScopeUID,
          orElse: () => programSettings.first,
        );

        if (currentSetting.quantityTypes == null ||
            currentSetting.quantityTypes!.isEmpty) {
          CustomSnackBar.show(
            context,
            'No quantities available for this work scope',
            type: SnackBarType.warning,
          );
          return;
        }

        // TODO: Navigate to ProgramQuantitySelectionPage
        // Similar to DailyReport's QuantitySelectionPage
        print(
          '📦 Quantity types available: ${currentSetting.quantityTypes!.length}',
        );
        print(
          '   Quantities: ${currentSetting.quantityTypes!.map((qt) => qt.name).toList()}',
        );

        CustomSnackBar.show(
          context,
          'Quantity selection coming soon...',
          type: SnackBarType.info,
        );
      },
      orElse: () {
        CustomSnackBar.show(
          context,
          'Loading program settings...',
          type: SnackBarType.info,
        );
      },
    );
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
              _selectedContractor = draftData.contractor;
              _quantityFieldData = Map.from(draftData.quantityFieldData);
              _latitude = draftData.latitude;
              _longitude = draftData.longitude;
            });
          },
          autoSaving: (draftData) {
            setState(() {
              _selectedContractor = draftData.contractor;
              _quantityFieldData = Map.from(draftData.quantityFieldData);
              _latitude = draftData.latitude;
              _longitude = draftData.longitude;
            });
          },
          autoSaved: (draftData) {},
          submitting: (draftData) {},
          submitted: (draftData) {
            CustomSnackBar.show(context, 'Program submitted successfully!');
            Navigator.pop(context, true);
            Navigator.pop(context, true);
          },
          error: (failure, draftData) {
            CustomSnackBar.show(context, failure.message);
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                size: ResponsiveHelper.iconSize(
                                  context,
                                  base: 20,
                                ),
                              ),
                            ),
                          ),

                          TextButton(
                            onPressed: () {
                              _handleRemoveData();
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.red,
                              side: BorderSide(color: Colors.red, width: 1.5),
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
                      SizedBox(height: 13),
                      Text(
                        'Draft R02 Program',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 18,
                          ),
                        ),
                      ),
                      Text(
                        'Please fill in the information listed below',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 12,
                          ),
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
                      vertical: 15,
                      horizontal: 15,
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

                        // Scope of Work
                        if (widget.workScopeID != null) ...[
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
                                    color: Color.fromARGB(255, 214, 226, 255),
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
                                      Text(
                                        'Scope of Work',
                                        style: TextStyle(
                                          fontSize: ResponsiveHelper.fontSize(
                                            context,
                                            base: 12,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${widget.workScopeCode} - ${widget.workScopeName}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: ResponsiveHelper.fontSize(
                                            context,
                                            base: 13,
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

                        // Location (Road)
                        if (widget.road != null) ...[
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
                                    color: Color.fromARGB(255, 214, 226, 255),
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
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Route',
                                        style: TextStyle(
                                          fontSize: ResponsiveHelper.fontSize(
                                            context,
                                            base: 12,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${widget.road?.roadNo} - ${widget.road?.name}',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: ResponsiveHelper.fontSize(
                                            context,
                                            base: 13,
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

                        // Section
                        if (widget.section != null) ...[
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
                                    color: Color.fromARGB(255, 214, 226, 255),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Icon(
                                      Icons.swap_calls,
                                      color: primaryColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Section',
                                      style: TextStyle(
                                        fontSize: ResponsiveHelper.fontSize(
                                          context,
                                          base: 12,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      widget.section.toString(),
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

                        // Google Maps
                        const SizedBox(height: 10),

                        BlocBuilder<ProgramDraftBloc, ProgramDraftState>(
                          bloc: _programDraftBloc,
                          builder: (context, draftState) {
                            final latitude = draftState.maybeWhen(
                              editing: (draftData) => draftData.latitude,
                              autoSaving: (draftData) => draftData.latitude,
                              autoSaved: (draftData) => draftData.latitude,
                              submitting: (draftData) => draftData.latitude,
                              orElse: () => _latitude,
                            );

                            final longitude = draftState.maybeWhen(
                              editing: (draftData) => draftData.longitude,
                              autoSaving: (draftData) => draftData.longitude,
                              autoSaved: (draftData) => draftData.longitude,
                              submitting: (draftData) => draftData.longitude,
                              orElse: () => _longitude,
                            );

                            print(
                              '🗺️ Map rendering with: ($latitude, $longitude)',
                            );

                            if (_isLoadingLocation &&
                                latitude == null &&
                                longitude == null) {
                              return Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircularProgressIndicator(
                                        color: primaryColor,
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                        'Getting current location...',
                                        style: TextStyle(
                                          fontSize: ResponsiveHelper.fontSize(
                                            context,
                                            base: 12,
                                          ),
                                          color: Colors.grey.shade600,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }

                            return EditableLocationMapWidget(
                              key: ValueKey('${latitude}_${longitude}'),
                              latitude: latitude,
                              longitude: longitude,
                              markerTitle: widget.road?.name,
                              onLocationUpdated: (lat, lng) {
                                setState(() {
                                  _latitude = lat;
                                  _longitude = lng;
                                });

                                _programDraftBloc.add(
                                  ProgramDraftEvent.updateLocation(
                                    latitude: lat,
                                    longitude: lng,
                                  ),
                                );

                                _triggerAutoSave();
                              },
                            );
                          },
                        ),

                        SizedBox(height: 20),

                        // Contractor (optional for R02)
                        BlocBuilder<ProgramDraftBloc, ProgramDraftState>(
                          bloc: _programDraftBloc,
                          builder: (context, draftState) {
                            final contractor = draftState.when(
                              initial: () => null,
                              loading: () => null,
                              editing: (draftData) => draftData.contractor,
                              autoSaving: (draftData) => draftData.contractor,
                              autoSaved: (draftData) => draftData.contractor,
                              submitting: (draftData) => draftData.contractor,
                              submitted: (draftData) => null,
                              error: (failure, draftData) =>
                                  draftData?.contractor,
                            );

                            return CustomFieldTile(
                              icon: Icons.business,
                              title: 'Contractor',
                              titleDetails: contractor != null
                                  ? contractor.name
                                  : 'Choose contractor (optional)',
                              isFilled: contractor != null,
                              onTap: _showContractorSelection,
                              isRequired: false,
                            );
                          },
                        ),

                        // Quantity Selection (NEW - Dynamic from program-settings)
                        BlocBuilder<ProgramDraftBloc, ProgramDraftState>(
                          bloc: _programDraftBloc,
                          builder: (context, draftState) {
                            final quantityFieldData = draftState.when(
                              initial: () => <String, Map<String, dynamic>>{},
                              loading: () => <String, Map<String, dynamic>>{},
                              editing: (draftData) =>
                                  draftData.quantityFieldData,
                              autoSaving: (draftData) =>
                                  draftData.quantityFieldData,
                              autoSaved: (draftData) =>
                                  draftData.quantityFieldData,
                              submitting: (draftData) =>
                                  draftData.quantityFieldData,
                              submitted: (draftData) =>
                                  <String, Map<String, dynamic>>{},
                              error: (failure, draftData) =>
                                  draftData?.quantityFieldData ??
                                  <String, Map<String, dynamic>>{},
                            );

                            return CustomFieldTile(
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
                            );
                          },
                        ),

                        // Photos
                        BlocBuilder<ProgramDraftBloc, ProgramDraftState>(
                          bloc: _programDraftBloc,
                          builder: (context, draftState) {
                            final programImages = draftState.when(
                              initial: () => <String>[],
                              loading: () => <String>[],
                              editing: (draftData) => draftData.programImages,
                              autoSaving: (draftData) =>
                                  draftData.programImages,
                              autoSaved: (draftData) => draftData.programImages,
                              submitting: (draftData) =>
                                  draftData.programImages,
                              submitted: (draftData) => <String>[],
                              error: (failure, draftData) =>
                                  draftData?.programImages ?? [],
                            );

                            return CustomFieldTile(
                              icon: Icons.camera_alt_rounded,
                              title: 'Photos',
                              titleDetails: programImages.isEmpty
                                  ? 'Take pictures (optional)'
                                  : '${programImages.length} image${programImages.length > 1 ? 's' : ''} selected',
                              isFilled: programImages.isNotEmpty,
                              onTap: () async {
                                print('📷 Opening gallery for program images');

                                final initialImages = programImages
                                    .map(
                                      (path) => GalleryImage(
                                        path: path,
                                        capturedAt: DateTime.now(),
                                      ),
                                    )
                                    .toList();

                                final result = await Navigator.push<GalleryResult>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GalleryWidget(
                                      title: 'Program Photos',
                                      inputProgress: false,
                                      pinPointFirst: false,
                                      maxImages: 10,
                                      minimumImage: 0,
                                      tabLock: false,
                                      pictures: programImages,
                                      onImagesChanged: (result) {
                                        print(
                                          '🔄 onImagesChanged callback: ${result.images?.length ?? 0} images',
                                        );
                                      },
                                    ),
                                  ),
                                );

                                if (result != null && result.images != null) {
                                  print(
                                    '✅ Gallery result: ${result.images!.length} images',
                                  );

                                  final imagePaths = result.images!
                                      .map((img) => img.path)
                                      .toList();

                                  _programDraftBloc.add(
                                    ProgramDraftEvent.updateProgramImages(
                                      programImages: imagePaths,
                                    ),
                                  );

                                  _triggerAutoSave();
                                } else {
                                  print('⚠️ No result or images is null');
                                }
                              },
                              isRequired: false,
                            );
                          },
                        ),

                        SizedBox(height: 60),

                        // Submit Button
                        BlocBuilder<ProgramDraftBloc, ProgramDraftState>(
                          bloc: _programDraftBloc,
                          builder: (context, draftState) {
                            final isSubmitting =
                                draftState is ProgramDraftSubmitting;

                            return SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: isSubmitting
                                    ? null
                                    : () {
                                        final companyState = _companyBloc.state;
                                        if (companyState is CompanyLoaded &&
                                            companyState.selectedCompany !=
                                                null) {
                                          _programDraftBloc.add(
                                            ProgramDraftEvent.submitProgram(
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
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 2,
                                ),
                                child: isSubmitting
                                    ? SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
                                        'Submit',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: ResponsiveHelper.fontSize(
                                            context,
                                            base: 14,
                                          ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
