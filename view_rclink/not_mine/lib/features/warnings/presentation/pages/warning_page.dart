import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/di/injection.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/custom_tab_widget.dart';
import '../../../../shared/widgets/year_filter_widget.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_state.dart';
import '../../domain/entities/warning.dart';
import '../../domain/entities/warning_type.dart';
import '../bloc/warning_view/warning_bloc.dart';
import '../bloc/warning_view/warning_event.dart';
import '../bloc/warning_view/warning_state.dart';
import '../widgets/view_sitewarning_draft_page.dart';
import '../widgets/warning_list_widget.dart';
import 'warning_creation_page.dart';

class WarningPage extends StatelessWidget {
  const WarningPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WarningBloc>(),
      child: const _WarningPageContent(),
    );
  }
}

class _WarningPageContent extends StatefulWidget {
  const _WarningPageContent({Key? key}) : super(key: key);

  @override
  State<_WarningPageContent> createState() => _WarningPageContentState();
}

class _WarningPageContentState extends State<_WarningPageContent> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  String _currentTab = 'Reports';
  int _currentTabIndex = 1;
  late ScrollController _scrollController;
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);

    // Load warnings on page init
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadWarnings();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _loadWarnings() {
    final companyState = context.read<CompanyBloc>().state;
    if (companyState is! CompanyLoaded ||
        companyState.selectedCompany == null) {
      return;
    }

    final companyUID = companyState.selectedCompany!.uid;
    final warningType = _currentTabIndex == 0
        ? ['REPORT_WARNING']
        : ['SITE_WARNING'];

    context.read<WarningBloc>().add(
      WarningEvent.loadWarnings(
        companyUID: companyUID,
        warningType: warningType,
      ),
    );
  }

  void _onScroll() {
    if (_isScrolledToBottom && !_isLoadingMore) {
      _loadMoreWarnings();
    }
  }

  bool get _isScrolledToBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _loadMoreWarnings() {
    final state = context.read<WarningBloc>().state;
    if (state is! WarningLoaded) return;
    if (!state.hasMore || state.isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    final companyState = context.read<CompanyBloc>().state;
    if (companyState is! CompanyLoaded ||
        companyState.selectedCompany == null) {
      setState(() {
        _isLoadingMore = false;
      });
      return;
    }

    final companyUID = companyState.selectedCompany!.uid;
    final warningType = _currentTabIndex == 0
        ? ['REPORT_WARNING']
        : ['SITE_WARNING'];

    context.read<WarningBloc>().add(
      WarningEvent.loadMoreWarnings(
        companyUID: companyUID,
        nextPage: state.currentPage + 1,
        warningType: warningType,
      ),
    );

    setState(() {
      _isLoadingMore = false;
    });
  }

  Future<void> _onRefresh() async {
    final companyState = context.read<CompanyBloc>().state;
    if (companyState is! CompanyLoaded ||
        companyState.selectedCompany == null) {
      return;
    }

    final companyUID = companyState.selectedCompany!.uid;
    final warningType = _currentTabIndex == 0
        ? ['REPORT_WARNING']
        : ['SITE_WARNING'];

    context.read<WarningBloc>().add(
      WarningEvent.refreshWarnings(
        companyUID: companyUID,
        warningType: warningType,
      ),
    );
  }

  // Helper method to filter warnings by tab
  List<Warning> _filterWarningsByTab(List<Warning> warnings) {
    final targetType = _currentTabIndex == 0
        ? WarningType.reportWarning
        : WarningType.siteWarning;

    return warnings
        .where((warning) => warning.warningType == targetType)
        .toList();
  }

  void onMonthSelected(String from, String to) {
    setState(() {
      final fromDate = DateTime.parse(from);
      selectedMonth = fromDate.month;
      selectedYear = fromDate.year;
    });
    print('From: $from, To: $to');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ResponsiveHelper.getHeight(context, 0.02)),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Warning',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: ResponsiveHelper.fontSize(context, base: 18),
                      ),
                    ),
                    _currentTabIndex == 1
                        ? Row(
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ViewSitewarningDraftPage(),
                                    ),
                                  );
                                },

                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: primaryColor,
                                  side: BorderSide(
                                    color: Colors.amber.shade800,
                                    width: 1.5,
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 5,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                child: Text(
                                  'Draft',
                                  style: TextStyle(
                                    color: Colors.amber.shade800,
                                  ),
                                ),
                              ),

                              SizedBox(width: 5),

                              IconButton(
                                style: IconButton.styleFrom(
                                  shape: const CircleBorder(),
                                  backgroundColor: Colors.white,
                                  padding: ResponsiveHelper.padding(
                                    context,
                                    all: 5,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          WarningCreationPage(isNewDraft: true),
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
                            ],
                          )
                        : SizedBox(height: 48), // measured. not a good approach
                  ],
                ),
              ),

              SizedBox(height: 20),

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
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 15,
                      right: 15,
                      left: 15,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),

                        YearFilter(
                          onYearSelected: (from, to) {
                            print('From: $from, To: $to');
                            // TODO: Implement year filtering with API
                          },
                          primaryColor: primaryColor,
                        ),

                        SizedBox(height: 20),

                        TextButton(
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            backgroundColor: Colors.grey.shade200,
                          ),
                          onPressed: () {
                            CustomSnackBar.show(
                              context,
                              'This feature is coming soon...',
                              type: SnackBarType.comingsoon,
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 11,
                              horizontal: 25,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  size: 30,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Search contractor or district',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.5),
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 20),

                        Expanded(
                          child: CustomTabWidget(
                            tabs: const ['Reports', 'Site Warning'],
                            initialIndex: 1,
                            onTabChanged: (index, tabLabel) {
                              setState(() {
                                _currentTab = tabLabel;
                                _currentTabIndex = index;
                              });
                              print(
                                'Tab changed to: $tabLabel (index: $index)',
                              );
                              _loadWarnings();
                            },
                            tabContents: [
                              _buildWarningsContent(),
                              _buildWarningsContent(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWarningsContent() {
    return BlocBuilder<WarningBloc, WarningState>(
      builder: (context, state) {
        return state.when(
          initial: () => Center(
            child: Center(
              child: Lottie.asset(
                'assets/lottie/blue_loading.json',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),
          loading: () => Center(
            child: Center(
              child: Lottie.asset(
                'assets/lottie/blue_loading.json',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
          ),
          loaded: (warnings, currentPage, hasMore, isLoadingMore) {
            // Filter warnings based on current tab
            final filteredWarnings = _filterWarningsByTab(warnings);

            if (filteredWarnings.isEmpty) {
              return _buildEmptyState();
            }

            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.only(top: 10),
                itemCount: filteredWarnings.length + (hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == filteredWarnings.length) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
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
                  }

                  final warning = filteredWarnings[index];
                  return WarningProgramListWidget(warning: warning);
                },
              ),
            );
          },
          loadingMore: (warnings, currentPage) {
            // Filter warnings based on current tab
            final filteredWarnings = _filterWarningsByTab(warnings);

            return ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.only(top: 10),
              itemCount: filteredWarnings.length + 1,
              itemBuilder: (context, index) {
                if (index == filteredWarnings.length) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
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
                }

                final warning = filteredWarnings[index];
                return WarningProgramListWidget(warning: warning);
              },
            );
          },
          resolvingItem: (warnings, currentPage, hasMore, resolvingItemUID) {
            final filteredWarnings = _filterWarningsByTab(warnings);

            if (filteredWarnings.isEmpty) {
              return _buildEmptyState();
            }

            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.only(top: 10),
                itemCount: filteredWarnings.length + (hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == filteredWarnings.length) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
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
                  }

                  final warning = filteredWarnings[index];
                  return WarningProgramListWidget(warning: warning);
                },
              ),
            );
          },
          itemResolved: (warnings, currentPage, hasMore, resolvedItemUID) {
            final filteredWarnings = _filterWarningsByTab(warnings);

            if (filteredWarnings.isEmpty) {
              return _buildEmptyState();
            }

            return RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.only(top: 10),
                itemCount: filteredWarnings.length + (hasMore ? 1 : 0),
                itemBuilder: (context, index) {
                  if (index == filteredWarnings.length) {
                    return Center(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
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
                  }

                  final warning = filteredWarnings[index];
                  return WarningProgramListWidget(warning: warning);
                },
              ),
            );
          },
          error: (failure, cachedWarnings) {
            if (cachedWarnings != null && cachedWarnings.isNotEmpty) {
              final filteredWarnings = _filterWarningsByTab(cachedWarnings);

              if (filteredWarnings.isEmpty) {
                return _buildEmptyState();
              }

              return RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.only(top: 10),
                  itemCount: filteredWarnings.length,
                  itemBuilder: (context, index) {
                    final warning = filteredWarnings[index];
                    return WarningProgramListWidget(warning: warning);
                  },
                ),
              );
            }

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${failure.message}',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 14),
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.spacing(context, 2)),
                  ElevatedButton(
                    onPressed: _loadWarnings,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor,
                    ),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20),
          Lottie.asset(
            'assets/lottie/no_record.json',
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
          Text(
            'No warnings found',
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
