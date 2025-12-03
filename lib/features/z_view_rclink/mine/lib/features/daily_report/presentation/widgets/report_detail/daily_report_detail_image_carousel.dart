import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../core/domain/entities/file_entity.dart';
import '../../../../../core/utils/cache_managers.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/widgets/image_viewer/image_viewer_page.dart';
import '../shared/page_indicators.dart';

/// Image carousel for daily report detail page
///
/// Displays swipeable carousel of report images with:
/// - Cached network images
/// - Page indicators
/// - Dark gradient overlay
/// - Placeholder when no images
class DailyReportDetailImageCarousel extends StatefulWidget {
  final List<FileEntity>? files;

  const DailyReportDetailImageCarousel({Key? key, this.files})
    : super(key: key);

  @override
  State<DailyReportDetailImageCarousel> createState() =>
      _DailyReportDetailImageCarouselState();
}

class _DailyReportDetailImageCarouselState
    extends State<DailyReportDetailImageCarousel> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filter files for images only
    final imageFiles =
        widget.files?.where((f) => f.mimeType.startsWith('image/')).toList() ??
        [];

    return Stack(
      children: [
        // Image carousel or placeholder
        if (imageFiles.isNotEmpty)
          PageView.builder(
            key: const PageStorageKey('daily_report_detail_carousel'),
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemCount: imageFiles.length,
            itemBuilder: (context, index) {
              final file = imageFiles[index];
              return GestureDetector(
                onTap: () {
                  // Open full-screen image viewer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ImageViewerPage.fromPaths(
                        paths: imageFiles.map((f) => f.s3Url).toList(),
                        initialIndex: index,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
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
                              child: const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Container(
                              color: Colors.grey.shade300,
                              child: Icon(
                                Icons.image_not_supported,
                                size: ResponsiveHelper.iconSize(
                                  context,
                                  base: 25,
                                ),
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
                                Colors.black.withValues(alpha: 0.7),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        else
          Container(
            // margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.grey.shade300,
                child: Icon(
                  Icons.image_not_supported,
                  size: ResponsiveHelper.iconSize(context, base: 25),
                  color: Colors.grey.shade600,
                ),
              ),
            ),
          ),

        // Page indicators (show only when 2+ images)
        if (imageFiles.length > 1)
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: PageIndicators(
              itemCount: imageFiles.length,
              currentIndex: _currentIndex,
              activeColor: Colors.white,
              inactiveColor: Colors.grey.shade400,
            ),
          ),
      ],
    );
  }
}
