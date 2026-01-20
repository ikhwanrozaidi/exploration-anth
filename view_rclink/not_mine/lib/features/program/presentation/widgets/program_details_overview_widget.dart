import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:rclink_app/features/program/presentation/pages/view_report_program_page.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/divider_config.dart';
import '../../../../shared/widgets/theme_listtile_widget.dart';
import '../../../daily_report/presentation/widgets/report_detail/daily_report_detail_quantity_card.dart';
import '../../domain/entities/program_entity.dart';
import 'workday_bottomsheet.dart';

class ProgramDetailsOverviewWidget extends StatefulWidget {
  final Program program;

  const ProgramDetailsOverviewWidget({super.key, required this.program});

  @override
  State<ProgramDetailsOverviewWidget> createState() =>
      _ProgramDetailsOverviewWidgetState();
}

class _ProgramDetailsOverviewWidgetState
    extends State<ProgramDetailsOverviewWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Workday
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Workday',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  GestureDetector(
                    onTap: () {
                      // Filter by months
                      //
                      // showWorkdayDetail(
                      //   context: context,
                      //   date: '2025-09-22T20:01:55.752Z',
                      //   scopeCode: 'code',
                      //   onViewReport: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => ViewReportProgramPage(),
                      //       ),
                      //     );
                      //   },
                      // );
                    },

                    child: Container(
                      padding: ResponsiveHelper.padding(
                        context,
                        vertical: 5,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: primaryColor,
                          width: ResponsiveHelper.adaptive(
                            context,
                            mobile: 1.0,
                            tablet: 1.5,
                            desktop: 2.0,
                          ),
                        ),
                      ),
                      child: Text(
                        'Add Report',
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 12,
                          ),
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              dividerConfig(),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    //REPLACE: with the date of the dailyReport createdAt
                    //
                    showWorkdayDetail(
                      context: context,
                      date: '2025-09-22T20:01:55.752Z',
                      scopeCode: 'code',
                      onViewReport: () {
                        print('❌ Should redirect to DalyReportPage Details');

                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ViewReportProgramPage(),
                        //   ),
                        // );
                      },
                    );
                  },

                  child: Container(
                    padding: ResponsiveHelper.padding(
                      context,
                      vertical: 5,
                      horizontal: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 215, 241, 255),

                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      DateFormat('d MMM').format(
                        DateTime.parse('2025-09-22T20:01:55.752Z').toLocal(),
                      ),
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 12),
                        color: Color.fromARGB(255, 22, 177, 255),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: ResponsiveHelper.spacing(context, 20)),

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
                padding: ResponsiveHelper.padding(context, horizontal: 10),
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
                                widget.program.workScope?.code ??
                                    'R00', //REPLACE: workScope.code
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
                              widget.program.workScope?.name ??
                                  'Work Scope', //REPLACE: workScope.name
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
                          widget.program.createdAt ??
                              '2025-09-22T20:01:55.752Z',
                        ).toLocal(), //REPLACE: createdAt
                      ),
                      icon: Icons.calendar_month,
                      isChevron: false,
                    ),

                    dividerConfig(),

                    ThemeListTileWidget(
                      title: 'Contractor',
                      titleDetails:
                          widget
                              .program
                              .contractRelation
                              ?.contractorCompany
                              ?.name ??
                          'Company',
                      icon: Icons.person,
                      isChevron: false,
                    ),

                    dividerConfig(),

                    ThemeListTileWidget(
                      title: 'Reporter',
                      titleDetails:
                          '${widget.program.createdBy?.firstName} ${widget.program.createdBy?.lastName}',
                      icon: Icons.person_pin,
                      isChevron: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: ResponsiveHelper.spacing(context, 20)),

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
                      title: 'districtName',
                      titleDetails:
                          widget.program.road?.district?.name ?? 'District',
                      icon: Icons.location_pin,
                      isChevron: false,
                    ),

                    dividerConfig(),

                    ThemeListTileWidget(
                      title: 'Section',
                      titleDetails:
                          '${widget.program.fromSection} - ${widget.program.toSection}',
                      icon: Icons.swap_calls,
                      isChevron: false,
                    ),

                    if (widget.program.latitude != null &&
                        widget.program.longitude != null)
                      Column(
                        children: [
                          dividerConfig(),

                          Stack(
                            children: [
                              Container(
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                      double.parse(widget.program.latitude!),
                                      double.parse(widget.program.longitude!),
                                    ),
                                    zoom: 14,
                                  ),
                                  markers: {
                                    Marker(
                                      markerId: MarkerId('program_location'),
                                      position: LatLng(
                                        double.parse(widget.program.latitude!),
                                        double.parse(widget.program.longitude!),
                                      ),
                                      infoWindow: InfoWindow(
                                        title: widget.program.name,
                                      ),
                                    ),
                                  },
                                  zoomControlsEnabled: false,
                                  myLocationButtonEnabled: false,
                                ),
                              ),

                              Positioned.fill(
                                bottom: 10,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      final lat = widget.program.latitude!;
                                      final lng = widget.program.longitude!;
                                      final url =
                                          'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
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
                                        borderRadius:
                                            ResponsiveHelper.borderRadius(
                                              context,
                                              all: 14,
                                            ),
                                      ),
                                    ),
                                    child: Text('View location'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: ResponsiveHelper.spacing(context, 20)),

        // Work Description
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
                'Work Description',
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
                      title: 'Description',
                      titleDetails:
                          widget.program.description ?? 'No Description',
                      icon: Icons.work_outline_rounded,
                      isChevron: false,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        // if (widget.program.quantities != null &&

        //     widget.program.quantities!.isNotEmpty)
        //   ...widget.program.quantities!.map((reportQuantity) {
        //     return DailyReportDetailQuantityCard(
        //       reportQuantity: reportQuantity,
        //     );
        //   }),
      ],
    );
  }
}
