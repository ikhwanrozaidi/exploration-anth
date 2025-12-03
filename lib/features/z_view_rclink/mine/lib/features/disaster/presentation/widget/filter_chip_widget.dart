import 'package:flutter/material.dart';
import 'package:rclink_app/shared/utils/theme.dart';
import '../../../../shared/utils/responsive_helper.dart';

/// Reusable horizontal scrollable filter chips widget
/// Similar to category filters with selectable chips
class FilterChipWidget extends StatefulWidget {
  /// List of filter options
  final List<String> filters;

  /// Initially selected filter (default: first item)
  final String? initialSelected;

  /// Callback when filter is selected
  final Function(String selectedFilter)? onFilterSelected;

  /// Selected chip background color
  final Color selectedColor;

  /// Selected chip text color
  final Color selectedTextColor;

  /// Unselected chip background color
  final Color unselectedColor;

  /// Unselected chip text color
  final Color unselectedTextColor;

  /// Unselected chip border color
  final Color borderColor;

  /// Optional label to show above filters (e.g., "Type")
  final String? label;

  const FilterChipWidget({
    super.key,
    required this.filters,
    this.initialSelected,
    this.onFilterSelected,
    this.selectedColor = primaryColor,
    this.selectedTextColor = Colors.white,
    this.unselectedColor = Colors.white,
    this.unselectedTextColor = primaryColor,
    this.borderColor = primaryColor,
    this.label,
  });

  @override
  State<FilterChipWidget> createState() => _FilterChipWidgetState();
}

class _FilterChipWidgetState extends State<FilterChipWidget> {
  late String _selectedFilter;

  @override
  void initState() {
    super.initState();
    _selectedFilter = widget.initialSelected ?? widget.filters.first;
  }

  void _onChipTap(String filter) {
    if (_selectedFilter != filter) {
      setState(() {
        _selectedFilter = filter;
      });

      if (widget.onFilterSelected != null) {
        widget.onFilterSelected!(filter);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Optional label
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: TextStyle(
              fontSize: ResponsiveHelper.spacing(context, 16),
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: ResponsiveHelper.spacing(context, 12)),
        ],

        // Horizontal scrollable chips
        SizedBox(
          height: ResponsiveHelper.spacing(context, 40),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: widget.filters.length,
            separatorBuilder: (context, index) =>
                SizedBox(width: ResponsiveHelper.spacing(context, 10)),
            itemBuilder: (context, index) {
              final filter = widget.filters[index];
              final isSelected = _selectedFilter == filter;

              return GestureDetector(
                onTap: () => _onChipTap(filter),
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ResponsiveHelper.spacing(context, 20),
                    vertical: ResponsiveHelper.spacing(context, 10),
                  ),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? widget.selectedColor
                        : widget.unselectedColor,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: isSelected
                          ? widget.selectedColor
                          : widget.borderColor,
                      width: 1,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      filter,
                      style: TextStyle(
                        fontSize: ResponsiveHelper.spacing(context, 13),
                        fontWeight: isSelected
                            ? FontWeight.w600
                            : FontWeight.w500,
                        color: isSelected
                            ? widget.selectedTextColor
                            : widget.unselectedTextColor,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
