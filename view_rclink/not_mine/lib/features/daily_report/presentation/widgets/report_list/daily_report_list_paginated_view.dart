import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/daily_report_view/daily_report_view_bloc.dart';
import '../../bloc/daily_report_view/daily_report_view_event.dart';
import '../../bloc/daily_report_view/daily_report_view_state.dart';
import 'daily_report_list_item.dart';

class DailyReportPaginatedList extends StatefulWidget {
  final String companyUID;
  final int pageSize;

  const DailyReportPaginatedList({
    Key? key,
    required this.companyUID,
    this.pageSize = 10,
  }) : super(key: key);

  @override
  State<DailyReportPaginatedList> createState() =>
      _DailyReportPaginatedListState();
}

class _DailyReportPaginatedListState extends State<DailyReportPaginatedList> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    // Trigger initial load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DailyReportViewBloc>().add(
        DailyReportViewEvent.loadDailyReports(
          companyUID: widget.companyUID,
          page: 1,
          limit: widget.pageSize,
          sortOrder: 'desc',
        ),
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isLoadingMore) return;

    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    final delta = 200.0; // Trigger load when 200 pixels from bottom

    if (currentScroll >= (maxScroll - delta)) {
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
                    companyUID: widget.companyUID,
                    page: currentPage + 1,
                    limit: widget.pageSize,
                    search: searchQuery,
                  ),
                );
              }
            },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DailyReportViewBloc, DailyReportViewState>(
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
          initial: () => const Center(child: Text('Ready to load reports')),
          loading: () => const Center(child: CircularProgressIndicator()),
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
                  return Center(
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
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                  );
                }

                return ListView.builder(
                  controller: _scrollController,
                  padding: EdgeInsets.all(20),
                  itemCount:
                      reports.length + (hasMore || isLoadingMore ? 1 : 0),
                  itemBuilder: (context, index) {
                    if (index == reports.length) {
                      // Loading indicator at the bottom
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }

                    return DailyReportListItem(report: reports[index]);
                  },
                );
              },
          failure: (message) => Center(
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
                        companyUID: widget.companyUID,
                        page: 1,
                        limit: widget.pageSize,
                        sortOrder: 'desc',
                      ),
                    );
                  },
                  child: Text('Retry'),
                ),
              ],
            ),
          ),
          detailLoading: () => const SizedBox.shrink(),
          detailLoaded: (report) => const SizedBox.shrink(),
          detailFailure: (message) => const SizedBox.shrink(),
          approving: (report) => const SizedBox.shrink(),
          approved: (report) => const SizedBox.shrink(),
          approvalFailure: (message, report) => const SizedBox.shrink(),
          roadsLoading: () => const Center(child: CircularProgressIndicator()),
          roadsLoaded: (roads, selectedRoad, currentSection, sectionError) =>
              const SizedBox.shrink(),
          roadsFailure: (message) => const SizedBox.shrink(),
        );
      },
    );
  }
}
