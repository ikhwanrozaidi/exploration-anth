import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../routes/app_router.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/divider_config.dart';
import '../../../../shared/widgets/theme_listtile_widget.dart';

class WarningDetailsPage extends StatefulWidget {
  final String warningId;
  final String? from;
  final String? relatedProgramId;
  final String? relatedProgramName;

  const WarningDetailsPage({
    Key? key,
    required this.warningId,
    this.from,
    this.relatedProgramId,
    this.relatedProgramName,
  }) : super(key: key);

  @override
  State<WarningDetailsPage> createState() => _WarningDetailsPageState();
}

class _WarningDetailsPageState extends State<WarningDetailsPage> {
  @override
  void initState() {
    super.initState();

    print('Warning ID: ${widget.warningId}');
    print('Came from: ${widget.from}');
  }

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
                  // Navigator.pop(context);
                  context.goNamed(
                    AppRouteName.root,
                    queryParameters: {'tab': 'warnings'},
                  );
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
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
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
                  ),

                  Positioned(
                    top: 12,
                    left: 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: greenAccent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        'Completed',
                        style: TextStyle(
                          color: Colors.white,
                          // fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  Positioned(
                    bottom: 12,
                    right: 12,
                    child: ElevatedButton(
                      onPressed: () {},
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
                        padding: ResponsiveHelper.padding(
                          context,
                          vertical: 10,
                          horizontal: 20,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: ResponsiveHelper.borderRadius(
                            context,
                            all: 14,
                          ),
                        ),
                      ),
                      child: const Text(
                        'View images',
                        style: TextStyle(
                          // fontSize: 13,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
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
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Action
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue.shade700,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Action',
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
                        Text(
                          'action null',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 14,
                            ),

                            color: Colors.white,
                          ),
                        ),

                        SizedBox(height: 15),
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
                          title: 'Show Specification',
                          titleDetails: 'Specification information',
                          icon: Icons.report,
                          isInverseBold: true,
                        ),

                        dividerConfig(),

                        ThemeListTileWidget(
                          title: 'View Report',
                          titleDetails: 'View work report',
                          icon: Icons.sticky_note_2_rounded,
                          isInverseBold: true,
                        ),

                        SizedBox(height: 10),
                      ],
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
