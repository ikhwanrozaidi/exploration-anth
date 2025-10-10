import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rclink_app/features/needrevise_daily_report/presentation/pages/daily_report_detail_page.dart';

import '../../../../../shared/utils/responsive_helper.dart';
import '../../../domain/entities/daily_report_response.dart';

class DailyReportOverviewListWidget extends StatefulWidget {
  final DailyReportResponse report;

  const DailyReportOverviewListWidget({Key? key, required this.report})
    : super(key: key);

  @override
  State<DailyReportOverviewListWidget> createState() =>
      _DailyReportOverviewListWidgetState();
}

class _DailyReportOverviewListWidgetState
    extends State<DailyReportOverviewListWidget> {
  int _currentIndex = 0;
  PageController _pageController = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // _startAutoSlide();
  }

  // void _startAutoSlide() {
  //   _timer = Timer.periodic(Duration(seconds: 3), (timer) {
  //     if (_currentIndex < widget.images.length - 1) {
  //       _currentIndex++;
  //     } else {
  //       _currentIndex = 0;
  //     }

  //     // Check if PageController is attached before animating
  //     if (_pageController.hasClients) {
  //       _pageController.animateToPage(
  //         _currentIndex,
  //         duration: Duration(milliseconds: 1000),
  //         curve: Curves.easeInOut,
  //       );
  //     }
  //   });
  // }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DailyReportDetailPage(report: widget.report),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel Slider
            SizedBox(
              height: 200,
              child: Stack(
                children: [
                  // Image
                  //
                  // PageView.builder(
                  //   controller: _pageController,
                  //   onPageChanged: (index) {
                  //     setState(() {
                  //       _currentIndex = index;
                  //     });
                  //   },
                  //   itemCount: widget.images.length,
                  //   itemBuilder: (context, index) {
                  //     final item = widget.images[index];
                  //     return Container(
                  //       margin: EdgeInsets.symmetric(horizontal: 5),
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(10),
                  //       ),
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(10),

                  //         // Dark gradient overlay
                  //         child: Container(
                  //           width: double.infinity,
                  //           height: double.infinity,
                  //           decoration: BoxDecoration(
                  //             gradient: LinearGradient(
                  //               begin: Alignment.topCenter,
                  //               end: Alignment.bottomCenter,
                  //               colors: [
                  //                 Colors.transparent,
                  //                 Colors.black.withOpacity(0.7),
                  //               ],
                  //             ),
                  //           ),
                  //           child: Image.asset(
                  //             widget.images[index],
                  //             fit: BoxFit.cover,
                  //             errorBuilder: (context, error, stackTrace) {
                  //               return Container(
                  //                 color: Colors.grey.shade300,
                  //                 child: Icon(
                  //                   Icons.image_not_supported,
                  //                   size: 50,
                  //                   color: Colors.grey.shade600,
                  //                 ),
                  //               );
                  //             },
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('assets/images/construction_img.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),

                      // Dark gradient overlay
                      child: Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.7),
                            ],
                          ),
                        ),
                        // child: Container(
                        //   color: Colors.grey.shade300,
                        //   child: Icon(
                        //     Icons.image_not_supported,
                        //     size: 50,
                        //     color: Colors.grey.shade600,
                        //   ),
                        // ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),

                              //Scope Code
                              child: Text(
                                widget.report.workScope!.code.toString(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(right: 5),
                              padding: EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 5,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                              ),
                              child: Text(
                                DateFormat('d MMM').format(
                                  DateTime.parse(
                                    widget.report.createdAt.toString(),
                                  ),
                                ),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Page indicators
                        //
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: List.generate(
                        //     widget.images.length,
                        //     (index) => Container(
                        //       margin: EdgeInsets.symmetric(horizontal: 2),
                        //       width: _currentIndex == index ? 8 : 8,
                        //       height: 8,
                        //       decoration: BoxDecoration(
                        //         color: _currentIndex == index
                        //             ? Colors.white
                        //             : Colors.grey.shade400,
                        //         borderRadius: BorderRadius.circular(4),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 15),

            Text(
              'ROADCARE (M) SDN BHD',
              // '${widget.report.companyID.toString()} --> Company Name',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: ResponsiveHelper.fontSize(context, base: 15),
              ),
            ),

            SizedBox(height: 10),

            Row(
              children: [
                Icon(Icons.location_on, color: Colors.black),

                SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.report.road!.districtName
                            .toString()
                            .toUpperCase(),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 14,
                          ),
                        ),
                      ),
                      Text(
                        '${widget.report.road!.roadNo.toString()} - ${widget.report.road!.name.toString()}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            Row(
              children: [
                Icon(Icons.swap_calls, color: Colors.black),

                SizedBox(width: 12),
                Text(widget.report.toSection.toString()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
