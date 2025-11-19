import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:rclink_app/features/daily_report/presentation/pages/daily_report_detail_page.dart';
import 'package:rclink_app/features/daily_report/presentation/widgets/report_creation/draft_page.dart';

import '../../../../../core/di/injection.dart';
import '../../../../../core/utils/cache_managers.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../features/company/presentation/bloc/company_bloc.dart';
import '../../../../../features/company/presentation/bloc/company_state.dart';
import '../../../domain/entities/daily_report.dart';
import '../../bloc/daily_report_create/daily_report_create_bloc.dart';
import '../../bloc/daily_report_create/daily_report_create_event.dart';
import '../../bloc/daily_report_view/daily_report_view_bloc.dart';
import '../../bloc/daily_report_view/daily_report_view_event.dart';

class DailyReportListItem extends StatefulWidget {
  final DailyReport report;

  const DailyReportListItem({Key? key, required this.report}) : super(key: key);

  @override
  State<DailyReportListItem> createState() => _DailyReportListItemState();
}

class _DailyReportListItemState extends State<DailyReportListItem> {
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
    // Filter files for images only
    final imageFiles =
        widget.report.files
            ?.where((f) => f.mimeType.startsWith('image/'))
            .toList() ??
        [];

    return GestureDetector(
      onTap: () {
        // If status is DRAFT, load draft data then navigate to draft editing page
        // Otherwise, navigate to detail page
        if (widget.report.status == 'DRAFT') {
          // Get BLoC instance and load draft data
          final bloc = getIt<DailyReportCreateBloc>();
          bloc.add(LoadExistingDraft(draftUID: widget.report.uid));

          // Navigate to draft page (page will read data from BLoC)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DraftDailyReportPage(),
            ),
          );
        } else {
          // Navigate to detail page and refresh list when returning
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DailyReportDetailPage(report: widget.report),
            ),
          ).then((_) {
            // Reload list after returning from detail page
            // The detail page changes BLoC state to DetailLoaded,
            // so we need to restore the list state
            final companyBloc = getIt<CompanyBloc>();
            final companyState = companyBloc.state;

            if (companyState is CompanyLoaded &&
                companyState.selectedCompany != null) {
              getIt<DailyReportViewBloc>().add(
                DailyReportViewEvent.loadDailyReports(
                  companyUID: companyState.selectedCompany!.uid,
                  page: 1,
                  limit: 50,
                  sortOrder: 'desc',
                ),
              );
            }
          });
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: ResponsiveHelper.padding(
          context,
          vertical: 25,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel Slider
            SizedBox(
              height: ResponsiveHelper.getHeight(context, 0.22),
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
                                        child: CircularProgressIndicator(),
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
                                // Dark gradient overlay
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
                              size: ResponsiveHelper.iconSize(
                                context,
                                base: 20,
                              ),
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
                            // Show work scope code only if available
                            if (widget.report.workScope != null)
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
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 12,
                                    ),
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),

                            // Show DRAFT badge for draft reports
                            if (widget.report.status == 'DRAFT')
                              Container(
                                margin: EdgeInsets.only(left: 5),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.orange.shade100,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text(
                                  'DRAFT',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange.shade800,
                                  ),
                                ),
                              ),

                            Spacer(),

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
                                DateFormat(
                                  'd MMM',
                                ).format(widget.report.createdAt.toLocal()),
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 12,
                                  ),
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),

                        // Page indicators (show only when 2+ images)
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
              widget.report.company?.name ?? 'Company Name',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: ResponsiveHelper.fontSize(context, base: 14),
              ),
            ),

            SizedBox(height: 10),

            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.black,
                  size: ResponsiveHelper.iconSize(context, base: 20),
                ),

                SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.report.road?.districtName ?? '',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 13,
                          ),
                        ),
                      ),
                      Text(
                        widget.report.road != null
                            ? '${widget.report.road!.roadNo.toString()} - ${widget.report.road!.name.toString()}'
                            : 'No location selected',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: widget.report.road == null
                              ? Colors.grey.shade600
                              : Colors.black,
                          fontStyle: widget.report.road == null
                              ? FontStyle.italic
                              : FontStyle.normal,
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),

            Row(
              children: [
                Icon(
                  Icons.swap_calls,
                  color: Colors.black,
                  size: ResponsiveHelper.iconSize(context, base: 20),
                ),

                SizedBox(width: 12),
                Text(
                  widget.report.fromSection != null &&
                          widget.report.toSection != null
                      ? '${double.tryParse(widget.report.fromSection!)?.toStringAsFixed(2) ?? widget.report.fromSection} - ${double.tryParse(widget.report.toSection!)?.toStringAsFixed(2) ?? widget.report.toSection}'
                      : widget.report.fromSection != null
                      ? (double.tryParse(
                              widget.report.fromSection!,
                            )?.toStringAsFixed(2) ??
                            widget.report.fromSection!)
                      : '',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ResponsiveHelper.fontSize(context, base: 13),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
