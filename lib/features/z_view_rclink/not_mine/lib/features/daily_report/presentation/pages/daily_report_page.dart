import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../../road/presentation/helper/road_level.dart';
import '../../../road/presentation/helper/road_selection_result.dart';
import '../../../road/presentation/widgets/road_bottom_sheet.dart';
import '../../../work_scope/presentation/bloc/work_scope_bloc.dart';
import '../../../work_scope/presentation/widgets/work_scope_bottom_sheet.dart';
import '../../presentation/pages/report_creation_page.dart';
import '../../../program/presentation/pages/widgets/month_filter_widget.dart';
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
    return BlocProvider(
      create: (context) => getIt<DailyReportViewBloc>(),
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

class _DailyReportPageContentState extends State<_DailyReportPageContent> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  late ScrollController _scrollController;
  late TextEditingController _searchController;
  Timer? _debounceTimer;
  bool _isScrollingUp = false;
  double _lastScrollPosition = 0.0;
  bool _isLoadingMore = false;

  String? _selectedRoadUID;
  String? _selectedWorkScopeUID;

  void onMonthSelected(int month, int year) {
    setState(() {
      selectedMonth = month;
      selectedYear = year;
    });
    print('Selected month: $month, year: $year');
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _searchController = TextEditingController();

    // Trigger initial load after frame is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final companyState = context.read<CompanyBloc>().state;
      companyState.whenOrNull(
        loaded: (companies, selectedCompany) {
          if (selectedCompany != null) {
            context.read<DailyReportViewBloc>().add(
              DailyReportViewEvent.loadDailyReports(
                companyUID: selectedCompany.uid,
                page: 1,
                limit: 10,
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
    _debounceTimer?.cancel();
    super.dispose();
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
                  (reports, currentPage, hasMore, isLoadingMore, searchQuery) {
                    if (hasMore && !isLoadingMore) {
                      setState(() => _isLoadingMore = true);
                      bloc.add(
                        DailyReportViewEvent.loadMoreDailyReports(
                          companyUID: selectedCompany.uid,
                          page: currentPage + 1,
                          limit: 10,
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
    final companyState = context.read<CompanyBloc>().state;

    companyState.whenOrNull(
      loaded: (companies, selectedCompany) {
        if (selectedCompany != null) {
          context.read<DailyReportViewBloc>().add(
            DailyReportViewEvent.loadDailyReports(
              companyUID: selectedCompany.uid,
              page: 1,
              limit: 10,
              sortOrder: 'asc',
            ),
          );
        }
      },
    );
  }

  void _onDistrictSelected(RoadSelectionResult selectedData) {
    setState(() {
      _selectedRoadUID = selectedData.selectedRoad?.uid;
    });

    _loadDailyReportsWithFilters();
  }

  void _onWorkScopeSelected(Map<String, dynamic> selectedData) {
    setState(() {
      _selectedWorkScopeUID = selectedData['uid'];
    });

    _loadDailyReportsWithFilters();
  }

  void _loadDailyReportsWithFilters() {
    final companyState = context.read<CompanyBloc>().state;

    companyState.whenOrNull(
      loaded: (companies, selectedCompany) {
        if (selectedCompany != null) {
          context.read<DailyReportViewBloc>().add(
            DailyReportViewEvent.loadDailyReports(
              companyUID: selectedCompany.uid,
              page: 1,
              limit: 10,
              roadUid: _selectedRoadUID != null ? null : _selectedRoadUID,
              workScopeUid: _selectedWorkScopeUID != null
                  ? null
                  : _selectedWorkScopeUID,
            ),
          );
        }
      },
    );
  }

  void _onSearchChanged(String query) {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      final companyState = context.read<CompanyBloc>().state;

      companyState.whenOrNull(
        loaded: (companies, selectedCompany) {
          if (selectedCompany != null) {
            context.read<DailyReportViewBloc>().add(
              DailyReportViewEvent.loadDailyReports(
                companyUID: selectedCompany.uid,
                page: 1,
                limit: 10,
                search: query.trim().isEmpty ? null : query.trim(),
              ),
            );
          }
        },
      );
    });
  }

  Future<void> _onRefresh() async {
    context.read<DailyReportViewBloc>().add(
      const DailyReportViewEvent.clearCache(),
    );
    _loadDailyReports();

    // Wait a bit for the refresh to complete
    await Future.delayed(const Duration(milliseconds: 500));
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
                padding: EdgeInsets.symmetric(horizontal: 20),
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
                                padding: const EdgeInsets.all(5),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_rounded,
                                color: primaryColor,
                                size: 25,
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
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          style: IconButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(5),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DailyReportCreationPage(),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.add,
                            color: primaryColor,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
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
                                ) => reports.length,
                            orElse: () => 0,
                          );
                          return DailyReportListHeader(
                            reportCount: reportCount,
                          );
                        },
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
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 15,
                ),
                child: TextField(
                  controller: _searchController,
                  onChanged: _onSearchChanged,
                  decoration: InputDecoration(
                    hintText: 'Search report',
                    prefixIcon: Icon(
                      Icons.search,
                      size: 24,
                      color: Colors.black.withOpacity(0.5),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 11,
                      horizontal: 25,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black.withOpacity(0.5),
                      fontSize: 14,
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DailyReportListFilters(
                  onDistrictTap: () {
                    showRoadSelection(
                      context: context,
                      startFrom: RoadLevel.districts,
                      endAt: RoadLevel.roads,
                      onRoadSelected: (selectedData) {
                        print(
                          'Selected District: ${selectedData.selectedDistrict?.name}',
                        );
                        _onDistrictSelected(selectedData);
                      },
                    );
                  },
                  onContractorTap: () {},
                  onScopeTap: () {
                    final workScopeState = context.read<WorkScopeBloc>().state;

                    showWorkScopeSelection(
                      context: context,
                      state: workScopeState,
                      onScopeSelected: (selectedData) {
                        print('Selected Work Scope: ${selectedData['name']}');
                        print('Work Scope UID: ${selectedData['uid']}');
                        _onWorkScopeSelected(selectedData);
                      },
                    );
                  },
                ),
              ),
            ),
          ),

          CupertinoSliverRefreshControl(onRefresh: _onRefresh),

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
                  child: Center(child: CircularProgressIndicator()),
                ),
                loaded:
                    (
                      reports,
                      currentPage,
                      hasMore,
                      isLoadingMore,
                      searchQuery,
                    ) {
                      if (reports.isEmpty) {
                        return SliverFillRemaining(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.description_outlined,
                                  size: 64,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'No reports found',
                                  style: TextStyle(
                                    fontSize: 18,
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
                                  padding: const EdgeInsets.all(16.0),
                                  child: Center(
                                    child: CircularProgressIndicator(),
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
                                limit: 10,
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
    );
  }
}
