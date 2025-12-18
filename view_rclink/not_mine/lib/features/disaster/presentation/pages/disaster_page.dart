import 'package:flutter/material.dart';
import 'package:rclink_app/shared/widgets/coming_soon_overlay.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/month_filter_widget.dart';
import '../widget/filter_chip_widget.dart';

class DisasterPage extends StatefulWidget {
  const DisasterPage({Key? key}) : super(key: key);

  @override
  State<DisasterPage> createState() => _DisasterPageState();
}

class _DisasterPageState extends State<DisasterPage> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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

                        SizedBox(width: 15),

                        Text(
                          'Disaster',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 18,
                            ),
                          ),
                        ),
                      ],
                    ),

                    IconButton(
                      style: IconButton.styleFrom(
                        shape: const CircleBorder(),
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.all(10),
                      ),
                      onPressed: () {
                        print("Add button clicked");
                        CustomSnackBar.show(
                          context,
                          'This feature is coming soon...',
                          type: SnackBarType.comingsoon,
                        );
                      },
                      icon: Icon(
                        Icons.add,
                        color: primaryColor,
                        size: ResponsiveHelper.iconSize(context, base: 20),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

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
                  child: Padding(
                    padding: const EdgeInsets.only(
                      right: 20.0,
                      left: 20.0,
                      top: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MonthFilter(
                          onMonthSelected: onMonthSelected,
                          primaryColor: primaryColor,
                        ),

                        SizedBox(height: 20),

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
                                  size: 30,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Search route',
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

                        SizedBox(height: 20),

                        FilterChipWidget(
                          label: 'Type',
                          filters: const [
                            'All',
                            'Flood',
                            'Collapsing Slope',
                            'Landslide',
                          ],
                          initialSelected: 'All',
                          onFilterSelected: (filter) {
                            // setState(() {
                            //   selectedType = filter;
                            // });
                            print('Selected filter: $filter');
                          },
                        ),

                        SizedBox(height: 10),

                        // Filter
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Route
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
                                          'Route',
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

                            // Status
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
                      ],
                    ),
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
