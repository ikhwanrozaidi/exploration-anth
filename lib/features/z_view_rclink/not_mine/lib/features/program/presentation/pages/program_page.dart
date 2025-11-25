import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rclink_app/features/program/presentation/pages/program_creation_page.dart';
import 'package:rclink_app/shared/widgets/coming_soon_overlay.dart';

import '../../../../routes/app_router.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../work_scope/presentation/bloc/work_scope_bloc.dart';
import '../../../work_scope/presentation/widgets/work_scope_bottom_sheet.dart';
import '../../../../shared/widgets/month_filter_widget.dart';

class ProgramPage extends StatefulWidget {
  const ProgramPage({Key? key}) : super(key: key);

  @override
  State<ProgramPage> createState() => _ProgramPageState();
}

class _ProgramPageState extends State<ProgramPage> {
  bool showActionRequired = true;
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  void toggleActionRequired() {
    setState(() {
      showActionRequired = !showActionRequired;
    });
  }

  void onMonthSelected(String from, String to) {
    setState(() {
      final fromDate = DateTime.parse(from);
      selectedMonth = fromDate.month;
      selectedYear = fromDate.year;
    });
    print('From: $from, To: $to');
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    double bottomContainerHeight = showActionRequired
        ? MediaQuery.of(context).size.height * 0.76
        : MediaQuery.of(context).size.height * 0.70;

    return Scaffold(
      body: ComingSoonOverlay(
        backButton: false,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 135, 167, 247), primaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.2],
            ),
          ),
          child: Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(
                        height: ResponsiveHelper.getHeight(context, 0.02),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Program',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 18,
                              ),
                            ),
                          ),

                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                style: IconButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.all(5),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ProgramCreationPage(),
                                    ),
                                  );

                                  // print("Add button clicked");
                                  // CustomSnackBar.show(
                                  //   context,
                                  //   'This feature is coming soon...',
                                  //   type: SnackBarType.comingsoon,
                                  // );
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: primaryColor,
                                  size: ResponsiveHelper.iconSize(
                                    context,
                                    base: 20,
                                  ),
                                ),
                              ),

                              SizedBox(
                                width: ResponsiveHelper.spacing(context, 5),
                              ),

                              IconButton(
                                style: IconButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: Colors.white,
                                  padding: const EdgeInsets.all(5),
                                ),
                                onPressed: () {
                                  print("Delete button clicked");
                                  CustomSnackBar.show(
                                    context,
                                    'This feature is coming soon...',
                                    type: SnackBarType.comingsoon,
                                  );
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                  size: ResponsiveHelper.iconSize(
                                    context,
                                    base: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubic,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.74,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 10.0,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'All Reports',
                                    style: TextStyle(
                                      fontSize: ResponsiveHelper.fontSize(
                                        context,
                                        base: 15,
                                      ),
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
                                      '98',
                                      style: TextStyle(
                                        color: Colors.amber,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(
                              height: ResponsiveHelper.spacing(context, 15),
                            ),

                            TextButton(
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                backgroundColor: Colors.grey.shade200,
                              ),
                              onPressed: () {
                                CustomSnackBar.show(
                                  context,
                                  'This feature is coming soon...',
                                  type: SnackBarType.comingsoon,
                                );
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
                                      size: ResponsiveHelper.iconSize(
                                        context,
                                        base: 25,
                                      ),
                                      color: Colors.black.withOpacity(0.5),
                                    ),

                                    SizedBox(width: 20),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Search contractor or district',
                                          style: TextStyle(
                                            color: Colors.black.withOpacity(
                                              0.5,
                                            ),
                                            fontSize: ResponsiveHelper.fontSize(
                                              context,
                                              base: 13,
                                            ),
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
                        padding: ResponsiveHelper.padding(context, all: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Contractor
                                Expanded(
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
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
                                      CustomSnackBar.show(
                                        context,
                                        'This feature is coming soon...',
                                        type: SnackBarType.comingsoon,
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.person,
                                              size: 10,
                                              color: Colors.black,
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'Contractor',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: w * 0.022,
                                                // fontWeight: FontWeight.w400,
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

                                // Scope Work
                                Expanded(
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
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
                                      final workScopeBloc = context
                                          .read<WorkScopeBloc>();
                                      final workScopeState =
                                          workScopeBloc.state;

                                      showWorkScopeSelection(
                                        context: context,
                                        state: workScopeState,
                                        onScopeSelected: (selectedData) {
                                          print(
                                            'Selected UID: ${selectedData['uid']}',
                                          );
                                          print(
                                            'Code: ${selectedData['code']}',
                                          );
                                          print(
                                            'Name: ${selectedData['name']}',
                                          );
                                          print(
                                            'Description: ${selectedData['description']}',
                                          );
                                          print(
                                            'Allow Multiple Quantities: ${selectedData['allowMultipleQuantities']}',
                                          );

                                          // setState(() {
                                          //   _selectedWorkScopeUid = selectedData['uid'];
                                          //   _selectedWorkScopeName = selectedData['displayText'];
                                          // });
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
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: Colors.black,
                                                    fontSize: w * 0.022,
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

                                // Status
                                Expanded(
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 15,
                                      ),
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
                                      CustomSnackBar.show(
                                        context,
                                        'This feature is coming soon...',
                                        type: SnackBarType.comingsoon,
                                      );
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
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
                                              'Status',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: w * 0.022,
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
                              ],
                            ),

                            SizedBox(height: 20),

                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //     builder: (context) => ProgramDetailsPage(),
                                //   ),
                                // );

                                context.pushNamed(
                                  AppRouteName.programDetail,
                                  pathParameters: {'programId': '101'},
                                  queryParameters: {'from': 'programs'},
                                );
                              },
                              child: Container(
                                padding: ResponsiveHelper.padding(
                                  context,
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Color.fromARGB(255, 238, 242, 254),
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                  ),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: ResponsiveHelper.padding(
                                            context,
                                            all: 12,
                                          ),
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '007',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    ResponsiveHelper.fontSize(
                                                      context,
                                                      base: 13,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),

                                        SizedBox(width: 15),

                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'ROADCARE(M) SDN BHD',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                color: Colors.black,
                                                fontSize:
                                                    ResponsiveHelper.fontSize(
                                                      context,
                                                      base: 13,
                                                    ),
                                              ),
                                            ),
                                            SizedBox(height: 2),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.swap_calls,
                                                  size:
                                                      ResponsiveHelper.iconSize(
                                                        context,
                                                        base: 16,
                                                      ),
                                                  color: Colors.black,
                                                ),
                                                SizedBox(width: 5),
                                                Text(
                                                  '402.70 - 412.80',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
                                                    fontSize:
                                                        ResponsiveHelper.fontSize(
                                                          context,
                                                          base: 12,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),

                                    Divider(
                                      height: 40,
                                      color: Colors.grey.shade300,
                                      thickness: 1,
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_sharp,
                                            color: Colors.black,
                                            size: ResponsiveHelper.iconSize(
                                              context,
                                              base: 20,
                                            ),
                                          ),

                                          SizedBox(width: 15),

                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'PEKAN',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.grey,
                                                    fontSize:
                                                        ResponsiveHelper.fontSize(
                                                          context,
                                                          base: 12,
                                                        ),
                                                  ),
                                                ),
                                                SizedBox(height: 2),
                                                Text(
                                                  'FT2485 - JALAN MASUK KE BANDAR PALOH NILAI',
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.black,
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

                                    Divider(
                                      height: 40,
                                      color: Colors.grey.shade300,
                                      thickness: 1,
                                    ),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Progress',
                                              style: TextStyle(
                                                fontSize:
                                                    ResponsiveHelper.fontSize(
                                                      context,
                                                      base: 12,
                                                    ),
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              'null/50',
                                              style: TextStyle(
                                                fontSize:
                                                    ResponsiveHelper.fontSize(
                                                      context,
                                                      base: 12,
                                                    ),
                                                fontWeight: FontWeight.w600,
                                                color: primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),

                                        SizedBox(
                                          height: ResponsiveHelper.spacing(
                                            context,
                                            8,
                                          ),
                                        ),

                                        Container(
                                          height: ResponsiveHelper.spacing(
                                            context,
                                            10,
                                          ),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),
                                          child: FractionallySizedBox(
                                            alignment: Alignment.centerLeft,
                                            widthFactor:
                                                0.2, // 10/50 = 0.2 (20%)
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: primaryColor,
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                            ),
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
