import 'package:flutter/material.dart';

import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import 'widgets/month_filter_widget.dart';

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

  void onMonthSelected(int month, int year) {
    setState(() {
      selectedMonth = month;
      selectedYear = year;
    });
    print('Selected month: $month, year: $year');
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    double bottomContainerHeight = showActionRequired
        ? MediaQuery.of(context).size.height * 0.76
        : MediaQuery.of(context).size.height * 0.70;

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
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Program',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
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
                                print("Add button clicked");
                                CustomSnackBar.show(
                                  context,
                                  'This feature is coming soon...',
                                  type: SnackBarType.comingsoon,
                                );
                              },
                              icon: const Icon(
                                Icons.add,
                                color: primaryColor,
                                size: 25,
                              ),
                            ),
                            SizedBox(width: 8),
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
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 25,
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
                height: bottomContainerHeight,
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Search contractor or district',
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
                              CustomSnackBar.show(
                                context,
                                'This feature is coming soon...',
                                type: SnackBarType.comingsoon,
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 25,
                                horizontal: 15,
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
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(15),
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            '007',
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
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
                                            ),
                                          ),
                                          SizedBox(height: 2),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.swap_calls,
                                                size: 18,
                                                color: Colors.black,
                                              ),
                                              SizedBox(width: 5),
                                              Text(
                                                '402.70 - 412.80',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontSize: 12,
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
                                          size: 20,
                                          color: Colors.black,
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
                                                  fontSize: 12,
                                                ),
                                              ),
                                              SizedBox(height: 2),
                                              Text(
                                                'FT2485 - JALAN MASUK KE BANDAR PALOH NILAI',
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black,
                                                  fontSize: 12,
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
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '10/50',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(height: 8),

                                      Container(
                                        height: 12,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: FractionallySizedBox(
                                          alignment: Alignment.centerLeft,
                                          widthFactor: 0.2, // 10/50 = 0.2 (20%)
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
    );
  }
}
