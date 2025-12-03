import 'package:flutter/material.dart';
import 'package:rclink_app/shared/utils/theme.dart';
import '../utils/responsive_helper.dart';

class YearFilter extends StatefulWidget {
  final Function(String from, String to) onYearSelected;
  final Color primaryColor;
  final int? startYear;
  final int? endYear;

  const YearFilter({
    Key? key,
    required this.onYearSelected,
    required this.primaryColor,
    this.startYear,
    this.endYear,
  }) : super(key: key);

  @override
  State<YearFilter> createState() => _YearFilterState();
}

class _YearFilterState extends State<YearFilter> {
  late PageController _pageController;
  late int selectedYear;
  late List<int> years;
  late int initialYearIndex;

  @override
  void initState() {
    super.initState();
    selectedYear = DateTime.now().year;

    final startYear = widget.startYear ?? (DateTime.now().year - 10);
    final endYear = widget.endYear ?? (DateTime.now().year + 2);

    years = List.generate(
      endYear - startYear + 1,
      (index) => startYear + index,
    );

    // Find index of current year
    initialYearIndex = years.indexOf(selectedYear);
    if (initialYearIndex == -1) {
      initialYearIndex = years.length - 1; // Fallback to last year
    }

    _pageController = PageController(
      initialPage: initialYearIndex,
      viewportFraction: 0.25, // Show ~4 years at a time
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _selectYear(selectedYear);
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectYear(int year) {
    setState(() {
      selectedYear = year;
    });

    final firstDay = DateTime(year, 1, 1);
    final lastDay = DateTime(year, 12, 31);
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

    widget.onYearSelected(from, to);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: PageView.builder(
        controller: _pageController,
        itemCount: years.length,
        onPageChanged: (index) {
          _selectYear(years[index]);
        },
        itemBuilder: (context, index) {
          final year = years[index];
          final isSelected = year == selectedYear;
          final isCurrentYear = year == DateTime.now().year;

          return GestureDetector(
            onTap: () {
              _selectYear(year);
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
                border: Border.all(
                  color: isCurrentYear && !isSelected
                      ? widget.primaryColor.withOpacity(0.5)
                      : Colors.grey.shade300,
                  width: isCurrentYear && !isSelected ? 2 : 1,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      year.toString(),
                      style: TextStyle(
                        color: isSelected
                            ? Colors.white
                            : isCurrentYear
                            ? primaryColor
                            : Colors.black,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w600,
                        fontSize: ResponsiveHelper.fontSize(context, base: 15),
                      ),
                    ),
                    // if (isCurrentYear && !isSelected) ...[
                    //   SizedBox(height: 2),
                    //   Container(
                    //     width: 4,
                    //     height: 4,
                    //     decoration: BoxDecoration(
                    //       color: widget.primaryColor,
                    //       shape: BoxShape.circle,
                    //     ),
                    //   ),
                    // ],
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
