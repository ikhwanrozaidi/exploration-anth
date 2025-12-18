import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:rclink_app/features/rbac/presentation/widgets/permission_gate.dart';
import 'package:rclink_app/shared/widgets/shimmer_loading.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../../rbac/domain/constants/permission_codes.dart';
import '../../../road/presentation/helper/road_level.dart';
import '../../../road/presentation/helper/road_selection_result.dart';
import '../../../road/presentation/widgets/road_bottom_sheet.dart';
import '../../../work_scope/presentation/bloc/work_scope_bloc.dart';
import '../../../work_scope/presentation/widgets/work_scope_bottom_sheet.dart';
import '../../presentation/pages/report_creation_page.dart';
import '../../../../shared/widgets/month_filter_widget.dart';
import '../bloc/daily_report_view/daily_report_view_bloc.dart';
import '../bloc/daily_report_view/daily_report_view_event.dart';
import '../bloc/daily_report_view/daily_report_view_state.dart';
import '../widgets/report_list/daily_report_list_header.dart';
import '../widgets/report_list/daily_report_list_filters.dart';
import '../widgets/scroll_hide_header_delegate.dart';
import '../widgets/report_list/daily_report_list_item.dart';

class DailyReportPage extends StatelessWidget {
  const DailyReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<DailyReportViewBloc>(),
      child: const _DailyReportPageContent(),
    );
  }
}

class _DailyReportPageContent extends StatefulWidget {
  const _DailyReportPageContent({Key? key}) : super(key: key);

  @override
  State<_DailyReportPageContent> createState() =>
      _DailyReportPageContentState();
}

