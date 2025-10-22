import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/di/injection.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../tempo/location/presentation/bloc/location_bloc.dart';
import '../../../../../tempo/location/presentation/bloc/location_event.dart';
import '../../../../../tempo/location/presentation/helper/location_level.dart';
import '../../../../../tempo/location/presentation/helper/location_selection_results.dart';
import '../../../../../tempo/location/presentation/pages/location_field_tile.dart';
import '../../../../../tempo/location/presentation/widgets/location_selection_flow.dart';
import '../../../../../tempo/program/presentation/pages/widgets/month_filter_widget.dart';
import '../../../../../tempo/work_scope/presentation/bloc/work_scope_bloc.dart';
import '../../../../../tempo/work_scope/presentation/bloc/work_scope_event.dart';
import '../../../../../tempo/work_scope/presentation/bloc/work_scope_state.dart';
import '../../../../../tempo/work_scope/presentation/pages/work_scope_field_tile.dart';
import '../../../../../tempo/work_scope/presentation/widgets/work_scope_bottom_sheet.dart';
import '../widgets/daily_report_page_loading.dart';

class DailyReportPage extends StatefulWidget {
  const DailyReportPage({Key? key}) : super(key: key);

  @override
  State<DailyReportPage> createState() => _DailyReportPageState();
}

