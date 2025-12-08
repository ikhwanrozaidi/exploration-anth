import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import '../../../../../../../lib/features/z_view_rclink/mine/shared/utils/responsive_helper.dart';
import '../../../../../../../lib/features/z_view_rclink/mine/shared/utils/theme.dart';
import '../../../../../../../lib/features/z_view_rclink/mine/shared/widgets/divider_config.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../../shared/widgets/location_map_widget.dart';
import '../../../../shared/widgets/location_picker/editable_location_map_widget.dart';
import '../../../contractor_relation/domain/entities/contractor_relation_entity.dart';
import '../../../contractor_relation/presentation/bloc/contractor_relation_bloc.dart';
import '../../../daily_report/presentation/widgets/report_creation/shared/custom_fields_tile_widget.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../bloc/warning_categories/warning_categories_bloc.dart';
import '../bloc/warning_categories/warning_categories_event.dart';
import '../bloc/warning_categories/warning_categories_state.dart';
import '../widgets/warning_draft_list_selection.dart';

import '../../../contractor_relation/presentation/bloc/contractor_relation_bloc.dart';
import '../../../contractor_relation/presentation/bloc/contractor_relation_state.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';

class WarningDraftPage extends StatefulWidget {
  final String scopeID;
  final String scopeName;
  final Road road;
  final String startSection;
  final String? endSection;

  const WarningDraftPage({
    super.key,
    required this.scopeID,
    required this.scopeName,
    required this.road,
    required this.startSection,
    this.endSection,
  });

  @override
  State<WarningDraftPage> createState() => _WarningDraftPageState();
}

class _WarningDraftPageState extends State<WarningDraftPage> {
  // Geolocation
  double? _latitude;
  double? _longitude;
  bool _isLoadingLocation = false;

  List<String> _selectedWarningReasonUIDs = [];
  int? _workScopeID;

  ContractorRelation? _selectedContractor;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _loadWarningCategories();
  }

  void _loadWarningCategories() {
    final state = context.read<WarningCategoriesBloc>().state;
    if (state is WarningCategoriesInitial) {
      context.read<WarningCategoriesBloc>().add(
        WarningCategoriesEvent.loadCategories(
          warningType: 'SITE_WARNING',
          workScopeUID: widget.scopeID,
        ),
      );
    }

    _getWorkScopeID();
  }

  void _getWorkScopeID() {
    final state = context.read<WarningCategoriesBloc>().state;
    state.whenOrNull(
      loaded: (categories) {
        for (var catWithReasons in categories) {
          for (var reason in catWithReasons.reasons) {
            setState(() {
              _workScopeID = reason.workScopeID;
            });
            return;
          }
        }
      },
    );
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoadingLocation = true;
    });

    try {
      // Check if location services are enabled
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

      // Check location permissions
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

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _latitude = position.latitude;
        _longitude = position.longitude;
        _isLoadingLocation = false;
      });

      print('📍 Location obtained: $_latitude, $_longitude');
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
                        fontSize: ResponsiveHelper.fontSize(context, base: 18),
                      ),
                    ),
                    Text(
                      'Please fill in the information listed below',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ResponsiveHelper.fontSize(context, base: 12),
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

                      // Scope of Work (keep existing code but add null safety)
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      widget.scopeName.toUpperCase(),
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

                      // Location (add null safety)
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                      '${widget.road.roadNo} - ${widget.road.name}',
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

                      // Section (add null safety)
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

                      _isLoadingLocation
                          ? Container(
                              height: 200,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey.shade300),
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
                            )
                          : EditableLocationMapWidget(
                              latitude: _latitude,
                              longitude: _longitude,
                              markerTitle: widget.road.name,
                              onLocationUpdated: (lat, lng) {
                                setState(() {
                                  _latitude = lat;
                                  _longitude = lng;
                                });
                                // print('📍 New location: $lat, $lng');
                              },
                            ),

                      SizedBox(height: 20),

                      // Contractor List
                      CustomFieldTile(
                        icon: Icons.person_pin_rounded,
                        title: 'Contractor',
                        titleDetails: _selectedContractor != null
                            ? _selectedContractor!.name
                            : 'Choose contractor',
                        isFilled: _selectedContractor != null,
                        onTap: _showContractorSelection,
                        isRequired: true,
                      ),

                      // Warning List
                      BlocBuilder<
                        WarningCategoriesBloc,
                        WarningCategoriesState
                      >(
                        builder: (context, categoriesState) {
                          return CustomFieldTile(
                            icon: Icons.list_sharp,
                            title: 'List',
                            titleDetails: _selectedWarningReasonUIDs.isEmpty
                                ? 'Select warnings'
                                : '${_selectedWarningReasonUIDs.length} warning${_selectedWarningReasonUIDs.length > 1 ? 's' : ''} selected',
                            isFilled: _selectedWarningReasonUIDs.isNotEmpty,
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
                                            initialSelectedUIDs:
                                                _selectedWarningReasonUIDs,
                                          ),
                                    ),
                                  );

                                  if (result != null &&
                                      result is List<String>) {
                                    setState(() {
                                      _selectedWarningReasonUIDs = result;
                                    });
                                    print(
                                      '✅ Selected warning UIDs: $_selectedWarningReasonUIDs',
                                    );
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
                      ),

                      // Photos
                      CustomFieldTile(
                        icon: Icons.camera_alt_rounded,
                        title: 'Photos',
                        titleDetails: 'Take picture of site',
                        // isFilled: selectedEquipment.isNotEmpty,
                        onTap: () {
                          print('Photos pressed');
                        },
                        isRequired: true,
                      ),

                      SizedBox(height: 60),

                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: null,

                          // () {
                          // final companyState = _companyBloc.state;
                          // if (companyState is CompanyLoaded &&
                          //     companyState.selectedCompany != null) {
                          //   _dailyReportCreateBloc.add(
                          //     SubmitReport(
                          //       companyUID:
                          //           companyState.selectedCompany!.uid,
                          //     ),
                          //   );
                          // }
                          // },
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
  }
}
