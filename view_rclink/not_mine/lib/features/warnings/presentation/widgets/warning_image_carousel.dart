import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/domain/entities/file_entity.dart';
import '../../../../core/utils/cache_managers.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/image_viewer/image_viewer_page.dart';
import '../../../daily_report/presentation/widgets/shared/page_indicators.dart';

class WarningImageCarousel extends StatefulWidget {
  final List<FileEntity> imageFiles;

  const WarningImageCarousel({required this.imageFiles});

  @override
  State<WarningImageCarousel> createState() => WarningImageCarouselState();
}

class WarningImageCarouselState extends State<WarningImageCarousel> {
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
    return Stack(
      children: [
        PageView.builder(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemCount: widget.imageFiles.length,
          itemBuilder: (context, index) {
            final file = widget.imageFiles[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ImageViewerPage.fromPaths(
                      paths: widget.imageFiles.map((f) => f.s3Url).toList(),
                      initialIndex: index,
                    ),
                  ),
                );
              },
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
                          child: CircularProgressIndicator(color: primaryColor),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade300,
                        ),
                        child: Icon(
                          Icons.image_not_supported,
                          size: ResponsiveHelper.iconSize(context, base: 20),
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
            );
          },
        ),

        if (widget.imageFiles.length > 1)
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: PageIndicators(
              itemCount: widget.imageFiles.length,
              currentIndex: _currentIndex,
              activeColor: Colors.white,
              inactiveColor: Colors.grey.shade400,
            ),
          ),
      ],
    );
  }
}
