import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rclink_app/features/disaster/presentation/pages/disaster_page.dart';
import 'package:rclink_app/features/inspection/presentation/pages/inspection_page.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/network/connectivity_service.dart';
import '../../../../shared/helper/navigation_helper.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';

import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../contractor_relation/presentation/bloc/contractor_relation_bloc.dart';
import '../../../contractor_relation/presentation/bloc/contractor_relation_event.dart';
import '../../../contractor_relation/presentation/bloc/contractor_relation_state.dart';
import '../../../contractor_relation/presentation/widgets/show_contractor_relation_selection.dart';
import '../../../daily_report/presentation/pages/daily_report_page.dart';
import '../../../locale/presentation/pages/localization_debug_page.dart';
import '../../../road/presentation/bloc/road_bloc.dart';
import '../../../road/presentation/bloc/road_event.dart';
import '../../../warnings/presentation/bloc/warning_categories/warning_categories_bloc.dart';
import '../../../warnings/presentation/bloc/warning_categories/warning_categories_event.dart';
import '../../../work_scope/presentation/bloc/work_scope_bloc.dart';
import '../../../work_scope/presentation/bloc/work_scope_event.dart';
import '../widgets/animated_connection_status_widget.dart';
import '../widgets/listingitem_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<String> warningLists = ['1', '2', '3'];
  int actionCount = 108;

  late final ConnectivityService _connectivityService;
  bool _isConnected = false;
  StreamSubscription<bool>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();

    _connectivityService = getIt<ConnectivityService>();
    _isConnected = _connectivityService.isCurrentlyConnected;

    print('🌐 Initial connectivity status: $_isConnected');

    _connectivitySubscription = _connectivityService.connectivityStream.listen((
      isConnected,
    ) {
      setState(() {
        _isConnected = isConnected;
      });
    });

    // context.read<ContractorRelationBloc>().add(const LoadContractorRelation());
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('🌐 Current build - isConnected: $_isConnected');

    return BlocListener<ContractorRelationBloc, ContractorRelationState>(
      listener: (context, contractorState) {
        if (contractorState is ContractorRelationLoaded &&
            contractorState.selectedContractor != null) {
          context.read<WorkScopeBloc>().add(
            const WorkScopeEvent.loadWorkScopes(forceRefresh: true),
          );

          context.read<RoadBloc>().add(
            const RoadEvent.loadProvinces(forceRefresh: true),
          );

          context.read<WarningCategoriesBloc>().add(
            const WarningCategoriesEvent.loadCategories(forceRefresh: true),
          );
        }
      },
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 135, 167, 247), primaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: ResponsiveHelper.getHeight(context, 0.02)),

                Padding(
                  padding: ResponsiveHelper.padding(context, horizontal: 30),
                  child: Column(
                    children: [
                      // Header with logo and toggle
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/images/rclink_logo.png',
                            height: ResponsiveHelper.getHeight(context, 0.035),
                            fit: BoxFit.contain,
                          ),

                          AnimatedConnectionStatus(
                            isConnected: _isConnected,
                            greenAccent: greenAccent,
                          ),
                        ],
                      ),

                      SizedBox(height: ResponsiveHelper.spacing(context, 20)),

                      // Search Button
                      BlocBuilder<
                        ContractorRelationBloc,
                        ContractorRelationState
                      >(
                        builder: (context, contractorState) {
                          final isLoading =
                              contractorState is ContractorRelationLoading;

                          // Determine selected contractor (if any)
                          final selectedContractor = contractorState.maybeWhen(
                            loaded: (contractors, selectedContractor) =>
                                selectedContractor,
                            orElse: () => null,
                          );

                          // Determine if second button should be shown
                          final shouldShowSecondButton =
                              contractorState is! ContractorRelationFailure &&
                              selectedContractor != null;

                          return Row(
                            children: [
                              // --- First Expanded: Search Button ---
                              Expanded(
                                child: TextButton(
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: shouldShowSecondButton
                                          ? ResponsiveHelper.borderRadius(
                                              context,
                                              topLeft: 50,
                                              bottomLeft: 50,
                                            )
                                          : ResponsiveHelper.borderRadius(
                                              context,
                                              topLeft: 50,
                                              bottomLeft: 50,
                                              topRight: 50,
                                              bottomRight: 50,
                                            ),
                                    ),
                                    backgroundColor: Colors.white.withOpacity(
                                      0.6,
                                    ),
                                  ),
                                  onPressed: () {
                                    CustomSnackBar.show(
                                      context,
                                      'This feature is coming soon...',
                                      type: SnackBarType.comingsoon,
                                    );
                                  },
                                  child: Padding(
                                    padding: ResponsiveHelper.padding(
                                      context,
                                      horizontal: 20,
                                      vertical: 13,
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.search,
                                          size: ResponsiveHelper.iconSize(
                                            context,
                                            base: 25,
                                          ),
                                          color: Colors.black.withOpacity(0.6),
                                        ),
                                        SizedBox(
                                          width: ResponsiveHelper.spacing(
                                            context,
                                            10,
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Search Report',
                                                style: TextStyle(
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize:
                                                      ResponsiveHelper.fontSize(
                                                        context,
                                                        base: 12,
                                                      ),
                                                ),
                                              ),
                                              Text(
                                                'By district or contractor',
                                                style: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.7),
                                                  overflow:
                                                      TextOverflow.ellipsis,
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
                                  ),
                                ),
                              ),

                              // --- Conditionally show second Expanded: Contractor Button ---
                              if (shouldShowSecondButton)
                                Expanded(
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            ResponsiveHelper.borderRadius(
                                              context,
                                              topRight: 50,
                                              bottomRight: 50,
                                            ),
                                      ),
                                      backgroundColor: Colors.white.withOpacity(
                                        0.6,
                                      ),
                                    ),
                                    onPressed: isLoading
                                        ? null
                                        : () {
                                            showContractorRelationSelection(
                                              context: context,
                                              state: contractorState,
                                              onContractorSelected: (selectedData) {
                                                context
                                                    .read<
                                                      ContractorRelationBloc
                                                    >()
                                                    .add(
                                                      SelectContractorRelation(
                                                        selectedData['companyReportToUID'],
                                                      ),
                                                    );
                                              },
                                            );
                                          },
                                    child: Padding(
                                      padding: ResponsiveHelper.padding(
                                        context,
                                        horizontal: 20,
                                        vertical: 13,
                                      ),
                                      child: Row(
                                        children: [
                                          isLoading
                                              ? SizedBox(
                                                  width:
                                                      ResponsiveHelper.iconSize(
                                                        context,
                                                        base: 25,
                                                      ),
                                                  height:
                                                      ResponsiveHelper.iconSize(
                                                        context,
                                                        base: 25,
                                                      ),
                                                  child: CircularProgressIndicator(
                                                    strokeWidth: 2,
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                          Color
                                                        >(
                                                          Colors.black
                                                              .withOpacity(0.6),
                                                        ),
                                                  ),
                                                )
                                              : Icon(
                                                  Icons.note_alt_outlined,
                                                  size:
                                                      ResponsiveHelper.iconSize(
                                                        context,
                                                        base: 25,
                                                      ),
                                                  color: Colors.black
                                                      .withOpacity(0.6),
                                                ),
                                          SizedBox(
                                            width: ResponsiveHelper.spacing(
                                              context,
                                              10,
                                            ),
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Report to',
                                                  style: TextStyle(
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize:
                                                        ResponsiveHelper.fontSize(
                                                          context,
                                                          base: 12,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  isLoading
                                                      ? 'Loading...'
                                                      : selectedContractor
                                                                ?.name ??
                                                            'Company name',
                                                  style: TextStyle(
                                                    color: isLoading
                                                        ? Colors.black
                                                              .withOpacity(0.5)
                                                        : Colors.black
                                                              .withOpacity(0.7),
                                                    overflow:
                                                        TextOverflow.ellipsis,
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
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                      ),

                      SizedBox(height: ResponsiveHelper.spacing(context, 10)),

                      // Listing Section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: ResponsiveHelper.padding(
                              context,
                              left: 10,
                            ),
                            child: Text(
                              'Listing',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: ResponsiveHelper.fontSize(
                                  context,
                                  base: 15,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: ResponsiveHelper.spacing(context, 10),
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListingItem(
                                  isBlack: false,
                                  image: 'assets/images/icons/daily_report.png',
                                  label: 'Daily\nReport',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DailyReportPage(),
                                      ),
                                    );

                                    // context.push(AppRoutePath.dailyReport);

                                    // CustomSnackBar.show(
                                    //   context,
                                    //   'This feature is in update...',
                                    //   type: SnackBarType.comingsoon,
                                    // );
                                  },
                                ),
                              ),
                              Expanded(
                                child: ListingItem(
                                  isBlack: false,
                                  image: 'assets/images/icons/inspection.png',
                                  label: 'Inspection',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => InspectionPage(),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: ListingItem(
                                  isBlack: false,
                                  image: 'assets/images/icons/site_warning.png',
                                  label: 'Site\nWarning',
                                  onTap: () {
                                    NavigationHelper().switchToTab(3);

                                    // print('Site Warning tapped');
                                    // CustomSnackBar.show(
                                    //   context,
                                    //   'This feature is coming soon...',
                                    //   type: SnackBarType.comingsoon,
                                    // );
                                  },
                                ),
                              ),
                              Expanded(
                                child: ListingItem(
                                  isBlack: false,
                                  image: 'assets/images/icons/program.png',
                                  label: 'Program',
                                  onTap: () {
                                    NavigationHelper().switchToTab(1);

                                    // print('Program tapped');
                                    // CustomSnackBar.show(
                                    //   context,
                                    //   'This feature is coming soon...',
                                    //   type: SnackBarType.comingsoon,
                                    // );
                                  },
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: ResponsiveHelper.spacing(context, 15),
                          ),

                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListingItem(
                                  isBlack: false,
                                  image: 'assets/images/icons/toolbox.png',
                                  label: 'Toolbox',
                                  onTap: () {
                                    print('Toolbox tapped');
                                    CustomSnackBar.show(
                                      context,
                                      'This feature is coming soon...',
                                      type: SnackBarType.comingsoon,
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: ListingItem(
                                  isBlack: false,
                                  image: 'assets/images/icons/disaster.png',
                                  label: 'Disaster',
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DisasterPage(),
                                      ),
                                    );

                                    // CustomSnackBar.show(
                                    //   context,
                                    //   'This feature is coming soon...',
                                    //   type: SnackBarType.comingsoon,
                                    // );
                                  },
                                ),
                              ),
                              Expanded(
                                child: ListingItem(
                                  isBlack: false,
                                  image: 'assets/images/icons/periodic.png',
                                  label: 'Periodic',
                                  onTap: () {
                                    print('Periodic tapped');
                                    CustomSnackBar.show(
                                      context,
                                      'This feature is coming soon...',
                                      type: SnackBarType.comingsoon,
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: ListingItem(
                                  isBlack: false,
                                  image: 'assets/images/icons/others.png',
                                  label: 'Others',
                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         LocalizationTestPage(),
                                    //   ),
                                    // );

                                    // print('Others tapped');
                                    CustomSnackBar.show(
                                      context,
                                      'This feature is coming soon...',
                                      type: SnackBarType.comingsoon,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: ResponsiveHelper.spacing(context, 25)),

                      // // Action Required Section
                      //
                      // AnimatedContainer(
                      //   duration: Duration(milliseconds: 400),
                      //   curve: Curves.easeInOut,
                      //   height: warningLists.isNotEmpty ? null : 0,
                      //   child: AnimatedOpacity(
                      //     duration: Duration(milliseconds: 300),
                      //     opacity: warningLists.isNotEmpty ? 1.0 : 0.0,
                      //     child: GestureDetector(
                      //       onTap: () {
                      //         CustomSnackBar.show(
                      //           context,
                      //           'This feature is coming soon...',
                      //           type: SnackBarType.comingsoon,
                      //         );
                      //       },
                      //       child: Container(
                      //         margin: EdgeInsets.only(
                      //           bottom: warningLists.isNotEmpty
                      //               ? ResponsiveHelper.spacing(context, 10)
                      //               : 0,
                      //         ),
                      //         padding: ResponsiveHelper.padding(
                      //           context,
                      //           vertical: 15,
                      //           horizontal: 15,
                      //         ),
                      //         decoration: BoxDecoration(
                      //           borderRadius: ResponsiveHelper.borderRadius(
                      //             context,
                      //             all: 15,
                      //           ),
                      //           color: Colors.white.withOpacity(0.5),
                      //         ),
                      //         child: Row(
                      //           mainAxisAlignment:
                      //               MainAxisAlignment.spaceAround,
                      //           children: [
                      //             Expanded(
                      //               child: Row(
                      //                 children: [
                      //                   Container(
                      //                     padding: ResponsiveHelper.padding(
                      //                       context,
                      //                       vertical: 10,
                      //                       horizontal: 15,
                      //                     ),
                      //                     decoration: BoxDecoration(
                      //                       color: Colors.white,
                      //                       borderRadius:
                      //                           ResponsiveHelper.borderRadius(
                      //                             context,
                      //                             all: 15,
                      //                           ),
                      //                     ),
                      //                     child: Center(
                      //                       child: AnimatedSwitcher(
                      //                         duration: Duration(
                      //                           milliseconds: 300,
                      //                         ),
                      //                         child: Text(
                      //                           '$actionCount',
                      //                           key: ValueKey(actionCount),
                      //                           style: TextStyle(
                      //                             fontSize:
                      //                                 ResponsiveHelper.fontSize(
                      //                                   context,
                      //                                   base: 20,
                      //                                 ),
                      //                             color: Colors.red,
                      //                             fontWeight: FontWeight.bold,
                      //                           ),
                      //                         ),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                   SizedBox(
                      //                     width: ResponsiveHelper.spacing(
                      //                       context,
                      //                       15,
                      //                     ),
                      //                   ),
                      //                   Expanded(
                      //                     child: Column(
                      //                       crossAxisAlignment:
                      //                           CrossAxisAlignment.start,
                      //                       children: [
                      //                         Text(
                      //                           'Action Required',
                      //                           style: TextStyle(
                      //                             color: Colors.white,
                      //                             fontWeight: FontWeight.bold,
                      //                             fontSize:
                      //                                 ResponsiveHelper.fontSize(
                      //                                   context,
                      //                                   base: 15,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                         Text(
                      //                           'Please complete it promptly',
                      //                           overflow: TextOverflow.ellipsis,
                      //                           style: TextStyle(
                      //                             color: Colors.white,
                      //                             fontWeight: FontWeight.w500,
                      //                             fontSize:
                      //                                 ResponsiveHelper.fontSize(
                      //                                   context,
                      //                                   base: 12,
                      //                                 ),
                      //                           ),
                      //                         ),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //             Icon(
                      //               Icons.keyboard_arrow_right,
                      //               color: Colors.white,
                      //               size: ResponsiveHelper.iconSize(
                      //                 context,
                      //                 base: 24,
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: ResponsiveHelper.spacing(context, 10)),
                    ],
                  ),
                ),

                // Report Section - Now with Expanded for flexible height
                Expanded(
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOutCubic,
                    width: double.infinity,
                    // Removed height: double.infinity - Expanded handles this now
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: ResponsiveHelper.borderRadius(
                        context,
                        topLeft: 24,
                        topRight: 24,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, -2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: ResponsiveHelper.padding(context, all: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Report',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 15,
                              ),
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(
                            height: ResponsiveHelper.spacing(context, 10),
                          ),
                          Expanded(
                            child: GridView.count(
                              padding: EdgeInsets.zero,
                              crossAxisCount: ResponsiveHelper.adaptive(
                                context,
                                mobile: 3,
                                tablet: 4,
                                desktop: 6,
                              ),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              mainAxisSpacing: ResponsiveHelper.spacing(
                                context,
                                5,
                              ),
                              crossAxisSpacing: ResponsiveHelper.spacing(
                                context,
                                5,
                              ),
                              childAspectRatio: ResponsiveHelper.adaptive(
                                context,
                                mobile: 1.4,
                                tablet: 1.3,
                                desktop: 1.2,
                              ),
                              children: [
                                ListingItem(
                                  isBlack: true,
                                  image: 'assets/images/icons/jkr.png',
                                  label: 'JKR Report',
                                  onTap: () {
                                    print('JKR Report tapped');
                                    CustomSnackBar.show(
                                      context,
                                      'This feature is coming soon...',
                                      type: SnackBarType.comingsoon,
                                    );
                                  },
                                ),
                                ListingItem(
                                  isBlack: true,
                                  image:
                                      'assets/images/icons/monthly_report.png',
                                  label: 'Monthly Report',
                                  onTap: () {
                                    print('Monthly Report tapped');
                                    CustomSnackBar.show(
                                      context,
                                      'This feature is coming soon...',
                                      type: SnackBarType.comingsoon,
                                    );
                                  },
                                ),
                                ListingItem(
                                  isBlack: true,
                                  image: 'assets/images/icons/statistic.png',
                                  label: 'Statistic',
                                  onTap: () {
                                    print('Statistic tapped');
                                    CustomSnackBar.show(
                                      context,
                                      'This feature is coming soon...',
                                      type: SnackBarType.comingsoon,
                                    );
                                  },
                                ),
                                ListingItem(
                                  isBlack: true,
                                  image:
                                      'assets/images/icons/hotmix_request.png',
                                  label: 'Hotmix Request',
                                  onTap: () {
                                    print('Hotmix Request tapped');
                                    CustomSnackBar.show(
                                      context,
                                      'This feature is coming soon...',
                                      type: SnackBarType.comingsoon,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
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