class _DailyReportPageState extends State<DailyReportPage> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  bool isLoading = false;
  List<dynamic> reports = [];
  String? errorMessage;

  Map<String, dynamic>? selectedWorkScope;

  @override
  void initState() {
    super.initState();
    _loadDailyReports();
  }

  void onMonthSelected(int month, int year) {
    setState(() {
      selectedMonth = month;
      selectedYear = year;
    });
    print('Selected month: $month, year: $year');
  }

  Future<void> _loadDailyReports() async {
    setState(() {
      isLoading = true;
      errorMessage = null;
    });

    try {
      // final fetchedReports = await yourApiService.getDailyReports(
      //   companyUID: selectedCompany.uid,
      //   page: 1,
      //   limit: 10,
      //   sortOrder: 'asc',
      // );

      await Future.delayed(Duration(seconds: 2));

      setState(() {
        reports = []; // fetched reports here
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<LocationBloc>().add(
            const LocationEvent.clearAllLocationCache(),
          );

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('🗑️ Location cache cleared!'),
              duration: Duration(seconds: 2),
            ),
          );

          _loadDailyReports();
        },
        tooltip: 'Clear Location Cache (Debug)',
        child: const Icon(Icons.delete_sweep),
      ),
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
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              style: IconButton.styleFrom(
                                shape: const CircleBorder(),
                                backgroundColor: Colors.white,
                                padding: const EdgeInsets.all(5),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_rounded,
                                color: primaryColor,
                                size: 25,
                              ),
                            ),
                            SizedBox(
                              width: ResponsiveHelper.spacing(context, 10),
                            ),
                            Text(
                              'Daily Report',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(5),
                          ),
                          onPressed: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => DailyReportCreationPage(),
                            //   ),
                            // );
                          },
                          icon: const Icon(
                            Icons.add,
                            color: primaryColor,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 30.0, left: 30.0),
                        child: Row(
                          children: [
                            Text(
                              'All Reports',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.black,
                              ),
                            ),

                            SizedBox(width: 10),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.amber.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                reports.length.toString(),
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      _buildBody(),
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

  Widget _buildBody() {
    if (isLoading) {
      return Expanded(child: DailyReportPageLoading());
    }

    if (errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(errorMessage!, style: const TextStyle(color: Colors.red)),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _loadDailyReports,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      backgroundColor: Colors.grey.shade200,
                    ),
                    onPressed: () {
                      // TODO: Implement search functionality
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 11,
                        horizontal: 25,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            size: 30,
                            color: Colors.black.withOpacity(0.5),
                          ),
                          SizedBox(width: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Search report',
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            MonthFilter(
              onMonthSelected: onMonthSelected,
              primaryColor: primaryColor,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  // District
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            LocationSelectionFlow.show(
                              context: context,
                              startFrom: LocationLevel.districts,
                              endAt: LocationLevel.districts,
                              onSelected: (LocationSelectionResult result) {
                                print('Selected: ${result.fullPath}');
                                print('Road UID: ${result.road?.uid}');
                                print('Road Name: ${result.road?.name}');
                              },
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.grid_on,
                                    size: 10,
                                    color: Colors.black,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'District',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: ResponsiveHelper.fontSize(
                                        context,
                                        base: 10,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.expand_more,
                                size: 15,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 10),

                      // Contractor
                      Expanded(
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                              side: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            backgroundColor: Colors.white,
                          ),
                          onPressed: () {
                            // TODO: Implement contractor filter
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.person,
                                      size: 10,
                                      color: Colors.black,
                                    ),
                                    SizedBox(width: 5),
                                    Expanded(
                                      child: Text(
                                        'Contractor',
                                        style: TextStyle(
                                          color: Colors.black,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: ResponsiveHelper.fontSize(
                                            context,
                                            base: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.expand_more,
                                size: 15,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 10),

                      // Scope Work
                      Expanded(
                        child: BlocProvider(
                          create: (context) =>
                              getIt<WorkScopeBloc>()
                                ..add(const WorkScopeEvent.loadWorkScopes()),
                          child: BlocBuilder<WorkScopeBloc, WorkScopeState>(
                            builder: (context, workScopeState) {
                              return TextButton(
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(horizontal: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    side: BorderSide(
                                      color: Colors.grey.shade300,
                                      width: 1,
                                    ),
                                  ),
                                  backgroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  showWorkScopeSelection(
                                    context: context,
                                    state: workScopeState,
                                    onScopeSelected: (selectedData) {
                                      setState(() {
                                        selectedWorkScope = selectedData;
                                      });

                                      print(
                                        'Selected: ${selectedData['displayText']}',
                                      );
                                      print('UID: ${selectedData['uid']}');
                                    },
                                  );
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.restaurant_menu,
                                            size: 10,
                                            color: Colors.black,
                                          ),
                                          SizedBox(width: 5),
                                          Expanded(
                                            child: Text(
                                              'Scope Work',
                                              style: TextStyle(
                                                overflow: TextOverflow.ellipsis,
                                                color: Colors.black,
                                                fontSize:
                                                    ResponsiveHelper.fontSize(
                                                      context,
                                                      base: 10,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(
                                      Icons.expand_more,
                                      size: 15,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  // TODO: Uncomment and implement list view when ready
                  // ListView.builder(
                  //   shrinkWrap: true,
                  //   physics: const NeverScrollableScrollPhysics(),
                  //   itemCount: reports.length,
                  //   itemBuilder: (context, index) {
                  //     return DailyReportOverviewListWidget(
                  //       report: reports[index],
                  //     );
                  //   },
                  // ),

                  // // Test WorkScope
                  // WorkScopeFieldTile(
                  //   onScopeSelected: (selectedData) {
                  //     setState(() {
                  //       selectedWorkScope = selectedData;
                  //     });
                  //   },
                  // ),

                  // // Test Location
                  // LocationFieldTile(
                  //   startFrom: LocationLevel.provinces,
                  //   endAt: LocationLevel.roads,
                  //   onLocationSelected: (LocationSelectionResult result) {
                  //     print('Road UID: ${result.road?.uid}');
                  //     print('Road Name: ${result.road?.name}');
                  //     print('Road No: ${result.road?.roadNo}');
                  //     print('Section Start: ${result.road?.sectionStart}');
                  //     print('Section Finish: ${result.road?.sectionFinish}');
                  //     print('Main Category ID: ${result.road?.mainCategoryId}');
                  //     print('District: ${result.road?.district?.name}');
                  //     print('Province: ${result.district?.state?.name}');
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
