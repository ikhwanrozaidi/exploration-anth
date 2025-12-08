import 'package:flutter/material.dart';
import '../utils/responsive_helper.dart';

/// Reusable tab widget with customizable tabs and content
/// Extracted from gallery_widget.dart tab design
class CustomTabWidget extends StatefulWidget {
  /// List of tab labels (e.g., ['Reports', 'Programs', 'Inspection'])
  final List<String> tabs;

  /// List of tab content widgets corresponding to each tab
  /// Not required if tabOnly is true
  final List<Widget>? tabContents;

  /// Optional initial tab index (default: 0)
  final int initialIndex;

  /// Optional callback when tab changes
  final Function(int index, String tabLabel)? onTabChanged;

  /// If true, only shows tabs without content below (default: false)
  final bool tabOnly;

  const CustomTabWidget({
    super.key,
    required this.tabs,
    this.tabContents,
    this.initialIndex = 0,
    this.onTabChanged,
    this.tabOnly = false,
  }) : assert(
         tabOnly || (tabContents != null && tabs.length == tabContents.length),
         'When tabOnly is false, tabContents must be provided and match tabs length',
       );

  @override
  State<CustomTabWidget> createState() => _CustomTabWidgetState();
}

class _CustomTabWidgetState extends State<CustomTabWidget>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.tabs.length,
      vsync: this,
      initialIndex: widget.initialIndex,
    );

    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        _handleTabChange(_tabController.index);
      }
    });
  }

  void _handleTabChange(int newIndex) {
    if (widget.onTabChanged != null) {
      widget.onTabChanged!(newIndex, widget.tabs[newIndex]);
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Tab bar only mode
    if (widget.tabOnly) {
      return Container(
        padding: EdgeInsets.all(5),
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
          tabs: widget.tabs.map((label) => Tab(text: label)).toList(),
        ),
      );
    }

    // Full mode with tabs and content
    return Column(
      children: [
        // Tab Bar with custom styling
        Container(
          padding: EdgeInsets.all(5),
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
            tabs: widget.tabs.map((label) => Tab(text: label)).toList(),
          ),
        ),

        SizedBox(height: 16),

        // Tab Content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: widget.tabContents!,
          ),
        ),
      ],
    );
  }
}
