import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rclink_app/features/daily_report_creation/presentation/pages/report_creation_page.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../program/presentation/pages/widgets/month_filter_widget.dart';
import 'widget/overview_list_widget.dart';

class DailyReportPage extends StatefulWidget {
  const DailyReportPage({Key? key}) : super(key: key);

  @override
  State<DailyReportPage> createState() => _DailyReportPageState();
}

class _DailyReportPageState extends State<DailyReportPage> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  void onMonthSelected(int month, int year) {
    setState(() {
      selectedMonth = month;
      selectedYear = year;
    });
    print('Selected month: $month, year: $year');
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DailyReportCreationPage(),
                              ),
                            );
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
                  // padding: EdgeInsets.all(25),
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
                  child: SingleChildScrollView(
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
                                        borderRadius: BorderRadius.circular(
                                          100,
                                        ),
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
                                onPressed: () {},
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
                                            'Search report',
                                            style: TextStyle(
                                              color: Colors.black.withOpacity(
                                                0.5,
                                              ),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Contractor
                                  Expanded(
                                    child: TextButton(
                                      style: TextButton.styleFrom(
                                        padding: EdgeInsets.symmetric(
                                          horizontal: 15,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                          side: BorderSide(
                                            color: Colors.grey.shade300,
                                            width: 1,
                                          ),
                                        ),
                                        backgroundColor: Colors.white,
                                      ),
                                      onPressed: () {},
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
                                                  fontSize:
                                                      ResponsiveHelper.fontSize(
                                                        context,
                                                        base: 10,
                                                      ),
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
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                          side: BorderSide(
                                            color: Colors.grey.shade300,
                                            width: 1,
                                          ),
                                        ),
                                        backgroundColor: Colors.white,
                                      ),
                                      onPressed: () {},
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
                                          borderRadius: BorderRadius.circular(
                                            50,
                                          ),
                                          side: BorderSide(
                                            color: Colors.grey.shade300,
                                            width: 1,
                                          ),
                                        ),
                                        backgroundColor: Colors.white,
                                      ),
                                      onPressed: () {},
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
                                                  fontSize:
                                                      ResponsiveHelper.fontSize(
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
                                ],
                              ),

                              SizedBox(height: 20),

                              // Daily report
                              //
                              //
                              // Container(
                              //   padding: EdgeInsets.symmetric(
                              //     vertical: 25,
                              //     horizontal: 15,
                              //   ),
                              //   decoration: BoxDecoration(
                              //     border: Border.all(color: Colors.grey.shade300),
                              //     borderRadius: BorderRadius.circular(10),
                              //   ),
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       // Carousel Slider
                              //       SizedBox(
                              //         height: 200,
                              //         child: Stack(
                              //           children: [
                              //             PageView.builder(
                              //               controller: _pageController,
                              //               onPageChanged: (index) {
                              //                 setState(() {
                              //                   _currentIndex = index;
                              //                 });
                              //               },
                              //               itemCount: carouselItems.length,
                              //               itemBuilder: (context, index) {
                              //                 final item = carouselItems[index];
                              //                 return Container(
                              //                   margin: EdgeInsets.symmetric(
                              //                     horizontal: 5,
                              //                   ),
                              //                   decoration: BoxDecoration(
                              //                     borderRadius:
                              //                         BorderRadius.circular(10),
                              //                   ),
                              //                   child: ClipRRect(
                              //                     borderRadius:
                              //                         BorderRadius.circular(10),
                              //
                              //                     // Dark gradient overlay
                              //                     child: Container(
                              //                       width: double.infinity,
                              //                       height: double.infinity,
                              //                       decoration: BoxDecoration(
                              //                         gradient: LinearGradient(
                              //                           begin:
                              //                               Alignment.topCenter,
                              //                           end: Alignment
                              //                               .bottomCenter,
                              //                           colors: [
                              //                             Colors.transparent,
                              //                             Colors.black
                              //                                 .withOpacity(0.7),
                              //                           ],
                              //                         ),
                              //                       ),
                              //                       child: Image.asset(
                              //                         item['image']!,
                              //                         fit: BoxFit.cover,
                              //                         errorBuilder:
                              //                             (
                              //                               context,
                              //                               error,
                              //                               stackTrace,
                              //                             ) {
                              //                               return Container(
                              //                                 color: Colors
                              //                                     .grey
                              //                                     .shade300,
                              //                                 child: Icon(
                              //                                   Icons
                              //                                       .image_not_supported,
                              //                                   size: 50,
                              //                                   color: Colors
                              //                                       .grey
                              //                                       .shade600,
                              //                                 ),
                              //                               );
                              //                             },
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 );
                              //               },
                              //             ),
                              //
                              //             Padding(
                              //               padding: const EdgeInsets.all(15.0),
                              //               child: Column(
                              //                 mainAxisAlignment:
                              //                     MainAxisAlignment.spaceBetween,
                              //                 children: [
                              //                   Row(
                              //                     mainAxisAlignment:
                              //                         MainAxisAlignment
                              //                             .spaceBetween,
                              //                     children: [
                              //                       Container(
                              //                         margin: EdgeInsets.only(
                              //                           left: 5,
                              //                         ),
                              //                         padding:
                              //                             EdgeInsets.symmetric(
                              //                               horizontal: 10,
                              //                               vertical: 5,
                              //                             ),
                              //                         decoration: BoxDecoration(
                              //                           color: Colors.white,
                              //                           borderRadius:
                              //                               BorderRadius.circular(
                              //                                 8,
                              //                               ),
                              //                         ),
                              //                         child: Text(
                              //                           'R04',
                              //                           style: TextStyle(
                              //                             fontSize: 12,
                              //                             fontWeight:
                              //                                 FontWeight.bold,
                              //                             color: Colors.black,
                              //                           ),
                              //                         ),
                              //                       ),

                              //                       Container(
                              //                         margin: EdgeInsets.only(
                              //                           right: 5,
                              //                         ),
                              //                         padding:
                              //                             EdgeInsets.symmetric(
                              //                               horizontal: 10,
                              //                               vertical: 5,
                              //                             ),
                              //                         decoration: BoxDecoration(
                              //                           color: Colors.white,
                              //                           borderRadius:
                              //                               BorderRadius.circular(
                              //                                 100,
                              //                               ),
                              //                         ),
                              //                         child: Text(
                              //                           '31 Mar',
                              //                           style: TextStyle(
                              //                             fontSize: 12,
                              //                             fontWeight:
                              //                                 FontWeight.bold,
                              //                             color: Colors.black,
                              //                           ),
                              //                         ),
                              //                       ),
                              //                     ],
                              //                   ),

                              //                   // Page indicators
                              //                   Row(
                              //                     mainAxisAlignment:
                              //                         MainAxisAlignment.center,
                              //                     children: List.generate(
                              //                       carouselItems.length,
                              //                       (index) => Container(
                              //                         margin:
                              //                             EdgeInsets.symmetric(
                              //                               horizontal: 2,
                              //                             ),
                              //                         width:
                              //                             _currentIndex == index
                              //                             ? 8
                              //                             : 8,
                              //                         height: 8,
                              //                         decoration: BoxDecoration(
                              //                           color:
                              //                               _currentIndex == index
                              //                               ? Colors.white
                              //                               : Colors
                              //                                     .grey
                              //                                     .shade400,
                              //                           borderRadius:
                              //                               BorderRadius.circular(
                              //                                 4,
                              //                               ),
                              //                         ),
                              //                       ),
                              //                     ),
                              //                   ),
                              //                 ],
                              //               ),
                              //             ),
                              //           ],
                              //         ),
                              //       ),

                              //       SizedBox(height: 15),

                              //       Text(
                              //         'ROADCARE (M) SDN BHD',
                              //         style: TextStyle(
                              //           fontWeight: FontWeight.w600,
                              //           fontSize: ResponsiveHelper.fontSize(
                              //             context,
                              //             base: 15,
                              //           ),
                              //         ),
                              //       ),

                              //       SizedBox(height: 10),

                              //       Row(
                              //         children: [
                              //           Icon(
                              //             Icons.location_on,
                              //             color: Colors.black,
                              //           ),

                              //           SizedBox(width: 12),

                              //           Expanded(
                              //             child: Column(
                              //               crossAxisAlignment:
                              //                   CrossAxisAlignment.start,
                              //               children: [
                              //                 Text(
                              //                   'PEKAN',
                              //                   style: TextStyle(
                              //                     color: Colors.black.withOpacity(
                              //                       0.6,
                              //                     ),
                              //                     fontSize:
                              //                         ResponsiveHelper.fontSize(
                              //                           context,
                              //                           base: 14,
                              //                         ),
                              //                   ),
                              //                 ),
                              //                 Text(
                              //                   'FT2485 - JALAN MASUK KE BANDAR PALOH NILAI',
                              //                   overflow: TextOverflow.ellipsis,
                              //                 ),
                              //               ],
                              //             ),
                              //           ),
                              //         ],
                              //       ),

                              //       SizedBox(height: 10),

                              //       Row(
                              //         children: [
                              //           Icon(
                              //             Icons.swap_calls,
                              //             color: Colors.black,
                              //           ),

                              //           SizedBox(width: 12),
                              //           Text('1.20'),
                              //         ],
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              DailyReportOverviewListWidget(
                                scopeOfWork: 'R04',
                                date: '31 Mar',
                                company: 'ROADCARE (M) SDN BHD',
                                city: 'PEKAN',
                                roadName:
                                    'FT1234 - JALAN MASUK KE BANDAR PALOH',
                                roadSection: 1.5,
                                images: ['1', '2', '3'],
                              ),

                              DailyReportOverviewListWidget(
                                scopeOfWork: 'R10',
                                date: '31 Mar',
                                company: 'WHOCARE (M) SDN BHD',
                                city: 'PEKAN',
                                roadName:
                                    'FT1234 - JALAN MASUK KE BANDAR PALOH',
                                roadSection: 1.5,
                                images: ['1', '2', '3'],
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
    );
  }
}
