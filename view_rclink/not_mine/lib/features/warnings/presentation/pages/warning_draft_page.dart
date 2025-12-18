import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/divider_config.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../../shared/widgets/gallery/gallery_widget.dart';
import '../../../../shared/widgets/gallery/models/gallery_image.dart';
import '../../../../shared/widgets/gallery/models/gallery_result.dart';
import '../../../../shared/widgets/location_picker/editable_location_map_widget.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../../contractor_relation/domain/entities/contractor_relation_entity.dart';
import '../../../contractor_relation/presentation/bloc/contractor_relation_bloc.dart';
import '../../../daily_report/presentation/widgets/report_creation/shared/custom_fields_tile_widget.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../bloc/site_warning_draft/site_warning_draft_bloc.dart';
import '../bloc/site_warning_draft/site_warning_draft_event.dart';
import '../bloc/site_warning_draft/site_warning_draft_state.dart';
import '../bloc/warning_categories/warning_categories_bloc.dart';
import '../bloc/warning_categories/warning_categories_state.dart';
import '../widgets/warning_draft_list_selection.dart';

import '../../../contractor_relation/presentation/bloc/contractor_relation_state.dart';

class WarningDraftPage extends StatefulWidget {
  final String? draftUID;
  final int? scopeID;
  final String? scopeUID;
  final String? scopeName;
  final Road? road;
  final String? startSection;
  final String? endSection;

  const WarningDraftPage({
    super.key,
    this.draftUID,
    this.scopeID,
    this.scopeUID,
    this.scopeName,
    this.road,
    this.startSection,
    this.endSection,
  });

  @override
  State<WarningDraftPage> createState() => _WarningDraftPageState();
}

class _WarningDraftPageState extends State<WarningDraftPage> {
  late final SiteWarningDraftBloc _siteWarningDraftBloc;
  late final CompanyBloc _companyBloc;
  Timer? _autoSaveDebounce;

  double? _latitude;
  double? _longitude;
  bool _isLoadingLocation = false;
  List<String> _selectedWarningReasonUIDs = [];
  int? _workScopeID;
  ContractorRelation? _selectedContractor;

  @override
  void initState() {
    super.initState();

    _siteWarningDraftBloc = getIt<SiteWarningDraftBloc>();
    _companyBloc = getIt<CompanyBloc>();

    if (widget.draftUID != null) {
      _loadExistingDraft();
    } else {
      _initializeNewDraft();
      _getCurrentLocation();
    }
  }

  void _loadExistingDraft() {
    print('📂 Loading existing draft: ${widget.draftUID}');

    _siteWarningDraftBloc.add(
      SiteWarningDraftEvent.loadExistingDraft(draftUID: widget.draftUID!),
    );

    print('✅ Load existing draft event dispatched');
  }

