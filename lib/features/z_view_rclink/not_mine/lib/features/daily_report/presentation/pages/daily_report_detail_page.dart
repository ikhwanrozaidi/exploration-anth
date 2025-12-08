import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../../warnings/data/mapper/warning_response_to_warning_mapper.dart';
import '../../../warnings/presentation/pages/warning_report_review_page.dart';
import '../../../warnings/presentation/widgets/expandable_warning_card.dart';
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
import '../widgets/report_detail/approve_daily_report_dialog.dart';
import '../widgets/report_detail/daily_report_approval_info_card.dart';

/// Wrapper widget that provides BLoC and passes initial report
class DailyReportDetailPage extends StatelessWidget {
  final DailyReport report;

  const DailyReportDetailPage({Key? key, required this.report})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<DailyReportViewBloc>(),
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
              forceRefresh: true,
            ),
          );
        }
      },
    );
  }

  /// Handle pull-to-refresh
  Future<void> _onRefresh() async {
    _fetchFreshData(forceRefresh: true);
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
          approved: (report) {
            // Update current report with approved data
            setState(() => _currentReport = report);

            // Show success message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: const Text('Report approved successfully'),
                backgroundColor: Colors.green.shade600,
              ),
            );

            // Refresh report details to show updated approval info
            _fetchFreshData(forceRefresh: true);
          },
          approvalFailure: (message, report) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Failed to approve: $message'),
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
    print('Warning: ${report.warning}');
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
                  child: Icon(
                    Icons.arrow_back_rounded,
                    color: Colors.black,
                    size: ResponsiveHelper.iconSize(context, base: 20),
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
                    icon: Icon(
                      Icons.notifications_active,
                      color: Colors.white,
                      size: ResponsiveHelper.iconSize(context, base: 20),
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

      // Content with RefreshIndicator
      body: RefreshIndicator(
        onRefresh: onRefresh,
        child: Padding(
          padding: EdgeInsets.only(right: 25.0, left: 25, bottom: 25),
          child: ListView(
            children: [
              SizedBox(height: 25),

              // Image Carousel
              SizedBox(
                height: 250,
                child: DailyReportDetailImageCarousel(files: report.files),
              ),

              const SizedBox(height: 20),

              // Approval Info Card (show if approved)
              DailyReportApprovalInfoCard(report: report),

              // Warning Card or Report Review Card
              if (report.warning != null)
                // Show expandable warning card if warning exists
                ExpandableWarningCard(
                  warning: WarningResponseToWarningMapper.fromWarningResponse(
                    report.warning!,
                  ),
                )
              else if (report.approvedAt == null)
                // Show review card if no warning exists and not yet approved
                DailyReportDetailReviewCard(
                  onLike: () async {
                    // Show approval dialog
                    final reviewComment = await showApproveDailyReportDialog(context);

                    if (reviewComment != null && context.mounted) {
                      // Get company UID
                      final companyState = context.read<CompanyBloc>().state;
                      companyState.whenOrNull(
                        loaded: (companies, selectedCompany) {
                          if (selectedCompany != null) {
                            // Dispatch approve event
                            context.read<DailyReportViewBloc>().add(
                              DailyReportViewEvent.approveDailyReport(
                                companyUID: selectedCompany.uid,
                                dailyReportUID: report.uid,
                                reviewComment: reviewComment,
                              ),
                            );
                          }
                        },
                      );
                    }
                  },
                  onDislike: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          WarningReportReviewPage(report: report),
                    ),
                  ),
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
                report: report,
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
