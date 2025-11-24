import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/divider_config.dart';
import '../../../../shared/widgets/theme_listtile_widget.dart';
import '../../../daily_report/presentation/widgets/report_detail/daily_report_detail_equipment_card.dart';
import '../../../daily_report/presentation/widgets/report_detail/daily_report_detail_quantity_card.dart';
import '../widgets/show_status_selection.dart';

class WarningDetailsPage extends StatefulWidget {
  const WarningDetailsPage({Key? key}) : super(key: key);

  @override
  State<WarningDetailsPage> createState() => _WarningDetailsPageState();
}

class _WarningDetailsPageState extends State<WarningDetailsPage> {
  bool isExpanded = false;

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
                    size: ResponsiveHelper.iconSize(context, base: 20),
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
                    icon: Icon(
                      Icons.notifications_active,
                      color: Colors.white,
                      size: ResponsiveHelper.iconSize(context, base: 20),
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
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                      size: ResponsiveHelper.iconSize(context, base: 20),
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
        padding: ResponsiveHelper.padding(
          context,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: ListView(
          children: [
            SizedBox(height: ResponsiveHelper.getHeight(context, 0.02)),

            Container(
              width: double.infinity,
              height: ResponsiveHelper.getHeight(context, 0.28),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      width: double.infinity,
                      height: ResponsiveHelper.getHeight(context, 0.28),
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
                              size: ResponsiveHelper.iconSize(
                                context,
                                base: 20,
                              ),
                              color: Colors.grey.shade600,
                            ),
                          );
                        },
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
                      child: Text(
                        'View images',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 13,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: ResponsiveHelper.spacing(context, 20)),

            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              padding: const EdgeInsets.all(20),
              height: isExpanded
                  ? ResponsiveHelper.getHeight(context, 0.5)
                  : ResponsiveHelper.getHeight(context, 0.08),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Colors.white, Color.fromARGB(255, 238, 242, 254)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isExpanded = !isExpanded;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.red,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'null Warnings',
                              style: TextStyle(
                                fontSize: ResponsiveHelper.fontSize(
                                  context,
                                  base: 14,
                                ),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        AnimatedRotation(
                          turns: isExpanded ? 0.5 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color.fromARGB(255, 214, 226, 255),
                            ),
                            child: Icon(
                              Icons.expand_more,
                              color: Theme.of(context).primaryColor,
                              size: ResponsiveHelper.iconSize(
                                context,
                                base: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Expanded Content
                  if (isExpanded) ...[
                    dividerConfig(),

                    // Expanded(
                    //   child: ListView.separated(
                    //     itemCount: widget.warnings.length,
                    //     separatorBuilder: (context, index) =>
                    //         const SizedBox(height: 12),
                    //     itemBuilder: (context, index) {
                    //       final warning = widget.warnings[index];
                    //       return WarningCard(warning: warning);
                    //     },
                    //   ),
                    // ),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Warning',
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 14,
                                  ),
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                'Resolve by: null Date',
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

                          Divider(
                            height: ResponsiveHelper.spacing(context, 25),
                            thickness: 0.5,
                            color: Colors.white,
                          ),

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

                                SizedBox(
                                  height: ResponsiveHelper.spacing(context, 15),
                                ),

                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showStatusSelection(
                                        context: context,
                                        currentStatus: 'No Action Yet',
                                        onStatusSelected: (selectedStatus) {
                                          print(
                                            'Selected status: $selectedStatus',
                                          );

                                          // setState(() {
                                          //   _currentStatus = selectedStatus;
                                          // });

                                          // context.read<WarningBloc>().add(
                                          //   UpdateWarningStatus(status: selectedStatus),
                                          // );
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      padding: ResponsiveHelper.padding(
                                        context,
                                        vertical: 10,
                                        horizontal: 10,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      elevation: 0,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Text(
                                              'null Status',
                                              style: TextStyle(
                                                color: Colors.redAccent,
                                                fontSize:
                                                    ResponsiveHelper.fontSize(
                                                      context,
                                                      base: 13,
                                                    ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Icon(Icons.expand_more),
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
                  ],
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
                                  borderRadius: ResponsiveHelper.borderRadius(
                                    context,
                                    all: 6,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    'code',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: ResponsiveHelper.fontSize(
                                        context,
                                        base: 15,
                                      ),
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

            // // Quantities
            // if (report.reportQuantities != null &&
            //     report.reportQuantities!.isNotEmpty)
            //   ...report.reportQuantities!.map((reportQuantity) {
            //     return DailyReportDetailQuantityCard(
            //       reportQuantity: reportQuantity,
            //     );
            //   }),

            // SizedBox(height: 20),

            // // Equipments
            // DailyReportDetailEquipmentCard(equipments: report.equipments ?? []),

            // SizedBox(height: 20),

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
                          title: 'Monthly Summary',
                          titleDetails: 'List of overall report',
                          icon: Icons.calendar_month,
                          isInverseBold: true,
                        ),

                        dividerConfig(),

                        ThemeListTileWidget(
                          title: 'Update History',
                          titleDetails: 'List of changes',
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
          ],
        ),
      ),
    );
  }
}
