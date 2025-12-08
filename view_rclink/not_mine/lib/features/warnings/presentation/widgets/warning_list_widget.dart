import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:lottie/lottie.dart';
import 'package:rclink_app/shared/utils/theme.dart';

import '../../../../../../../lib/features/z_view_rclink/not_mine/core/utils/cache_managers.dart';
import '../../../../../../../lib/features/z_view_rclink/not_mine/shared/utils/responsive_helper.dart';
import '../../domain/entities/warning.dart';
import '../pages/warning_details_page.dart';

class WarningProgramListWidget extends StatefulWidget {
  final Warning warning;

  const WarningProgramListWidget({required this.warning, Key? key})
    : super(key: key);

  @override
  State<WarningProgramListWidget> createState() =>
      _WarningProgramListWidgetState();
}

class _WarningProgramListWidgetState extends State<WarningProgramListWidget> {
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
  //
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
    final imageFiles =
        // widget.report.files
        //     ?.where((f) => f.mimeType.startsWith('image/'))
        //     .toList() ??
        [];

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WarningDetailsPage(
              warningUID: widget.warning.uid,
              warningReport: widget.warning,
            ),
          ),
        );

        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (context) => WarningDetailsPage()),
        // );
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
              height: 170,
              child: Stack(
                children: [
                  // Image carousel or placeholder
                  if (imageFiles.isNotEmpty)
                    PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemCount: imageFiles.length,
                      itemBuilder: (context, index) {
                        final file = imageFiles[index];
                        print('file: ${file.s3Url}');
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              fit: StackFit.expand,
                              children: [
                                CachedNetworkImage(
                                  imageUrl: file.s3Url,
                                  cacheManager: dailyReportImageCacheManager,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) {
                                    return Container(
                                      color: Colors.grey.shade300,
                                      child: Center(
                                        child: Center(
                                          child: Lottie.asset(
                                            'assets/lottie/blue_loading.json',
                                            width: 200,
                                            height: 200,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  errorWidget: (context, url, error) {
                                    return Container(
                                      color: Colors.grey.shade300,
                                      child: Icon(
                                        Icons.image_not_supported,
                                        size: 50,
                                        color: Colors.grey.shade600,
                                      ),
                                    );
                                  },
                                ),

                                Container(
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
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  else
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
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
                          child: Container(
                            color: Colors.grey.shade300,
                            child: Icon(
                              Icons.image_not_supported,
                              size: 50,
                              color: Colors.grey.shade600,
                            ),
                          ),
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
                                widget.warning.workScope?.code ?? '',
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
                                    widget.warning.createdAt.toString(),
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

                        if (imageFiles.length > 1)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              imageFiles.length,
                              (index) => Container(
                                margin: EdgeInsets.symmetric(horizontal: 2),
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  color: _currentIndex == index
                                      ? Colors.white
                                      : Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(4),
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

            SizedBox(height: 15),

            Text(
              widget.warning.company!.name,
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
                        widget.warning.road!.districtName.toString(),
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 14,
                          ),
                        ),
                      ),
                      Text(
                        '${widget.warning.road!.roadNo} ${widget.warning.road!.name}',

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
                Text(
                  widget.warning.fromSection ?? '',
                  // widget.report.fromSection != null &&
                  //         widget.report.toSection != null
                  //     ? '${double.tryParse(widget.report.fromSection!)?.toStringAsFixed(2) ?? widget.report.fromSection} - ${double.tryParse(widget.report.toSection!)?.toStringAsFixed(2) ?? widget.report.toSection}'
                  //     : widget.report.fromSection != null
                  //     ? (double.tryParse(
                  //             widget.report.fromSection!,
                  //           )?.toStringAsFixed(2) ??
                  //           widget.report.fromSection!)
                  //     : '',
                ),
              ],
            ),

            SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: primaryShade,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.red, width: 1),
                    ),
                    child: Center(
                      child: Text(
                        '${widget.warning.warningItems.length} Warnings',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: greenAccent,
                            ),
                          ),

                          SizedBox(width: 5),

                          Text(
                            '${widget.warning.warningItems.where((item) => item.isCompleted).length} Resolved',
                            style: TextStyle(
                              color: Colors.blueAccent.shade700,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),

                      SizedBox(width: 20),

                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          ),

                          SizedBox(width: 5),

                          Text(
                            '${widget.warning.warningItems.where((item) => !item.isCompleted).length} Pending',
                            style: TextStyle(
                              color: Colors.blueAccent.shade700,
                              fontWeight: FontWeight.w600,
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
    );
  }
}