  void _initializeNewDraft() {
    final companyState = _companyBloc.state;
    if (companyState is CompanyLoaded && companyState.selectedCompany != null) {
      print('📝 Initializing new draft...');

      _siteWarningDraftBloc.add(
        SiteWarningDraftEvent.initializeDraft(
          companyUID: companyState.selectedCompany!.uid,
          scopeID: widget.scopeID!,
          scopeUID: widget.scopeUID!,
          scopeName: widget.scopeName!,
          road: widget.road!,
          startSection: widget.startSection!,
          endSection: widget.endSection,
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
      _siteWarningDraftBloc.add(const SiteWarningDraftEvent.autoSaveDraft());
    });
  }

  // void _getWorkScopeID() {
  //   final state = context.read<WarningCategoriesBloc>().state;
  //   state.whenOrNull(
  //     loaded: (categories) {
  //       for (var catWithReasons in categories) {
  //         for (var reason in catWithReasons.reasons) {
  //           setState(() {
  //             _workScopeID = reason.workScopeID;
  //           });
  //           return;
  //         }
  //       }
  //     },
  //   );
  // }

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

      _siteWarningDraftBloc.add(
        SiteWarningDraftEvent.updateLocation(
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

            print('✅ Selected contractor: ${selected.name} (${selected.uid})');

            _siteWarningDraftBloc.add(
              SiteWarningDraftEvent.updateContractor(contractor: selected),
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

  @override
  Widget build(BuildContext context) {
    return BlocListener<SiteWarningDraftBloc, SiteWarningDraftState>(
      bloc: _siteWarningDraftBloc,
      listener: (context, state) {
        state.when(
          initial: () {},
          loading: () {},
          editing: (draftData) {
            setState(() {
              _selectedContractor = draftData.contractor;
              _selectedWarningReasonUIDs = List.from(
                draftData.warningReasonUIDs,
              );
              _latitude = draftData.latitude;
              _longitude = draftData.longitude;
              _workScopeID = draftData.scopeID;
            });
          },
          autoSaving: (draftData) {
            setState(() {
              _selectedContractor = draftData.contractor;
              _selectedWarningReasonUIDs = List.from(
                draftData.warningReasonUIDs,
              );
              _latitude = draftData.latitude;
              _longitude = draftData.longitude;
            });
          },
          autoSaved: (draftData) {},
          submitting: (draftData) {},
          submitted: (draftData) {
            CustomSnackBar.show(context, 'Warning submitted successfully!');
            Navigator.pop(context, true);
          },
          error: (failure, draftData) {
            CustomSnackBar.show(context, failure.message);
          },
          draftListLoaded: (drafts) {},
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
                              // if (_currentPage > 0) {
                              //   _goToPreviousPage();
                              // } else {
                              //   Navigator.pop(context);
                              // }

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
                            onPressed: () {},
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
                        'Draft Site Warning',
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
                        if (widget.scopeID != null) ...[
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
                                        widget.scopeName!.toUpperCase(),
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

                        // Location
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
                                        'Location',
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
                        if (widget.startSection != null) ...[
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
                                      widget.endSection != null
                                          ? '${widget.startSection.toString()} - ${widget.endSection.toString()}'
                                          : widget.startSection.toString(),
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
                        ],

                        // Google Maps
                        const SizedBox(height: 20),

                        BlocBuilder<
                          SiteWarningDraftBloc,
                          SiteWarningDraftState
                        >(
                          bloc: _siteWarningDraftBloc,
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

                                _siteWarningDraftBloc.add(
                                  SiteWarningDraftEvent.updateLocation(
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

                        BlocBuilder<
                          SiteWarningDraftBloc,
                          SiteWarningDraftState
                        >(
                          bloc: _siteWarningDraftBloc,
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
                              draftListLoaded: (drafts) => null,
                            );

                            return CustomFieldTile(
                              icon: Icons.business,
                              title: 'Contractor',
                              titleDetails: contractor != null
                                  ? contractor.name
                                  : 'Choose contractor',
                              isFilled: contractor != null,
                              onTap: _showContractorSelection,
                              isRequired: true,
                            );
                          },
                        ),

                        // Warning List
                        BlocBuilder<
                          SiteWarningDraftBloc,
                          SiteWarningDraftState
                        >(
                          bloc: _siteWarningDraftBloc,
                          builder: (context, draftState) {
                            final warningReasonUIDs = draftState.when(
                              initial: () => <String>[],
                              loading: () => <String>[],
                              editing: (draftData) =>
                                  draftData.warningReasonUIDs,
                              autoSaving: (draftData) =>
                                  draftData.warningReasonUIDs,
                              autoSaved: (draftData) =>
                                  draftData.warningReasonUIDs,
                              submitting: (draftData) =>
                                  draftData.warningReasonUIDs,
                              submitted: (draftData) => <String>[],
                              error: (failure, draftData) =>
                                  draftData?.warningReasonUIDs ?? [],
                              draftListLoaded: (drafts) => <String>[],
                            );

                            return BlocBuilder<
                              WarningCategoriesBloc,
                              WarningCategoriesState
                            >(
                              builder: (context, categoriesState) {
                                return CustomFieldTile(
                                  icon: Icons.list_sharp,
                                  title: 'List',
                                  titleDetails: warningReasonUIDs.isEmpty
                                      ? 'Select warnings'
                                      : '${warningReasonUIDs.length} warning${warningReasonUIDs.length > 1 ? 's' : ''} selected',
                                  isFilled: warningReasonUIDs.isNotEmpty,
                                  onTap: () async {
                                    categoriesState.when(
                                      initial: () {
                                        CustomSnackBar.show(
                                          context,
                                          'Loading warning categories...',
                                        );
                                      },
                                      loading: () {
                                        CustomSnackBar.show(
                                          context,
                                          'Loading warning categories...',
                                        );
                                      },
                                      loaded: (categories) async {
                                        final result = await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                WarningDraftListSelection(
                                                  categories: categories,
                                                  workScopeID: _workScopeID,
                                                  warningType: 'SITE_WARNING',
                                                  initialSelectedUIDs:
                                                      warningReasonUIDs,
                                                ),
                                          ),
                                        );

                                        if (result != null &&
                                            result is List<String>) {
                                          setState(() {
                                            _selectedWarningReasonUIDs = result;
                                          });

                                          _siteWarningDraftBloc.add(
                                            SiteWarningDraftEvent.updateWarningReasons(
                                              warningReasonUIDs: result,
                                            ),
                                          );

                                          _triggerAutoSave();
                                        }
                                      },
                                      error: (failure) {
                                        CustomSnackBar.show(
                                          context,
                                          'Failed to load warning categories: ${failure.message}',
                                        );
                                      },
                                    );
                                  },
                                  isRequired: true,
                                );
                              },
                            );
                          },
                        ),

                        // Photos
                        BlocBuilder<
                          SiteWarningDraftBloc,
                          SiteWarningDraftState
                        >(
                          bloc: _siteWarningDraftBloc,
                          builder: (context, draftState) {
                            final warningImages = draftState.when(
                              initial: () => <String>[],
                              loading: () => <String>[],
                              editing: (draftData) => draftData.warningImages,
                              autoSaving: (draftData) =>
                                  draftData.warningImages,
                              autoSaved: (draftData) => draftData.warningImages,
                              submitting: (draftData) =>
                                  draftData.warningImages,
                              submitted: (draftData) => <String>[],
                              error: (failure, draftData) =>
                                  draftData?.warningImages ?? [],
                              draftListLoaded: (drafts) => <String>[],
                            );

                            return CustomFieldTile(
                              icon: Icons.camera_alt_rounded,
                              title: 'Photos',
                              titleDetails: warningImages.isEmpty
                                  ? 'Take picture of site'
                                  : '${warningImages.length} image${warningImages.length > 1 ? 's' : ''} selected',
                              isFilled: warningImages.isNotEmpty,
                              onTap: () async {
                                print('📷 Opening gallery for warning images');

                                final initialImages = warningImages
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
                                      title: 'Warning Photos',
                                      inputProgress: false,
                                      pinPointFirst: false,
                                      maxImages: 6,
                                      minimumImage: 2,
                                      tabLock: false,
                                      pictures: warningImages,
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

                                  _siteWarningDraftBloc.add(
                                    SiteWarningDraftEvent.updateWarningImages(
                                      warningImages: imagePaths,
                                    ),
                                  );

                                  _triggerAutoSave();
                                } else {
                                  print('⚠️ No result or images is null');
                                }
                              },
                              isRequired: true,
                            );
                          },
                        ),

                        SizedBox(height: 60),

                        // Submit Button
                        BlocBuilder<
                          SiteWarningDraftBloc,
                          SiteWarningDraftState
                        >(
                          bloc: _siteWarningDraftBloc,
                          builder: (context, draftState) {
                            final isSubmitting =
                                draftState is SiteWarningDraftSubmitting;

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
                                          _siteWarningDraftBloc.add(
                                            SiteWarningDraftEvent.submitWarning(
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
