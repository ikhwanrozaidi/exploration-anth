import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/domain/entities/file_entity.dart';
import '../../../../core/utils/cache_managers.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/divider_config.dart';
import '../../../../shared/widgets/image_viewer/image_viewer_page.dart';
import '../../../../shared/widgets/theme_listtile_widget.dart';
import '../../../daily_report/presentation/widgets/report_detail/daily_report_detail_quantity_card.dart';
import '../../domain/entities/warning.dart';
import '../bloc/warning_details/warning_details_bloc.dart';
import '../bloc/warning_details/warning_details_event.dart';
import '../bloc/warning_details/warning_details_state.dart';
import '../widgets/expandable_warning_card.dart';
import '../widgets/show_status_selection.dart';
import '../widgets/warning_image_carousel.dart';

class WarningDetailsPage extends StatelessWidget {
  final String warningUID;
  final Warning warningReport;

  const WarningDetailsPage({
    Key? key,
    required this.warningUID,
    required this.warningReport,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WarningDetailsBloc>()
        ..add(WarningDetailsEvent.loadWarningDetails(warningUID: warningUID)),
      child: _WarningDetailsPageContent(
        warningUID: warningUID,
        warningReport: warningReport,
      ),
    );
  }
}

class _WarningDetailsPageContent extends StatelessWidget {
  final String warningUID;
  final Warning warningReport;

  const _WarningDetailsPageContent({
    Key? key,
    required this.warningUID,
    required this.warningReport,
  }) : super(key: key);

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

      body: Padding(
        padding: ResponsiveHelper.padding(
          context,
          left: 20,
          right: 20,
          bottom: 20,
        ),
        child: BlocBuilder<WarningDetailsBloc, WarningDetailsState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Text('Initializing...')),
              loading: () => const Center(child: CircularProgressIndicator()),

