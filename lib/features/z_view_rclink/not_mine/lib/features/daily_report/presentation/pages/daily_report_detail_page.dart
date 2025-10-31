import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/utils/theme.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../domain/entities/daily_report.dart';
import '../bloc/daily_report_view/daily_report_view_bloc.dart';
import '../bloc/daily_report_view/daily_report_view_event.dart';
import '../bloc/daily_report_view/daily_report_view_state.dart';
import '../widgets/report_detail/daily_report_detail_actions_card.dart';
import '../widgets/report_detail/daily_report_detail_company_card.dart';
import '../widgets/report_detail/daily_report_detail_equipment_card.dart';
import '../widgets/report_detail/daily_report_detail_image_carousel.dart';
import '../widgets/report_detail/daily_report_detail_location_card.dart';
import '../widgets/report_detail/daily_report_detail_overview_card.dart';
import '../widgets/report_detail/daily_report_detail_quantity_card.dart';
import '../widgets/report_detail/daily_report_detail_review_card.dart';

/// Wrapper widget that provides BLoC and passes initial report
class DailyReportDetailPage extends StatelessWidget {
  final DailyReport report;

  const DailyReportDetailPage({Key? key, required this.report})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DailyReportViewBloc>(),
      child: _DailyReportDetailPageContent(initialReport: report),
    );
  }
}

/// Content widget that manages state and displays report
class _DailyReportDetailPageContent extends StatefulWidget {
  final DailyReport initialReport;

  const _DailyReportDetailPageContent({Key? key, required this.initialReport})
    : super(key: key);

  @override
  State<_DailyReportDetailPageContent> createState() =>
      _DailyReportDetailPageContentState();
}

class _DailyReportDetailPageContentState
    extends State<_DailyReportDetailPageContent> {
  late DailyReport _currentReport;
  bool _isFetchingFreshData = false;

  @override
  void initState() {
    super.initState();
    // Start with passed report for instant display
    _currentReport = widget.initialReport;

    // Fetch fresh data in background
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fetchFreshData();
    });
  }

  /// Fetch fresh data from API/cache in background
  void _fetchFreshData({bool forceRefresh = false}) {
    final companyState = context.read<CompanyBloc>().state;
    companyState.whenOrNull(
      loaded: (companies, selectedCompany) {
        if (selectedCompany != null) {
          setState(() => _isFetchingFreshData = true);
          context.read<DailyReportViewBloc>().add(
            DailyReportViewEvent.loadDailyReportById(
              companyUID: selectedCompany.uid,
              dailyReportUID: _currentReport.uid,
              forceRefresh: forceRefresh,
            ),
          );
        }
      },
    );
  }

  /// Handle pull-to-refresh
  Future<void> _onRefresh() async {
    _fetchFreshData(forceRefresh: true);
    // Wait a bit for the request to complete
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<DailyReportViewBloc, DailyReportViewState>(
      listener: (context, state) {
        state.maybeWhen(
          detailLoaded: (report) {
            setState(() {
              _currentReport = report;
              _isFetchingFreshData = false;
            });
          },
          detailFailure: (message) {
            setState(() => _isFetchingFreshData = false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to refresh: $message'),
                backgroundColor: Colors.red.shade400,
              ),
            );
          },
          orElse: () {},
        );
      },
      child: _DailyReportDetailPageView(
        report: _currentReport,
        isLoading: _isFetchingFreshData,
        onRefresh: _onRefresh,
      ),
    );
  }
}

/// View widget that displays the report (pure UI)
class _DailyReportDetailPageView extends StatelessWidget {
  final DailyReport report;
  final bool isLoading;
  final Future<void> Function() onRefresh;

  const _DailyReportDetailPageView({
    Key? key,
    required this.report,
    required this.isLoading,
    required this.onRefresh,
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
              // Back Button
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.1),
                        blurRadius: 5,
                        offset: const Offset(-2, 6),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: 25,
                  ),
                ),
              ),

              // Action Buttons Row
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Loading indicator
                  if (isLoading)
                    const Padding(
                      padding: EdgeInsets.only(right: 8.0),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            primaryColor,
                          ),
                        ),
                      ),
                    ),

                  // Notification Button
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

                  const SizedBox(width: 8),

                  // Share Button
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

      // Content with RefreshIndicator
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: ListView(
            children: [
              // Image Carousel
              SizedBox(
                height: 250,
                child: DailyReportDetailImageCarousel(files: report.files),
              ),

              const SizedBox(height: 20),

              // Report Review Card
              DailyReportDetailReviewCard(
                onLike: () => print("Like button clicked"),
                onDislike: () => print("Dislike button clicked"),
              ),

              const SizedBox(height: 20),

              // Overview Card
              DailyReportDetailOverviewCard(report: report),

              const SizedBox(height: 20),

              // Location Card
              DailyReportDetailLocationCard(report: report),

              const SizedBox(height: 20),

              // Equipment Card
              DailyReportDetailEquipmentCard(
                equipments: report.equipments ?? [],
              ),

              const SizedBox(height: 20),

              // Quantity Cards
              if (report.reportQuantities != null &&
                  report.reportQuantities!.isNotEmpty)
                ...report.reportQuantities!.map((reportQuantity) {
                  return DailyReportDetailQuantityCard(
                    reportQuantity: reportQuantity,
                  );
                }),

              // Actions Card ("Others")
              DailyReportDetailActionsCard(
                report: report,
                onMonthlySummary: null,
                onUpdateHistory: null,
                onRemoveProgram: () {},
              ),

              const SizedBox(height: 20),

              // Company Card
              DailyReportDetailCompanyCard(
                onViewAllReports: () {
                  // Navigation to all reports will be implemented
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
