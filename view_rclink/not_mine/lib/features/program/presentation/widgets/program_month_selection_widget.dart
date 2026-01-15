import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';

class ProgramMonthSelectionWidget extends StatefulWidget {
  final List<DateTime>? initialSelectedMonths;
  final Function(List<Map<String, String>>) onMonthsChanged;

  const ProgramMonthSelectionWidget({
    super.key,
    this.initialSelectedMonths,
    required this.onMonthsChanged,
  });

  @override
  State<ProgramMonthSelectionWidget> createState() =>
      _ProgramMonthSelectionWidgetState();
}

class _ProgramMonthSelectionWidgetState
    extends State<ProgramMonthSelectionWidget> {
  List<DateTime> _selectedMonths = [];
  final int _currentYear = DateTime.now().year;
  // final int _nextYear = DateTime.now().year + 1;

  @override
  void initState() {
    super.initState();
    _selectedMonths = widget.initialSelectedMonths ?? [];
  }

  void _toggleMonth(DateTime month) {
    setState(() {
      final existingIndex = _selectedMonths.indexWhere(
        (m) => m.year == month.year && m.month == month.month,
      );

      if (existingIndex != -1) {
        // Already selected, remove it
        _selectedMonths.removeAt(existingIndex);
      } else {
        // Not selected, add it
        _selectedMonths.add(month);
      }

      // Sort by date
      _selectedMonths.sort((a, b) => a.compareTo(b));
    });

    _notifyChanges();
  }

  void _notifyChanges() {
    final periods = _selectedMonths.map((month) {
      final firstDay = DateTime(month.year, month.month, 1);
      final lastDay = DateTime(month.year, month.month + 1, 0);

      return {
        'periodStart': DateFormat('yyyy-MM-dd').format(firstDay),
        'periodEnd': DateFormat('yyyy-MM-dd').format(lastDay),
      };
    }).toList();

    widget.onMonthsChanged(periods);
  }

  bool _isMonthSelected(DateTime month) {
    return _selectedMonths.any(
      (m) => m.year == month.year && m.month == month.month,
    );
  }

  Widget _buildMonthButton(DateTime month) {
    final isSelected = _isMonthSelected(month);
    final monthName = DateFormat('MMM').format(month).toUpperCase();
    final yearText = month.year.toString();

    return GestureDetector(
      onTap: () => _toggleMonth(month),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: ResponsiveHelper.spacing(context, 10),
          horizontal: ResponsiveHelper.spacing(context, 8),
        ),
        decoration: BoxDecoration(
          color: isSelected ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              monthName,
              style: TextStyle(
                fontSize: ResponsiveHelper.fontSize(context, base: 14),
                fontWeight: FontWeight.w700,
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
            // SizedBox(height: 4),
            Text(
              yearText,
              style: TextStyle(
                fontSize: ResponsiveHelper.fontSize(context, base: 10),
                fontWeight: FontWeight.w400,
                color: isSelected ? Colors.white : Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Duration of Work',
          style: TextStyle(
            fontSize: ResponsiveHelper.fontSize(context, base: 16),
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 15),

        // Current Year Months
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 5,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.0,
          children: List.generate(12, (index) {
            final month = DateTime(_currentYear, index + 1, 1);
            return _buildMonthButton(month);
          }),
        ),

        SizedBox(height: 20),

        // Next Year Months
        //
        // GridView.count(
        //   shrinkWrap: true,
        //   physics: NeverScrollableScrollPhysics(),
        //   crossAxisCount: 5,
        //   crossAxisSpacing: 10,
        //   mainAxisSpacing: 10,
        //   childAspectRatio: 1.2,
        //   children: List.generate(12, (index) {
        //     final month = DateTime(_nextYear, index + 1, 1);
        //     return _buildMonthButton(month);
        //   }),
        // ),

        // if (_selectedMonths.isNotEmpty) ...[
        //   SizedBox(height: 15),
        //   Container(
        //     padding: EdgeInsets.all(12),
        //     decoration: BoxDecoration(
        //       color: Colors.blue.shade50,
        //       borderRadius: BorderRadius.circular(8),
        //       border: Border.all(color: Colors.blue.shade200),
        //     ),
        //     child: Row(
        //       children: [
        //         Icon(Icons.info_outline, size: 16, color: primaryColor),
        //         SizedBox(width: 8),
        //         Expanded(
        //           child: Text(
        //             '${_selectedMonths.length} month${_selectedMonths.length > 1 ? 's' : ''} selected',
        //             style: TextStyle(
        //               fontSize: ResponsiveHelper.fontSize(context, base: 12),
        //               color: primaryColor,
        //               fontWeight: FontWeight.w500,
        //             ),
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ],
      ],
    );
  }
}
