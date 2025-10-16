import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import '../../../../../../../to_view_rclink/not_mine/shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/divider_config.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../../shared/widgets/theme_listtile_widget.dart';
import '../../domain/entities/daily_report_response.dart';
import '../../domain/entities/quantity_value_response.dart';
import 'widget/edit_page/equipment_edit_page.dart';
import 'widget/edit_page/quantity_edit_page.dart';
import 'widget/edit_page/route_edit_page.dart';
import 'widget/edit_page/worker_remark_edit_page.dart';

class DailyReportDetailPage extends StatefulWidget {
  final DailyReportResponse report;

  const DailyReportDetailPage({Key? key, required this.report})
    : super(key: key);

  @override
  State<DailyReportDetailPage> createState() => _DailyReportDetailPageState();
}

class _DailyReportDetailPageState extends State<DailyReportDetailPage> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> _buildQuantityPages(
      List<QuantityValueResponse> quantityValues,
    ) {
      List<Map<String, dynamic>> pages = [];

      // Split quantityValues into pages of 3 items each
      for (int i = 0; i < quantityValues.length; i += 3) {
        Map<String, dynamic> pageData = {};

        // Add up to 3 items per page
        for (int j = 0; j < 3 && (i + j) < quantityValues.length; j++) {
          final qv = quantityValues[i + j];
          pageData[qv.quantityField.name] = {
            'value': qv.value,
            'unit': qv.quantityField.unit,
          };
        }

        pages.add(pageData);
      }

      return pages;
    }

    Widget buildPageContent(Map<String, dynamic> data) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: data.entries.map((entry) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entry.key, // Field name
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    '${entry.value['value']} ${entry.value['unit'] ?? ''}',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      );
    }

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

            // Report Overview
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Colors.yellow.shade100, Colors.yellow.shade200],
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Report Review',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: ResponsiveHelper.fontSize(context, base: 15),
                    ),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        style: IconButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: primaryShade,
                          padding: const EdgeInsets.all(5),
                        ),
                        onPressed: () {
                          print("Like button clicked");
                        },
                        icon: const Icon(
                          Icons.thumb_up,
                          color: primaryColor,
                          size: 25,
                        ),
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        style: IconButton.styleFrom(
                          shape: const CircleBorder(),
                          backgroundColor: Colors.red.shade100,
                          padding: const EdgeInsets.all(5),
                        ),
                        onPressed: () {
                          print("Dislike button clicked");
                        },
                        icon: Icon(
                          Icons.thumb_down_alt_rounded,
                          color: Colors.red.shade400,
                          size: 25,
                        ),
                      ),
                    ],
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
                                    widget.report.workScope!.code,
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
                                  widget.report.workScope!.name.toUpperCase(),
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
                              widget.report.createdAt.toString(),
                            ).toLocal(),
                          ),
                          icon: Icons.calendar_month,
                        ),

                        dividerConfig(),

                        ThemeListTileWidget(
                          title: 'Contractor',
                          titleDetails: widget.report.contractRelationID
                              .toString(),
                          icon: Icons.person,
                          isChevron: false,
                        ),

                        dividerConfig(),

                        ThemeListTileWidget(
                          title: 'Reporter',
                          titleDetails: widget.report.createdByID.toString(),
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
                          title: widget.report.road!.districtName.toString(),
                          titleDetails:
                              '${widget.report.road!.roadNo} - ${widget.report.road!.name}',
                          icon: Icons.location_pin,
                          isChevron: false,
                        ),

                        dividerConfig(),

                        ThemeListTileWidget(
                          title: 'Section',
                          titleDetails: widget.report.fromSection.toString(),
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

            // Scope of work ---- Swipeable
            if (widget.report.reportQuantities!.isNotEmpty)
              ...widget.report.reportQuantities!.map((reportQuantity) {
                final quantityPages = _buildQuantityPages(
                  reportQuantity.quantityValues,
                );
                int currentPage = 0;

                return StatefulBuilder(
                  builder: (context, setState) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5),
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Color.fromARGB(255, 238, 242, 254),
                          ],
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
                              Expanded(
                                child: Text(
                                  reportQuantity.quantityType.name,
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 14,
                                    ),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              if (quantityPages.length > 1)
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    '${currentPage + 1}/${quantityPages.length}',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          dividerConfig(),
                          SizedBox(
                            width: double.infinity,
                            height: 160,
                            child: PageView.builder(
                              onPageChanged: (index) {
                                setState(() {
                                  currentPage = index;
                                });
                              },
                              itemCount: quantityPages.length,
                              itemBuilder: (context, index) {
                                return buildPageContent(quantityPages[index]);
                              },
                            ),
                          ),
                          if (quantityPages.length > 1)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                quantityPages.length,
                                (index) => Container(
                                  margin: EdgeInsets.symmetric(horizontal: 3),
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentPage == index
                                        ? Colors.black87
                                        : Colors.grey.withOpacity(0.4),
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(height: 10),
                        ],
                      ),
                    );
                  },
                );
              }).toList(),

            // Equipment
            if (widget.report.equipments!.isNotEmpty)
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
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 10,
                        children: widget.report.equipments!.map((equipment) {
                          return Container(
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
                              equipment.name,
                              style: TextStyle(
                                fontSize: ResponsiveHelper.fontSize(
                                  context,
                                  base: 13,
                                ),
                                color: primaryColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),
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
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => RouteEditPage(
                                          report: widget.report,
                                        ),
                                      ),
                                    );
                                    break;
                                  case 'Quantity':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => QuantityEditPage(
                                          report: widget.report,
                                        ),
                                      ),
                                    );
                                    break;
                                  case 'Worker & Remark':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            WorkerRemarkEditPage(
                                              report: widget.report,
                                            ),
                                      ),
                                    );
                                    break;
                                  case 'Equipment':
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EquipmentEditPage(
                                          report: widget.report,
                                        ),
                                      ),
                                    );
                                    break;
                                }
                              },
                            );
                          },
                        ),
                        dividerConfig(),

                        ThemeListTileWidget(
                          title: 'Monthly Summary',
                          titleDetails: 'List of overall report',
                          icon: Icons.calendar_month_sharp,
                          isInverseBold: true,
                        ),

                        dividerConfig(),

                        ThemeListTileWidget(
                          title: 'Update History',
                          titleDetails: 'List of overall report',
                          icon: Icons.history,
                          isInverseBold: true,
                        ),

                        dividerConfig(),

                        // Remove Program
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.red.shade100,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.red.shade400,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 20),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Remove Program',
                                        style: TextStyle(
                                          fontSize: ResponsiveHelper.fontSize(
                                            context,
                                            base: 14,
                                          ),
                                          fontWeight: FontWeight.w600,
                                          color: Colors.red.shade400,
                                        ),
                                      ),
                                      Text(
                                        'Delete work program',
                                        style: TextStyle(
                                          fontSize: ResponsiveHelper.fontSize(
                                            context,
                                            base: 12,
                                          ),
                                          color: Colors.red.shade400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Container(
                                padding: const EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Colors.red.shade100,
                                ),
                                // Chevron icon
                                child: Icon(
                                  Icons.chevron_right_rounded,
                                  color: Colors.red.shade400,
                                ),
                              ),
                            ],
                          ),
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
