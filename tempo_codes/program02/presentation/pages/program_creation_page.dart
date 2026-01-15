import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclink_app/features/program/domain/entities/work_scope_nested_entity.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../contractor_relation/domain/entities/contractor_relation_entity.dart';
import '../../../contractor_relation/presentation/bloc/contractor_relation_bloc.dart';
import '../../../contractor_relation/presentation/bloc/contractor_relation_state.dart';
import '../../../daily_report/presentation/widgets/report_creation/selection_field_card.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../../../road/presentation/helper/road_level.dart';
import '../../../road/presentation/helper/road_selection_result.dart';
import '../../../road/presentation/pages/road_field_tile.dart';
import '../bloc/program/program_bloc.dart';
import '../bloc/program/program_event.dart';
import '../bloc/program/program_state.dart';
import '../widgets/contractor_road_field_tile.dart';
import '../widgets/contractor_selection_bottomsheet.dart';
import '../widgets/program_creation_draft_page.dart';
import '../widgets/r02_program_creation_draft_page.dart';

class ProgramCreationPage extends StatefulWidget {
  const ProgramCreationPage({Key? key}) : super(key: key);

  @override
  State<ProgramCreationPage> createState() => _ProgramCreationPageState();
}

class _ProgramCreationPageState extends State<ProgramCreationPage> {
  int? selectedWorkScopeID;
  String? selectedWorkScopeUID;
  String? selectedWorkScopeCode;
  String? selectedWorkScopeName;

  String? selectedContractorUID;
  String? selectedContractorName;
  bool isSelfContractor = false;
  List<Road>? contractorRoads;
  List<Road> selectedRoadsForNonR02 = [];

  String selectedWeatherDisplay = '';
  bool hasError = false;
  late Road selectedRoad;

  final PageController _pageController = PageController();
  int _currentPage = 0;

