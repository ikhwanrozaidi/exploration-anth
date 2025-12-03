import 'package:flutter/material.dart';

import '../utils/responsive_helper.dart';

class MonthFilter extends StatefulWidget {
  final Function(String from, String to) onMonthSelected;
  final Color primaryColor;

  const MonthFilter({
    Key? key,
    required this.onMonthSelected,
    required this.primaryColor,
  }) : super(key: key);

  @override
  State<MonthFilter> createState() => _MonthFilterState();
}

class _MonthFilterState extends State<MonthFilter> {
  late PageController _pageController;
  late int selectedMonth;
  late int currentYear;

  final List<String> months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC',
  ];

  @override
  void initState() {
    super.initState();
    currentYear = DateTime.now().year;
    selectedMonth = DateTime.now().month;

    _pageController = PageController(
      initialPage: selectedMonth - 1,
      viewportFraction: 0.2,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectMonth(int month) {
    setState(() {
      selectedMonth = month;
    });

    // Get first day of the month
    final firstDay = DateTime(currentYear, month, 1);

    // Get last day of the month
    final lastDay = DateTime(currentYear, month + 1, 0);

    // Convert to ISO 8601 format with UTC timezone
    final from = DateTime(
      firstDay.year,
      firstDay.month,
      firstDay.day,
    ).toUtc().toIso8601String();
    final to = DateTime(
      lastDay.year,
      lastDay.month,
      lastDay.day,
      23,
      59,
      59,
    ).toUtc().toIso8601String();

    widget.onMonthSelected(from, to);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: PageView.builder(
        controller: _pageController,
        itemCount: 12,
        onPageChanged: (index) {
          _selectMonth(index + 1);
        },
        itemBuilder: (context, index) {
          final month = index + 1;
          final isSelected = month == selectedMonth;

          return GestureDetector(
            onTap: () {
              _selectMonth(month);
              _pageController.animateToPage(
                index,
                duration: Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: isSelected ? widget.primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    months[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: ResponsiveHelper.fontSize(context, base: 16),
                    ),
                  ),
                  Text(
                    currentYear.toString(),
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: ResponsiveHelper.fontSize(context, base: 12),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
