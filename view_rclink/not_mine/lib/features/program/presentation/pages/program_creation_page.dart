import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../daily_report/presentation/widgets/report_creation/selection_field_card.dart';
import '../../../road/domain/entities/road_entity.dart';
import '../../../road/presentation/helper/road_level.dart';
import '../../../road/presentation/helper/road_selection_result.dart';
import '../../../road/presentation/pages/road_field_tile.dart';
import '../../../work_scope/domain/entities/work_scope.dart';
import '../../../work_scope/presentation/bloc/work_scope_bloc.dart';
import '../../../work_scope/presentation/bloc/work_scope_state.dart';

class ProgramCreationPage extends StatefulWidget {
  const ProgramCreationPage({Key? key}) : super(key: key);

  @override
  State<ProgramCreationPage> createState() => _ProgramCreationPageState();
}

class _ProgramCreationPageState extends State<ProgramCreationPage> {
  String? selectedWorkScopeUID;
  String? selectedWorkScopeCode;
  String? selectedWorkScopeName;

  String selectedWeatherDisplay = '';
  final TextEditingController _sectionController = TextEditingController();
  bool hasError = false;
  late Road selectedRoad;

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
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

          // Work Scope Grid
          Expanded(
            child: BlocConsumer<WorkScopeBloc, WorkScopeState>(
              listener: (context, state) {
                state.maybeWhen(
                  error: (failure) {
                    CustomSnackBar.show(
                      context,
                      failure.message.isNotEmpty
                          ? failure.message
                          : 'Failed to load work scopes',
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
                  loaded: (workScopes) {
                    if (workScopes.isEmpty) {
                      return Center(
                        child: Text(
                          'No work scopes available',
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

                    return _buildWorkScopeGrid(workScopes);
                  },
                  orElse: () => Center(
                    child: Text(
                      'Loading work scopes...',
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

          RoadFieldTile(
            startFrom: RoadLevel.roads,
            endAt: RoadLevel.roads,
            selectMultipleRoads: true,
            label: 'Route',
            // preSelectedDistrictUid: 'df3ae453-1f8f-4739-9d17-54db2355e17f',
            placeholder: 'Require Update',
            onRoadSelected: (RoadSelectionResult result) {
              // For multiple roads selection
              if (result.selectedRoads != null) {
                print('Selected ${result.selectedRoads!.length} roads');

                // Loop through all selected roads
                result.selectedRoads!.forEach((road) {
                  print('Road UID: ${road.uid}');
                  print('Road Name: ${road.name}');
                  print('Road No: ${road.roadNo}');
                });

                // Get list of road UIDs
                final roadUids = result.selectedRoads!
                    .map((road) => road.uid)
                    .toList();
                print('All Road UIDs: $roadUids');

                // setState(() {
                //   _selectedRoadUids = roadUids; // Store multiple UIDs
                // });
              }

              // Province and District info still available
              print('Province: ${result.selectedProvince?.name}');
              print('District: ${result.selectedDistrict?.name}');
            },
          ),

          // Container(
          //   margin: const EdgeInsets.only(bottom: 15),
          //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          //   decoration: BoxDecoration(
          //     border: Border.all(
          //       color: hasError ? Colors.red : Colors.grey.shade400,
          //       width: 0.5,
          //     ),
          //     borderRadius: BorderRadius.circular(10),
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Expanded(
          //         child: Row(
          //           children: [
          //             Container(
          //               padding: const EdgeInsets.all(12),
          //               decoration: BoxDecoration(
          //                 color: hasError
          //                     ? Colors.red.shade50
          //                     : const Color.fromARGB(255, 214, 226, 255),
          //                 shape: BoxShape.circle,
          //               ),
          //               child: Center(
          //                 child: Icon(
          //                   Icons.swap_calls,
          //                   color: hasError ? Colors.red : primaryColor,
          //                 ),
          //               ),
          //             ),
          //             const SizedBox(width: 20),
          //             Expanded(
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     'Section',
          //                     style: TextStyle(
          //                       color: hasError
          //                           ? Colors.red.shade600
          //                           : Colors.black,
          //                     ),
          //                   ),
          //                   const SizedBox(height: 5),
          //                   TextField(
          //                     controller: _sectionController,
          //                     onChanged: (value) {},
          //                     keyboardType:
          //                         const TextInputType.numberWithOptions(
          //                           decimal: true,
          //                         ),
          //                     decoration: InputDecoration(
          //                       isDense: true,
          //                       hintText: "Type section",
          //                       contentPadding: const EdgeInsets.symmetric(
          //                         horizontal: 12,
          //                         vertical: 8,
          //                       ),
          //                       border: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(8.0),
          //                         borderSide: BorderSide(
          //                           color: Colors.grey.shade300,
          //                           width: 1,
          //                         ),
          //                       ),
          //                       enabledBorder: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(8.0),
          //                         borderSide: BorderSide(
          //                           color: Colors.grey.shade300,
          //                           width: 1,
          //                         ),
          //                       ),
          //                       focusedBorder: OutlineInputBorder(
          //                         borderRadius: BorderRadius.circular(8.0),
          //                         borderSide: BorderSide(
          //                           color: hasError
          //                               ? Colors.red
          //                               : const Color(0xFF5B7FFF),
          //                           width: 1.5,
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                   const SizedBox(height: 5),
          //                   Builder(
          //                     builder: (context) {
          //                       if (selectedRoad.sectionStart != null &&
          //                           selectedRoad.sectionFinish != null) {
          //                         return Text(
          //                           'Range from ${selectedRoad.sectionStart} - ${selectedRoad.sectionFinish}',
          //                           style: TextStyle(
          //                             fontWeight: hasError
          //                                 ? FontWeight.bold
          //                                 : FontWeight.normal,
          //                             fontSize: ResponsiveHelper.fontSize(
          //                               context,
          //                               base: 10,
          //                             ),
          //                             color: hasError
          //                                 ? Colors.red
          //                                 : Colors.black,
          //                           ),
          //                         );
          //                       }
          //                       return const SizedBox.shrink();
          //                     },
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // ),

          // Temprorary ONLY!! NO API YET
          SelectionFieldCard(
            icon: Icons.person_2_rounded,
            label: 'Contractor',
            value: selectedWeatherDisplay,
            placeholder: 'Require Update',
            onTap: () {
              // CustomSnackBar.show(
              //   context,
              //   'Should this called from API?',
              //   type: SnackBarType.comingsoon,
              // );
            },
          ),

          Spacer(),

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
                    // print('Submit program');
                    // print('Work Scope UID: $selectedWorkScopeUID');
                    // print('Work Scope Code: $selectedWorkScopeCode');
                    // print('Work Scope Name: $selectedWorkScopeName');
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

  Widget _buildWorkScopeGrid(List<WorkScope> workScopes) {
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
                          workScope.code,
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
                  workScope.name,
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
}
