import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../routes/app_router.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/divider_config.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../../shared/widgets/theme_listtile_widget.dart';

class ViewReportProgramPage extends StatefulWidget {
  const ViewReportProgramPage({Key? key}) : super(key: key);

  @override
  State<ViewReportProgramPage> createState() => _ViewReportProgramPageState();
}

class _ViewReportProgramPageState extends State<ViewReportProgramPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.1),
                        blurRadius: 5,
                        offset: Offset(-2, 6),
                      ),
                    ],
                  ),
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    style: IconButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.all(5),
                    ),
                    onPressed: () {
                      print("Bell button clicked");
                    },
                    icon: const Icon(
                      Icons.notifications_active,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    style: IconButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: primaryColor,
                      padding: const EdgeInsets.all(5),
                    ),
                    onPressed: () {
                      print("Share button clicked");
                    },
                    icon: const Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),

      // Content
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
                ),
              ),
              child: Image.asset(
                'imagelink',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey.shade300,
                    ),

                    child: Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey.shade600,
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            // Warning
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.redAccent.shade200,
                    Colors.redAccent.shade100.withOpacity(0.5),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Warning',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),

                  Divider(height: 40, thickness: 0.5, color: Colors.white),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.info, color: Colors.white),

                            SizedBox(width: 10),

                            Text(
                              'warning null',
                              style: TextStyle(
                                fontSize: ResponsiveHelper.fontSize(
                                  context,
                                  base: 14,
                                ),
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 15),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => WarningDetailsPage(),
                              //   ),
                              // );

                              // context.pushNamed(
                              //   AppRouteName.warningDetail,
                              //   pathParameters: {'warningId': '4567'},
                              //   queryParameters: {
                              //     'from': 'program',
                              //     'programId': '1234',
                              //     'programName': 'Program Test GoRouter',
                              //   },
                              // );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: ResponsiveHelper.padding(
                                context,
                                vertical: 12,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'View Warning Action',
                              style: TextStyle(
                                color: Colors.redAccent,
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
                ],
              ),
            ),

            SizedBox(height: 20),

            // Overview
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.white, Color.fromARGB(255, 238, 242, 254)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Container(
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Center(
                                  child: Text(
                                    'code',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(width: 10),

                              Expanded(
                                child: Text(
                                  'workscope name',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 14,
                                    ),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  dividerConfig(),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        ThemeListTileWidget(
                          title: 'Date',
                          titleDetails: DateFormat('d MMM yyyy hh:mma').format(
                            DateTime.parse(
                              '2025-09-22T20:01:55.752Z',
                            ).toLocal(),
                          ),
                          icon: Icons.calendar_month,
                        ),

                        dividerConfig(),

                        ThemeListTileWidget(
                          title: 'Contractor',
                          titleDetails: 'null',
                          icon: Icons.person,
                          isChevron: false,
                        ),

                        dividerConfig(),

                        ThemeListTileWidget(
                          title: 'Reporter',
                          titleDetails: 'null',
                          icon: Icons.person_pin,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Location
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.white, Color.fromARGB(255, 238, 242, 254)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  dividerConfig(),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        ThemeListTileWidget(
                          title: 'districtName null',
                          titleDetails: 'roadNo roadName null',
                          icon: Icons.location_pin,
                          isChevron: false,
                        ),

                        dividerConfig(),

                        ThemeListTileWidget(
                          title: 'Section',
                          titleDetails: 'null',
                          icon: Icons.swap_calls,
                          isChevron: false,
                        ),

                        // if (widget.report.latitude != null &&
                        //     widget.report.longitude != null)
                        //   Column(
                        //     children: [
                        //       dividerConfig(),

                        //       Stack(
                        //         children: [
                        //           Container(
                        //             height: 200,
                        //             decoration: BoxDecoration(
                        //               borderRadius: BorderRadius.circular(10),
                        //               border: Border.all(
                        //                 color: Colors.grey.shade300,
                        //               ),
                        //             ),
                        //             clipBehavior: Clip.antiAlias,
                        //             child: GoogleMap(
                        //               initialCameraPosition: CameraPosition(
                        //                 target: LatLng(
                        //                   double.parse(widget.report.latitude!),
                        //                   double.parse(
                        //                     widget.report.longitude!,
                        //                   ),
                        //                 ),
                        //                 zoom: 14,
                        //               ),
                        //               markers: {
                        //                 Marker(
                        //                   markerId: MarkerId('report_location'),
                        //                   position: LatLng(
                        //                     double.parse(
                        //                       widget.report.latitude!,
                        //                     ),
                        //                     double.parse(
                        //                       widget.report.longitude!,
                        //                     ),
                        //                   ),
                        //                   infoWindow: InfoWindow(
                        //                     title: widget.report.name,
                        //                   ),
                        //                 ),
                        //               },
                        //               zoomControlsEnabled: false,
                        //               myLocationButtonEnabled: false,
                        //             ),
                        //           ),

                        //           Positioned.fill(
                        //             bottom: 10,
                        //             child: Align(
                        //               alignment: Alignment.bottomCenter,
                        //               child: ElevatedButton(
                        //                 onPressed: () {
                        //                   final lat = widget.report.latitude!;
                        //                   final lng = widget.report.longitude!;
                        //                   final url =
                        //                       'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
                        //                 },
                        //                 style: ElevatedButton.styleFrom(
                        //                   backgroundColor: Colors.white,
                        //                   side: BorderSide(
                        //                     color: primaryColor,
                        //                     width: ResponsiveHelper.adaptive(
                        //                       context,
                        //                       mobile: 1.0,
                        //                       tablet: 1.5,
                        //                       desktop: 2.0,
                        //                     ),
                        //                   ),
                        //                   padding: ResponsiveHelper.padding(
                        //                     context,
                        //                     vertical: 10,
                        //                     horizontal: 20,
                        //                   ),

                        //                   shape: RoundedRectangleBorder(
                        //                     borderRadius:
                        //                         ResponsiveHelper.borderRadius(
                        //                           context,
                        //                           all: 14,
                        //                         ),
                        //                   ),
                        //                 ),
                        //                 child: Text('View location'),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Equipment
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.white, Color.fromARGB(255, 238, 242, 254)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Equipment',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  dividerConfig(),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: primaryColor, width: 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        'null',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 13,
                          ),
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Others
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.white, Color.fromARGB(255, 238, 242, 254)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Others',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  dividerConfig(),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        ThemeListTileWidget(
                          title: 'Photo Report (JKR)',
                          titleDetails: 'View Photo Report',
                          icon: Icons.image_outlined,
                          isInverseBold: true,
                        ),

                        dividerConfig(),

                        ThemeListTileWidget(
                          title: 'Edit Report',
                          titleDetails: 'Quantity, section and others',
                          icon: Icons.edit_square,
                          isInverseBold: true,
                          onTap: () {
                            showFlexibleBottomsheet(
                              context: context,
                              title: 'Edit Report',
                              attributes: [
                                'Route & Selection',
                                'Quantity',
                                'Worker & Remark',
                                'Equipment',
                              ],
                              isRadio: false,
                              isNavigate: true,
                              onTap: (selectedOption) {
                                // Navigate to respective pages based on selection
                                switch (selectedOption) {
                                  case 'Route & Selection':
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => RouteEditPage(
                                    //       report: widget.report,
                                    //     ),
                                    //   ),
                                    // );
                                    break;
                                  case 'Quantity':
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => QuantityEditPage(
                                    //       report: widget.report,
                                    //     ),
                                    //   ),
                                    // );
                                    break;
                                  case 'Worker & Remark':
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) =>
                                    //         WorkerRemarkEditPage(
                                    //           report: widget.report,
                                    //         ),
                                    //   ),
                                    // );
                                    break;
                                  case 'Equipment':
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => EquipmentEditPage(
                                    //       report: widget.report,
                                    //     ),
                                    //   ),
                                    // );
                                    break;
                                }
                              },
                            );
                          },
                        ),

                        dividerConfig(),

                        ThemeListTileWidget(
                          title: 'Add Warning',
                          titleDetails: 'Choose list of fault',
                          icon: Icons.calendar_today_rounded,
                          isInverseBold: true,
                        ),

                        dividerConfig(),

                        ThemeListTileWidget(
                          title: 'Monthly Summary',
                          titleDetails: 'List of overall report',
                          icon: Icons.calendar_today_rounded,
                          isInverseBold: true,
                        ),

                        dividerConfig(),

                        ThemeListTileWidget(
                          title: 'Update History',
                          titleDetails: 'List of overall report',
                          icon: Icons.history,
                          isInverseBold: true,
                        ),

                        SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Company Details
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'CONTRACTOR ENTERPRISE',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Divider(height: 30, thickness: 0.5, color: Colors.grey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            '1',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 14,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text('Report'),
                        ],
                      ),
                      Container(color: Colors.grey, height: 30, width: 1),
                      Column(
                        children: [
                          Text(
                            '3',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 14,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text('Users'),
                        ],
                      ),
                      Container(color: Colors.grey, height: 30, width: 1),
                      Column(
                        children: [
                          Text(
                            'No Record',
                            style: TextStyle(
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 14,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text('CIDB'),
                        ],
                      ),
                    ],
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 20),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (context) => EditCompanyPage(),
                        //   ),
                        // );
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
                      child: Text(
                        'View all reports',
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
          ],
        ),
      ),
    );
  }
}