class _DailyReportPageContentState extends State<_DailyReportPageContent>
    with SingleTickerProviderStateMixin {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  late ScrollController _scrollController;
  late TextEditingController _searchController;
  late TabController _tabController;
  Timer? _debounceTimer;
  bool _isScrollingUp = false;
  double _lastScrollPosition = 0.0;
  bool _isLoadingMore = false;

  String? _selectedRoadUID;
  String? _selectedWorkScopeUID;

  Timer? _monthFilterDebounceTimer;
  String fromDate = DateTime.utc(
    DateTime.now().year,
    DateTime.now().month,
    1,
  ).toIso8601String();
  String? toDate;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _searchController = TextEditingController();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);

    // Trigger initial load after frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Check if widget is still mounted before accessing context
      if (!mounted) return;

      final companyState = context.read<CompanyBloc>().state;
      companyState.whenOrNull(
        loaded: (companies, selectedCompany) {
          if (selectedCompany != null && mounted) {
            context.read<DailyReportViewBloc>().add(
              DailyReportViewEvent.loadDailyReports(
                companyUID: selectedCompany.uid,
                page: 1,
                limit: 50,
                sortOrder: 'desc',
                fromDate:
                    fromDate, // because by default MonthlyFilter already active
              ),
            );
          }
        },
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _tabController.dispose();
    _debounceTimer?.cancel();
    _monthFilterDebounceTimer?.cancel();
    super.dispose();
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      if (!mounted) return;

      final companyState = context.read<CompanyBloc>().state;
      companyState.whenOrNull(
        loaded: (companies, selectedCompany) {
          if (selectedCompany != null && mounted) {
            context.read<DailyReportViewBloc>().add(
              DailyReportViewEvent.changeTab(
                tabIndex: _tabController.index,
                companyUID: selectedCompany.uid,
              ),
            );
          }
        },
      );
    }
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final currentPosition = _scrollController.position.pixels;
    final maxScroll = _scrollController.position.maxScrollExtent;

    if ((currentPosition - _lastScrollPosition).abs() > 5) {
      final isScrollingDown = currentPosition > _lastScrollPosition;
      if (isScrollingDown != _isScrollingUp) {
        setState(() {
          _isScrollingUp = isScrollingDown;
        });
      }
    }

    // Pagination trigger
    if (currentPosition >= (maxScroll - 200.0) && !_isLoadingMore) {
      final companyState = context.read<CompanyBloc>().state;
      companyState.whenOrNull(
        loaded: (companies, selectedCompany) {
          if (selectedCompany != null) {
            final bloc = context.read<DailyReportViewBloc>();
            final state = bloc.state;

            state.whenOrNull(
              loaded:
                  (
                    reports,
                    currentPage,
                    hasMore,
                    isLoadingMore,
                    searchQuery,
                    selectedTabIndex,
                  ) {
                    if (hasMore && !isLoadingMore) {
                      setState(() => _isLoadingMore = true);
                      bloc.add(
                        DailyReportViewEvent.loadMoreDailyReports(
                          companyUID: selectedCompany.uid,
                          page: currentPage + 1,
                          limit: 50,
                          sortOrder: 'desc',
                          search: searchQuery,
                        ),
                      );
                    }
                  },
            );
          }
        },
      );
    }

    _lastScrollPosition = currentPosition;
  }

  void _loadDailyReports() {
    if (!mounted) return;

    final companyState = context.read<CompanyBloc>().state;

    companyState.whenOrNull(
      loaded: (companies, selectedCompany) {
        if (selectedCompany != null && mounted) {
          context.read<DailyReportViewBloc>().add(
            DailyReportViewEvent.loadDailyReports(
              companyUID: selectedCompany.uid,
              page: 1,
              limit: 50,
              sortOrder: 'desc',
            ),
          );
        }
      },
    );
  }

  void onMonthSelected(String from, String to) {
    _monthFilterDebounceTimer?.cancel();

    setState(() {
      fromDate = from;
      toDate = to;
    });

    print('From: $from, To: $to');

    _monthFilterDebounceTimer = Timer(const Duration(milliseconds: 300), () {
      _loadDailyReportsWithFilters();
    });
  }

  void _loadDailyReportsWithFilters() {
    // Add mounted check to prevent accessing context after widget disposal
    if (!mounted) return;

    final companyState = context.read<CompanyBloc>().state;

    companyState.whenOrNull(
      loaded: (companies, selectedCompany) {
        // Check mounted again before accessing context after potential async operations
        if (selectedCompany != null && mounted) {
          context.read<DailyReportViewBloc>().add(
            DailyReportViewEvent.loadDailyReports(
              companyUID: selectedCompany.uid,
              page: 1,
              limit: 50,
              roadUid: _selectedRoadUID,
              workScopeUid: _selectedWorkScopeUID,
              sortOrder: 'desc',
              fromDate: fromDate,
              toDate: toDate,
            ),
          );
        }
      },
    );
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 1000), () {
      // Check if widget is still mounted before accessing context in timer callback
      if (!mounted) return;

      final companyState = context.read<CompanyBloc>().state;

      companyState.whenOrNull(
        loaded: (companies, selectedCompany) {
          if (selectedCompany != null && mounted) {
            context.read<DailyReportViewBloc>().add(
              DailyReportViewEvent.loadDailyReports(
                companyUID: selectedCompany.uid,
                page: 1,
                limit: 50,
                sortOrder: 'desc',
                search: query.trim().isEmpty ? null : query.trim(),
              ),
            );
          }
        },
      );
    });
  }

  Future<void> _onRefresh() async {
    // Check mounted before accessing context
    if (!mounted) return;

    // Respect current tab when refreshing
    final companyState = context.read<CompanyBloc>().state;
    companyState.whenOrNull(
      loaded: (companies, selectedCompany) {
        if (selectedCompany != null && mounted) {
          // Check which tab is active
          if (_tabController.index == 0) {
            // Submitted tab - load regular reports
            _loadDailyReports();
          } else {
            // Draft tab - reload drafts
            context.read<DailyReportViewBloc>().add(
              DailyReportViewEvent.loadDraftReports(
                companyUID: selectedCompany.uid,
              ),
            );
          }
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 135, 167, 247), primaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.0, 0.2],
          ),
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              SizedBox(height: ResponsiveHelper.getHeight(context, 0.02)),

              Padding(
                padding: ResponsiveHelper.padding(context, horizontal: 15),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            IconButton(
                              style: IconButton.styleFrom(
                                shape: const CircleBorder(),
                                backgroundColor: Colors.white,
                                padding: ResponsiveHelper.padding(
                                  context,
                                  all: 10,
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_rounded,
                                color: primaryColor,
                                size: ResponsiveHelper.iconSize(
                                  context,
                                  base: 20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: ResponsiveHelper.spacing(context, 10),
                            ),
                            Text(
                              'Daily Report',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: ResponsiveHelper.fontSize(
                                  context,
                                  base: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        PermissionGate(
                          permission: PermissionCodes.DAILY_REPORT_CREATE,
                          behavior: PermissionBehavior.disable,
                          onAccessDenied: () {
                            CustomSnackBar.show(
                              context,
                              'You do not have permission to create daily reports',
                              type: SnackBarType.info,
                            );
                          },
                          child: IconButton(
                            style: IconButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.white,
                              padding: ResponsiveHelper.padding(
                                context,
                                all: 10,
                              ),
                            ),
                            onPressed: () {
                              // Navigate to creation page with isNewDraft flag
                              // This will trigger draft mode and auto-save
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DailyReportCreationPage(isNewDraft: true),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.add,
                              color: primaryColor,
                              size: ResponsiveHelper.iconSize(
                                context,
                                base: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: ResponsiveHelper.spacing(context, 20)),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      BlocBuilder<DailyReportViewBloc, DailyReportViewState>(
                        builder: (context, state) {
                          final reportCount = state.maybeWhen(
                            loaded:
                                (
                                  reports,
                                  currentPage,
                                  hasMore,
                                  isLoadingMore,
                                  searchQuery,
                                  selectedTabIndex,
                                ) => reports.length,
                            orElse: () => 0,
                          );
                          return Padding(
                            padding: const EdgeInsets.only(
                              top: 20.0,
                              left: 30.0,
                              right: 30.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DailyReportListHeader(reportCount: reportCount),

                                if (_selectedRoadUID != null ||
                                    _selectedWorkScopeUID != null)
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        _selectedRoadUID = null;
                                        _selectedWorkScopeUID = null;
                                      });

                                      _loadDailyReportsWithFilters();
                                    },

                                    style: TextButton.styleFrom(
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      minimumSize: Size(0, 0),
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.red,
                                      side: BorderSide(color: Colors.red),
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 4,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                    child: Text(
                                      'Clear Filter',
                                      style: TextStyle(
                                        color: Colors.red,
                                        // fontSize: 10,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          );
                        },
                      ),
                      // TabBar for Submitted/Draft
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TabBar(
                            controller: _tabController,
                            dividerColor: Colors.transparent,
                            labelColor: Colors.black,
                            indicator: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            labelStyle: TextStyle(
                              fontSize: ResponsiveHelper.spacing(context, 14),
                              fontWeight: FontWeight.w600,
                            ),
                            unselectedLabelColor: Colors.grey[600],
                            unselectedLabelStyle: TextStyle(
                              fontSize: ResponsiveHelper.spacing(context, 14),
                              fontWeight: FontWeight.normal,
                            ),
                            tabs: const [
                              Tab(text: 'Submitted'),
                              Tab(text: 'Draft'),
                            ],
                          ),
                        ),
                      ),
                      _buildBody(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    // Get company UID outside of BLoC state check
    final companyState = context.read<CompanyBloc>().state;
    String? companyUID;

    companyState.whenOrNull(
      loaded: (companies, selectedCompany) {
        companyUID = selectedCompany?.uid;
      },
    );

    if (companyUID == null) {
      return Expanded(child: Center(child: Text('No company selected')));
    }

    // CustomScrollView with slivers for scroll effects
    return Expanded(
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        color: primaryColor,
        child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            // Search bar - always visible (pinned)
            SliverPersistentHeader(
              pinned: true,
              delegate: ScrollHideHeaderDelegate(
                height: 80,
                shouldHide: false, // Always visible
                child: Container(
                  color: Colors.white,
                  padding: ResponsiveHelper.padding(
                    context,
                    vertical: 15,
                    horizontal: 15,
                  ),
                  child: TextField(
                    controller: _searchController,
                    onChanged: _onSearchChanged,
                    decoration: InputDecoration(
                      hintText: 'Search report',
                      prefixIcon: Icon(
                        Icons.search,
                        size: ResponsiveHelper.iconSize(context, base: 20),
                        color: Colors.black.withOpacity(0.5),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: ResponsiveHelper.padding(
                        context,
                        vertical: 11,
                        horizontal: 25,
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.5),
                        fontSize: ResponsiveHelper.fontSize(context, base: 14),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // MonthFilter - hides when scrolling DOWN (showing more), shows when scrolling UP
            SliverPersistentHeader(
              pinned: false,
              floating: true,
              delegate: ScrollHideHeaderDelegate(
                height: 70,
                shouldHide: _isScrollingUp, // Hide when scrolling down
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: ResponsiveHelper.padding(
                        context,
                        horizontal: 15,
                      ),
                      child: MonthFilter(
                        onMonthSelected: onMonthSelected,
                        primaryColor: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // DailyReportFilters - hides when scrolling DOWN, shows when scrolling UP
            SliverPersistentHeader(
              pinned: false,
              floating: true,
              delegate: ScrollHideHeaderDelegate(
                height: 60,
                shouldHide: _isScrollingUp,
                child: Container(
                  color: Colors.white,
                  padding: ResponsiveHelper.padding(context, horizontal: 15),
                  child: DailyReportListFilters(
                    onDistrictTap: () {
                      showRoadSelection(
                        context: context,
                        startFrom: RoadLevel.districts,
                        endAt: RoadLevel.roads,
                        onRoadSelected: (selectedData) {
                          setState(() {
                            _selectedRoadUID = selectedData.selectedRoad?.uid;
                          });

                          _loadDailyReportsWithFilters();
                        },
                      );
                    },
                    onContractorTap: () {},
                    onScopeTap: () {
                      final workScopeState = context
                          .read<WorkScopeBloc>()
                          .state;

                      showWorkScopeSelection(
                        context: context,
                        state: workScopeState,
                        onScopeSelected: (selectedData) {
                          // print('Selected Work Scope: ${selectedData['name']}');
                          // print('Work Scope UID: ${selectedData['uid']}');

                          setState(() {
                            _selectedWorkScopeUID = selectedData['uid'];
                          });

                          _loadDailyReportsWithFilters();
                        },
                      );
                    },
                  ),
                ),
              ),
            ),

            // CupertinoSliverRefreshControl(onRefresh: _onRefresh),

            // Reports list
            BlocConsumer<DailyReportViewBloc, DailyReportViewState>(
              listener: (context, state) {
                state.whenOrNull(
                  loaded:
                      (
                        reports,
                        currentPage,
                        hasMore,
                        isLoadingMore,
                        searchQuery,
                        selectedTabIndex,
                      ) {
                        if (!isLoadingMore && _isLoadingMore) {
                          setState(() => _isLoadingMore = false);
                        }
                      },
                );
              },
              builder: (context, state) {
                return state.when(
                  initial: () => SliverFillRemaining(
                    child: Center(child: Text('Ready to load reports')),
                  ),
                  loading: () => SliverFillRemaining(
                    child: Center(
                      child: Lottie.asset(
                        'assets/lottie/blue_loading.json',
                        width: 200,
                        height: 200,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  loaded:
                      (
                        reports,
                        currentPage,
                        hasMore,
                        isLoadingMore,
                        searchQuery,
                        selectedTabIndex,
                      ) {
                        if (reports.isEmpty) {
                          return SliverFillRemaining(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Lottie.asset(
                                    'assets/lottie/no_record.json',
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'No reports found',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }

                        return SliverPadding(
                          padding: EdgeInsets.all(20),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (context, index) {
                                if (index == reports.length) {
                                  // Loading indicator at the bottom
                                  return Padding(
                                    padding: ResponsiveHelper.padding(
                                      context,
                                      all: 15,
                                    ),
                                    child: Center(
                                      child: Lottie.asset(
                                        'assets/lottie/blue_loading.json',
                                        width: 200,
                                        height: 200,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                  );
                                }

                                return DailyReportListItem(
                                  report: reports[index],
                                );
                              },
                              childCount:
                                  reports.length +
                                  (hasMore || isLoadingMore ? 1 : 0),
                            ),
                          ),
                        );
                      },
                  failure: (message) => SliverFillRemaining(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            message,
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              context.read<DailyReportViewBloc>().add(
                                DailyReportViewEvent.loadDailyReports(
                                  companyUID: companyUID!,
                                  page: 1,
                                  limit: 50,
                                  sortOrder: 'desc',
                                ),
                              );
                            },
                            child: Text('Retry'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  detailLoading: () =>
                      SliverToBoxAdapter(child: SizedBox.shrink()),
                  detailLoaded: (report) =>
                      SliverToBoxAdapter(child: SizedBox.shrink()),
                  detailFailure: (message) =>
                      SliverToBoxAdapter(child: SizedBox.shrink()),
                  approving: (report) =>
                      SliverToBoxAdapter(child: SizedBox.shrink()),
                  approved: (report) =>
                      SliverToBoxAdapter(child: SizedBox.shrink()),
                  approvalFailure: (message, report) =>
                      SliverToBoxAdapter(child: SizedBox.shrink()),
                  roadsLoading: () =>
                      SliverToBoxAdapter(child: SizedBox.shrink()),
                  roadsLoaded:
                      (roads, selectedRoad, currentSection, sectionError) =>
                          SliverToBoxAdapter(child: SizedBox.shrink()),
                  roadsFailure: (message) =>
                      SliverToBoxAdapter(child: SizedBox.shrink()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