              error: (failure, cachedWarning) {
                if (cachedWarning != null) {
                  return Column(
                    children: [
                      Container(
                        color: Colors.red,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          'Error: ${failure.message} (Showing cached data)',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                }

                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${failure.message}'),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () {
                          context.read<WarningDetailsBloc>().add(
                            WarningDetailsEvent.loadWarningDetails(
                              warningUID: warningUID,
                            ),
                          );
                        },
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              },

              loaded: (warning) {
                return RefreshIndicator(
                  onRefresh: () async {
                    context.read<WarningDetailsBloc>().add(
                      WarningDetailsEvent.refreshWarningDetails(
                        warningUID: warningUID,
                      ),
                    );
                  },

                  child: ListView(
                    children: [
                      SizedBox(
                        height: ResponsiveHelper.getHeight(context, 0.02),
                      ),

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
                              child: SizedBox(
                                width: double.infinity,
                                height: ResponsiveHelper.getHeight(
                                  context,
                                  0.28,
                                ),
                                child: _buildImageCarousel(
                                  context,
                                  warningReport,
                                ),
                              ),
                            ),

                            Positioned(
                              bottom: 12,
                              right: 12,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Filter for image files only
                                  final imageFiles =
                                      warningReport.files
                                          ?.where(
                                            (f) =>
                                                f.mimeType.startsWith('image/'),
                                          )
                                          .toList() ??
                                      [];

                                  if (imageFiles.isEmpty) {
                                    CustomSnackBar.show(
                                      context,
                                      'No images available',
                                      type: SnackBarType.info,
                                    );
                                    return;
                                  }

                                  // Open image viewer
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => ImageViewerPage.fromPaths(
                                        paths: imageFiles
                                            .map((f) => f.s3Url)
                                            .toList(),
                                        initialIndex: 0,
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: primaryColor,
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
                                    color: primaryColor,
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

                      ExpandableWarningCard(warning: warning),

                      SizedBox(height: 20),

                      // Overview
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 20,
                        ),
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
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: primaryColor,
                                            borderRadius:
                                                ResponsiveHelper.borderRadius(
                                                  context,
                                                  all: 6,
                                                ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              warningReport.workScope?.code ??
                                                  'R00',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize:
                                                    ResponsiveHelper.fontSize(
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
                                            warningReport.workScope?.name ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontSize:
                                                  ResponsiveHelper.fontSize(
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
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Column(
                                children: [
                                  ThemeListTileWidget(
                                    title: 'Date',
                                    titleDetails:
                                        DateFormat('d MMM yyyy hh:mma').format(
                                          DateTime.parse(
                                            warningReport.createdAt.toString(),
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
                                    titleDetails:
                                        warningReport.createdBy?.fullName ?? '',
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
                            Text(
                              'Location',
                              style: TextStyle(
                                fontSize: ResponsiveHelper.fontSize(
                                  context,
                                  base: 14,
                                ),
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            dividerConfig(),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
                              child: Column(
                                children: [
                                  ThemeListTileWidget(
                                    title: warningReport.road?.stateName ?? '',
                                    titleDetails:
                                        '${warningReport.road?.roadNo} ${warningReport.road?.name}',
                                    icon: Icons.location_pin,
                                    isChevron: false,
                                  ),

                                  dividerConfig(),

                                  ThemeListTileWidget(
                                    title: 'Section',
                                    titleDetails:
                                        warningReport.fromSection ?? '',
                                    icon: Icons.swap_calls,
                                    isChevron: false,
                                  ),

                                  if (warningReport.latitude != null &&
                                      warningReport.longitude != null)
                                    Column(
                                      children: [
                                        dividerConfig(),

                                        Stack(
                                          children: [
                                            Container(
                                              height: 200,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.grey.shade300,
                                                ),
                                              ),
                                              clipBehavior: Clip.antiAlias,
                                              child: GoogleMap(
                                                initialCameraPosition:
                                                    CameraPosition(
                                                      target: LatLng(
                                                        double.parse(
                                                          warningReport
                                                              .latitude!,
                                                        ),
                                                        double.parse(
                                                          warningReport
                                                              .longitude!,
                                                        ),
                                                      ),
                                                      zoom: 14,
                                                    ),
                                                markers: {
                                                  Marker(
                                                    markerId: MarkerId(
                                                      'warning_location',
                                                    ),
                                                    position: LatLng(
                                                      double.parse(
                                                        warningReport.latitude!,
                                                      ),
                                                      double.parse(
                                                        warningReport
                                                            .longitude!,
                                                      ),
                                                    ),
                                                    infoWindow: InfoWindow(
                                                      title:
                                                          warningReport
                                                              .road
                                                              ?.name ??
                                                          'Warning Location',
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
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: ElevatedButton(
                                                  onPressed: () async {
                                                    final lat =
                                                        warningReport.latitude!;
                                                    final lng = warningReport
                                                        .longitude!;
                                                    final url =
                                                        'https://www.google.com/maps/search/?api=1&query=$lat,$lng';

                                                    if (await canLaunchUrl(
                                                      Uri.parse(url),
                                                    )) {
                                                      await launchUrl(
                                                        Uri.parse(url),
                                                        mode: LaunchMode
                                                            .externalApplication,
                                                      );
                                                    }
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.white,
                                                    side: BorderSide(
                                                      color: primaryColor,
                                                      width:
                                                          ResponsiveHelper.adaptive(
                                                            context,
                                                            mobile: 1.0,
                                                            tablet: 1.5,
                                                            desktop: 2.0,
                                                          ),
                                                    ),
                                                    padding:
                                                        ResponsiveHelper.padding(
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
                                                  child: Text(
                                                    'View location',
                                                    style: TextStyle(
                                                      color: primaryColor,
                                                    ),
                                                  ),
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

                      SizedBox(height: 20),

                      // Quantities
                      if (warning.dailyReport?.reportQuantities != null &&
                          warning.dailyReport!.reportQuantities!.isNotEmpty)
                        ...warning.dailyReport!.reportQuantities.map((
                          reportQuantity,
                        ) {
                          return DailyReportDetailQuantityCard(
                            reportQuantity: reportQuantity,
                          );
                        }),

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
                            Text(
                              'Others',
                              style: TextStyle(
                                fontSize: ResponsiveHelper.fontSize(
                                  context,
                                  base: 14,
                                ),
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            dividerConfig(),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10.0,
                              ),
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
                );
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildImageCarousel(BuildContext context, Warning warning) {
    final imageFiles =
        warning.files?.where((f) => f.mimeType.startsWith('image/')).toList() ??
        [];

    if (imageFiles.isEmpty) {
      // No images
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade300,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.image_not_supported,
              size: ResponsiveHelper.iconSize(context, base: 40),
              color: Colors.grey.shade600,
            ),
            SizedBox(height: 8),
            Text(
              'No images available',
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: ResponsiveHelper.fontSize(context, base: 12),
              ),
            ),
          ],
        ),
      );
    }

    // Single image
    if (imageFiles.length == 1) {
      return _buildImageWithGradient(context, imageFiles[0], 0, imageFiles);
    }

    // Multiple images
    return WarningImageCarousel(imageFiles: imageFiles);
  }

  Widget _buildImageWithGradient(
    BuildContext context,
    FileEntity file,
    int index,
    List<FileEntity> allFiles,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ImageViewerPage.fromPaths(
              paths: allFiles.map((f) => f.s3Url).toList(),
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
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