  Road? selectedRoadR02; // Store selected road for R02
  String sectionValue = ''; // Store section input
  bool hasSectionError = false; // Track validation error
  final TextEditingController _sectionController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _sectionController.dispose();
    super.dispose();
  }

  void _goToNextPage() {
    if (_currentPage < 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage++;
      });
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      setState(() {
        _currentPage--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (_currentPage > 0) {
                          _goToPreviousPage();
                        } else {
                          Navigator.pop(context);
                        }
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

                    SizedBox(width: ResponsiveHelper.spacing(context, 15)),

                    Text(
                      'Program',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: ResponsiveHelper.fontSize(context, base: 18),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: ResponsiveHelper.spacing(context, 25)),

              // Content with PageView
              Expanded(
                child: Container(
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
                    children: [
                      Expanded(
                        child: PageView(
                          controller: _pageController,
                          physics: NeverScrollableScrollPhysics(),
                          children: [
                            _buildWorkScopeSelectionPage(),

                            _buildAdditionalDetailsPage(),
                          ],
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

  Widget _buildWorkScopeSelectionPage() {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Choose Scope of Work',
            style: TextStyle(
              fontSize: ResponsiveHelper.fontSize(context, base: 15),
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: ResponsiveHelper.spacing(context, 16)),

          Expanded(
            child: BlocConsumer<ProgramBloc, ProgramState>(
              listener: (context, state) {
                state.maybeWhen(
                  error: (message) {
                    CustomSnackBar.show(
                      context,
                      message.isNotEmpty
                          ? message
                          : 'Failed to load program settings',
                    );
                  },
                  orElse: () {},
                );
              },
              builder: (context, state) {
                return state.maybeWhen(
                  loading: () => Center(
                    child: CircularProgressIndicator(color: primaryColor),
                  ),
                  loaded: (programSettings, contractorRoads) {
                    if (programSettings.isEmpty) {
                      return Center(
                        child: Text(
                          'No program settings available',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 14,
                            ),
                            color: Colors.grey[600],
                          ),
                        ),
                      );
                    }

                    final workScopes = programSettings
                        .where((setting) => setting.workScope != null)
                        .map(
                          (setting) => WorkScopeNested(
                            id: setting.workScope!.id,
                            uid: setting.workScope!.uid ?? '',
                            name: setting.workScope!.name ?? '',
                            code: setting.workScope!.code ?? '',
                            description: setting.workScope!.description ?? '',
                            allowMultipleQuantities:
                                setting.workScope!.allowMultipleQuantities ??
                                false,
                            companyID: setting.workScope!.companyID ?? 0,
                            createdAt:
                                setting.workScope!.createdAt ??
                                DateTime.now().toIso8601String(),
                            updatedAt:
                                setting.workScope!.updatedAt ??
                                DateTime.now().toIso8601String(),
                            deletedAt: setting.workScope!.deletedAt,
                          ),
                        )
                        .toList();

                    return _buildWorkScopeGrid(workScopes);
                  },
                  orElse: () => Center(
                    child: Text(
                      'Loading program settings...',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 14),
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // Next Button
          Container(
            margin: EdgeInsets.only(top: 20),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: selectedWorkScopeUID != null ? _goToNextPage : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                padding: ResponsiveHelper.padding(context, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
              ),
              child: Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ResponsiveHelper.fontSize(context, base: 14),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),

          SizedBox(height: ResponsiveHelper.spacing(context, 20)),
        ],
      ),
    );
  }

  // Page 2
  Widget _buildAdditionalDetailsPage() {
    // Check if workScopeID == 2 (R02 - Road Shoulder)
    final isR02 = selectedWorkScopeID == 2;

    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Program Details',
            style: TextStyle(
              fontSize: ResponsiveHelper.fontSize(context, base: 15),
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: ResponsiveHelper.spacing(context, 16)),

          // Selected Work Scope Display
          Container(
            padding: EdgeInsets.all(ResponsiveHelper.spacing(context, 16)),
            decoration: BoxDecoration(
              color: Colors.grey.shade50,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: ResponsiveHelper.spacing(context, 8),
                        vertical: ResponsiveHelper.spacing(context, 4),
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        selectedWorkScopeCode ?? '',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 12,
                          ),
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: ResponsiveHelper.spacing(context, 8)),
                    Expanded(
                      child: Text(
                        selectedWorkScopeName ?? '',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 14,
                          ),
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: ResponsiveHelper.spacing(context, 15)),

          // Conditional UI based on workScopeID
          if (!isR02) ...[
            // Show Contractor Selection (for non-R02)
            BlocBuilder<ContractorRelationBloc, ContractorRelationState>(
              builder: (context, contractorState) {
                return SelectionFieldCard(
                  icon: Icons.person_2_rounded,
                  label: 'Contractor',
                  value: selectedContractorName ?? '',
                  placeholder: 'Select Contractor',
                  onTap: () =>
                      _showContractorSelection(context, contractorState),
                );
              },
            ),

            // SizedBox(height: ResponsiveHelper.spacing(context, 15)),
          ],

          // Route Selection
          if (isR02) ...[
            // R02: Use original RoadFieldTile with existing roads
            RoadFieldTile(
              startFrom: RoadLevel.provinces,
              endAt: RoadLevel.roads,
              label: 'Route',
              placeholder: 'Select Routes',
              onRoadSelected: (RoadSelectionResult result) {
                if (result.selectedRoad != null) {
                  setState(() {
                    selectedRoadR02 = result.selectedRoad;
                    sectionValue = ''; // Reset section value
                    _sectionController.clear();
                    hasSectionError = false;
                  });

                  print('Selected road for R02: ${result.selectedRoad!.name}');
                  print('Road UID: ${result.selectedRoad!.uid}');
                  print('Section Start: ${result.selectedRoad!.sectionStart}');
                  print(
                    'Section Finish: ${result.selectedRoad!.sectionFinish}',
                  );
                }
              },
            ),

            // Show section input after road selection
            if (selectedRoadR02 != null) ...[
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveHelper.spacing(context, 20),
                  vertical: ResponsiveHelper.spacing(context, 15),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: hasSectionError ? Colors.red : Colors.grey.shade400,
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
                            padding: EdgeInsets.all(
                              ResponsiveHelper.spacing(context, 12),
                            ),
                            decoration: BoxDecoration(
                              color: hasSectionError
                                  ? Colors.red.shade50
                                  : const Color.fromARGB(255, 214, 226, 255),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.swap_calls,
                                color: hasSectionError
                                    ? Colors.red
                                    : primaryColor,
                                size: ResponsiveHelper.iconSize(
                                  context,
                                  base: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: ResponsiveHelper.spacing(context, 20),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Section',
                                  style: TextStyle(
                                    color: hasSectionError
                                        ? Colors.red.shade600
                                        : Colors.black,
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 14,
                                    ),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  height: ResponsiveHelper.spacing(context, 5),
                                ),
                                TextField(
                                  controller: _sectionController,
                                  onChanged: (value) {
                                    setState(() {
                                      sectionValue = value;
                                      // Validate section value
                                      if (value.isNotEmpty) {
                                        final sectionNum = double.tryParse(
                                          value,
                                        );
                                        if (sectionNum != null &&
                                            selectedRoadR02!.sectionStart !=
                                                null &&
                                            selectedRoadR02!.sectionFinish !=
                                                null) {
                                          hasSectionError =
                                              sectionNum <
                                                  selectedRoadR02!
                                                      .sectionStart! ||
                                              sectionNum >
                                                  selectedRoadR02!
                                                      .sectionFinish!;
                                        } else {
                                          hasSectionError = false;
                                        }
                                      } else {
                                        hasSectionError = false;
                                      }
                                    });
                                  },
                                  keyboardType:
                                      const TextInputType.numberWithOptions(
                                        decimal: true,
                                      ),
                                  decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "Type section",
                                    hintStyle: TextStyle(
                                      fontSize: ResponsiveHelper.fontSize(
                                        context,
                                        base: 13,
                                      ),
                                    ),
                                    contentPadding: EdgeInsets.symmetric(
                                      horizontal: ResponsiveHelper.spacing(
                                        context,
                                        12,
                                      ),
                                      vertical: ResponsiveHelper.spacing(
                                        context,
                                        8,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 1,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 1,
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      borderSide: BorderSide(
                                        color: hasSectionError
                                            ? Colors.red
                                            : primaryColor,
                                        width: 1.5,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: ResponsiveHelper.spacing(context, 5),
                                ),
                                if (selectedRoadR02!.sectionStart != null &&
                                    selectedRoadR02!.sectionFinish != null)
                                  Text(
                                    'Range from ${selectedRoadR02!.sectionStart} - ${selectedRoadR02!.sectionFinish}',
                                    style: TextStyle(
                                      fontWeight: hasSectionError
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                      fontSize: ResponsiveHelper.fontSize(
                                        context,
                                        base: 10,
                                      ),
                                      color: hasSectionError
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
              ),
            ],
          ] else
            // Non-R02: Check if self company or external contractor
            Builder(
              builder: (context) {
                if (selectedContractorName == null) {
                  // No contractor selected yet
                  return Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(
                      'Please select a contractor first',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 14),
                        color: Colors.grey[600],
                      ),
                    ),
                  );
                }

                // Check if self company using the flag
                if (isSelfContractor) {
                  // Self company: Use original RoadFieldTile
                  print('🏠 Showing RoadFieldTile for self company');
                  return RoadFieldTile(
                    startFrom: RoadLevel.roads,
                    endAt: RoadLevel.roads,
                    selectMultipleRoads: true,
                    label: 'Route',
                    placeholder: 'Select Routes',
                    onRoadSelected: (RoadSelectionResult result) {
                      if (result.selectedRoads != null) {
                        setState(() {
                          selectedRoadsForNonR02 = result.selectedRoads!;
                        });

                        print(
                          'Selected ${result.selectedRoads!.length} roads (Self Company)',
                        );
                        result.selectedRoads!.forEach((road) {
                          print('Road UID: ${road.uid}');
                          print('Road Name: ${road.name}');
                          print('Road District: ${road.district?.name}');
                        });
                      }
                    },
                  );
                }

                // External contractor: Use contractor roads
                print(
                  '🏢 Showing ContractorRoadFieldTile for external contractor',
                );
                return BlocBuilder<ProgramBloc, ProgramState>(
                  builder: (context, state) {
                    final roads = state.maybeWhen(
                      loaded: (_, contractorRoads) => contractorRoads,
                      orElse: () => null,
                    );

                    if (roads == null) {
                      // Loading
                      return Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Center(
                          child: CircularProgressIndicator(color: primaryColor),
                        ),
                      );
                    }

                    if (roads.isEmpty) {
                      // No roads available for this contractor
                      return Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.info_outline,
                                color: Colors.orange,
                                size: ResponsiveHelper.iconSize(
                                  context,
                                  base: 30,
                                ),
                              ),
                              SizedBox(
                                height: ResponsiveHelper.spacing(context, 8),
                              ),
                              Text(
                                'No roads available for this contractor',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 14,
                                  ),
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    // Show ContractorRoadFieldTile with contractor roads
                    return ContractorRoadFieldTile(
                      contractorRoads: roads,
                      label: 'Route',
                      placeholder: 'Select Routes',
                      onRoadSelected: (RoadSelectionResult result) {
                        if (result.selectedRoads != null) {
                          setState(() {
                            selectedRoadsForNonR02 = result.selectedRoads!;
                          });

                          print(
                            'Selected ${result.selectedRoads!.length} contractor roads',
                          );
                          result.selectedRoads!.forEach((road) {
                            print('Road UID: ${road.uid}');
                            print('Road Name: ${road.name}');
                            print('Road District: ${road.district?.name}');
                          });
                        }
                      },
                    );
                  },
                );
              },
            ),

          Spacer(),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: _goToPreviousPage,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: primaryColor,
                      width: ResponsiveHelper.adaptive(
                        context,
                        mobile: 1.0,
                        tablet: 1.5,
                        desktop: 2.0,
                      ),
                    ),
                    padding: ResponsiveHelper.padding(context, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Back',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),

              SizedBox(width: ResponsiveHelper.spacing(context, 12)),

              Expanded(
                flex: 2,
                child: ElevatedButton(
                  onPressed: () {
                    // Validate required fields based on isR02
                    if (isR02) {
                      // R02 validation: must have road and section
                      if (selectedRoadR02 == null) {
                        CustomSnackBar.show(
                          context,
                          'Please select a road',
                          type: SnackBarType.warning,
                        );
                        return;
                      }

                      if (sectionValue.isEmpty) {
                        CustomSnackBar.show(
                          context,
                          'Please enter section',
                          type: SnackBarType.warning,
                        );
                        return;
                      }

                      if (hasSectionError) {
                        CustomSnackBar.show(
                          context,
                          'Section is out of valid range',
                          type: SnackBarType.error,
                        );
                        return;
                      }

                      // Navigate to R02 Draft Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => R02ProgramCreationDraftPage(
                            workScopeID: selectedWorkScopeID,
                            workScopeUID: selectedWorkScopeUID,
                            workScopeName: selectedWorkScopeName,
                            workScopeCode: selectedWorkScopeCode,
                            road: selectedRoadR02,
                            section: double.tryParse(sectionValue),
                          ),
                        ),
                      );
                    } else {
                      // Non-R02 validation: must have contractor and roads
                      if (selectedContractorUID == null) {
                        CustomSnackBar.show(
                          context,
                          'Please select a contractor',
                          type: SnackBarType.warning,
                        );
                        return;
                      }

                      if (selectedRoadsForNonR02.isEmpty) {
                        CustomSnackBar.show(
                          context,
                          'Please select at least one road',
                          type: SnackBarType.warning,
                        );
                        return;
                      }

                      // Get contractor entity
                      ContractorRelation? contractorEntity;
                      final contractorState = context
                          .read<ContractorRelationBloc>()
                          .state;
                      contractorState.maybeWhen(
                        loaded: (contractors, _) {
                          try {
                            contractorEntity = contractors.firstWhere(
                              (c) =>
                                  c.contractRelationUID ==
                                      selectedContractorUID ||
                                  (c.contractRelationUID == null &&
                                      selectedContractorUID == null),
                            );
                          } catch (e) {
                            // Contractor not found in list
                            print(
                              '⚠️ Contractor not found: $selectedContractorUID',
                            );
                            contractorEntity = null;
                          }
                        },
                        orElse: () {},
                      );

                      if (contractorEntity == null) {
                        CustomSnackBar.show(
                          context,
                          'Contractor information not available',
                          type: SnackBarType.error,
                        );
                        return;
                      }

                      // Navigate to Non-R02 Draft Page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProgramCreationDraftPage(
                            workScopeID: selectedWorkScopeID!,
                            workScopeUID: selectedWorkScopeUID!,
                            workScopeName: selectedWorkScopeName!,
                            workScopeCode: selectedWorkScopeCode!,
                            contractor: contractorEntity!,
                            selectedRoads: selectedRoadsForNonR02,
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: ResponsiveHelper.padding(context, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: Text(
                    'Next',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: ResponsiveHelper.spacing(context, 20)),
        ],
      ),
    );
  }

  Widget _buildWorkScopeGrid(List<WorkScopeNested> workScopes) {
    final crossAxisCount = ResponsiveHelper.gridColumns(
      context,
      baseColumns: 2,
    );
    final cardSpacing = ResponsiveHelper.spacing(context, 12);

    return GridView.builder(
      padding: EdgeInsets.only(bottom: ResponsiveHelper.spacing(context, 20)),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: cardSpacing,
        mainAxisSpacing: cardSpacing,
        childAspectRatio: 1.4,
      ),
      itemCount: workScopes.length,
      itemBuilder: (context, index) {
        final workScope = workScopes[index];
        final isSelected = selectedWorkScopeUID == workScope.uid;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedWorkScopeUID = workScope.uid;
              selectedWorkScopeCode = workScope.code;
              selectedWorkScopeName = workScope.name;
              selectedWorkScopeID = workScope.id;
            });
          },
          child: Container(
            padding: ResponsiveHelper.padding(context, all: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: ResponsiveHelper.borderRadius(context, all: 12),
              border: Border.all(
                color: isSelected ? primaryColor : Colors.grey.shade300,
                width: isSelected ? 2 : 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Code
                    Container(
                      width: ResponsiveHelper.iconSize(context, base: 50),
                      height: ResponsiveHelper.iconSize(context, base: 40),
                      padding: EdgeInsets.symmetric(
                        horizontal: ResponsiveHelper.spacing(context, 8),
                        vertical: ResponsiveHelper.spacing(context, 4),
                      ),
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: ResponsiveHelper.borderRadius(
                          context,
                          all: 6,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          workScope.code ?? '',
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

                    // Radio
                    Container(
                      width: ResponsiveHelper.iconSize(context, base: 20),
                      height: ResponsiveHelper.iconSize(context, base: 20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isSelected
                              ? primaryColor
                              : Colors.grey.shade400,
                          width: 2,
                        ),
                        color: isSelected ? Colors.white : Colors.transparent,
                      ),
                      child: isSelected
                          ? Center(
                              child: Container(
                                width: ResponsiveHelper.iconSize(
                                  context,
                                  base: 10,
                                ),
                                height: ResponsiveHelper.iconSize(
                                  context,
                                  base: 10,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primaryColor,
                                ),
                              ),
                            )
                          : null,
                    ),
                  ],
                ),

                SizedBox(height: ResponsiveHelper.spacing(context, 8)),

                // Workscope
                Text(
                  workScope.name ?? '',
                  style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(context, base: 12),
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showContractorSelection(
    BuildContext context,
    ContractorRelationState state,
  ) {
    state.maybeWhen(
      loaded: (contractors, selectedContractor) {
        if (contractors.isEmpty) {
          CustomSnackBar.show(
            context,
            'No contractors available',
            type: SnackBarType.warning,
          );
          return;
        }

        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => ContractorSelectionBottomSheet(
            contractors: contractors,
            selectedContractorUID: selectedContractorUID,
            onContractorSelected: (contractor) {
              // Check if contractRelationUID is null (self company)
              final isSelf =
                  contractor.contractRelationUID == null ||
                  contractor.contractRelationUID!.isEmpty;

              setState(() {
                selectedContractorUID = contractor.contractRelationUID;
                selectedContractorName = contractor.name;
                isSelfContractor = isSelf; // Set the flag
              });

              if (isSelf) {
                print(
                  '📍 Selected contractor: ${contractor.name} (Self Company)',
                );
                print('📍 Contract Relation UID: null - Using original roads');

                // Clear contractor roads since we'll use original RoadFieldTile
                context.read<ProgramBloc>().add(
                  const ProgramEvent.clearContractorRoads(),
                );
                return;
              }

              // Fetch contractor roads for non-self company
              print('📍 Selected contractor: ${contractor.name}');
              print(
                '📍 Contract Relation UID: ${contractor.contractRelationUID}',
              );

              context.read<ProgramBloc>().add(
                ProgramEvent.loadContractorRoads(
                  contractorRelationUID: contractor.contractRelationUID!,
                ),
              );
            },
          ),
        );
      },
      loading: () {
        CustomSnackBar.show(
          context,
          'Loading contractors...',
          type: SnackBarType.info,
        );
      },
      orElse: () {
        CustomSnackBar.show(
          context,
          'No contractors available',
          type: SnackBarType.warning,
        );
      },
    );
  }
}
