import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';

class SelectDateProgramPage extends StatefulWidget {
  final DateTime? initialStartDate;
  final DateTime? initialEndDate;

  const SelectDateProgramPage({
    super.key,
    this.initialStartDate,
    this.initialEndDate,
  });

  @override
  State<SelectDateProgramPage> createState() => _SelectDateProgramPageState();
}

class _SelectDateProgramPageState extends State<SelectDateProgramPage> {
  DateTime? _startDate;
  DateTime? _endDate;
  int _currentYear = DateTime.now().year;
  bool _isSelectingEndDate = false;

  final ScrollController _yearScrollController = ScrollController();
  final PageController _yearPageController = PageController(
    initialPage: DateTime.now().year - 2020,
  );

  @override
  void initState() {
    super.initState();
    _startDate = widget.initialStartDate;
    _endDate = widget.initialEndDate;
    _currentYear = _startDate?.year ?? DateTime.now().year;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _yearPageController.jumpToPage(_currentYear - 2020);
    });
  }

  @override
  void dispose() {
    _yearScrollController.dispose();
    _yearPageController.dispose();
    super.dispose();
  }

  void _handleDateTap(DateTime date) {
    setState(() {
      if (!_isSelectingEndDate) {
        // Selecting start date
        _startDate = date;
        _endDate = null;
        _isSelectingEndDate = true;
      } else {
        // Selecting end date
        if (date.isBefore(_startDate!)) {
          // If tapped date is before start, swap them
          _endDate = _startDate;
          _startDate = date;
        } else {
          _endDate = date;
        }
        _isSelectingEndDate = false;
      }
    });
  }

  void _handleYearChange(int year) {
    setState(() {
      _currentYear = year;
    });
  }

  List<Map<String, String>> _generateMonthlyPeriods() {
    if (_startDate == null || _endDate == null) return [];

    List<Map<String, String>> periods = [];
    DateTime currentStart = DateTime(
      _startDate!.year,
      _startDate!.month,
      _startDate!.day,
    );

    while (currentStart.isBefore(_endDate!) ||
        currentStart.isAtSameMomentAs(_endDate!)) {
      // Calculate end of current month
      DateTime endOfMonth = DateTime(
        currentStart.year,
        currentStart.month + 1,
        0,
      );

      // Use the earlier of: end of month OR final end date
      DateTime currentEnd = endOfMonth.isBefore(_endDate!)
          ? endOfMonth
          : _endDate!;

      periods.add({
        'periodStart': DateFormat('yyyy-MM-dd').format(currentStart),
        'periodEnd': DateFormat('yyyy-MM-dd').format(currentEnd),
      });

      // Move to first day of next month
      currentStart = DateTime(currentStart.year, currentStart.month + 1, 1);
    }

    return periods;
  }

  void _handleAdd() {
    if (_startDate == null || _endDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select both start and end dates')),
      );
      return;
    }

    final periods = _generateMonthlyPeriods();

    Navigator.pop(context, {
      'startDate': _startDate,
      'endDate': _endDate,
      'periods': periods,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
              // Header
              Padding(
                padding: ResponsiveHelper.padding(context, all: 20),
                child: Row(
                  children: [
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
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select Range',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 18,
                              ),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            _startDate != null && _endDate != null
                                ? '${DateFormat('d MMM').format(_startDate!)} - ${DateFormat('d MMM yyyy').format(_endDate!)}'
                                : _startDate != null
                                ? '${DateFormat('d MMM yyyy').format(_startDate!)} - End Date'
                                : 'Select dates',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Calendar container
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),

                      // Year navigation
                      //
                      // Container(
                      //   height: 50,
                      //   child: PageView.builder(
                      //     controller: _yearPageController,
                      //     onPageChanged: (index) {
                      //       _handleYearChange(2020 + index);
                      //     },
                      //     itemCount: 20,
                      //     itemBuilder: (context, index) {
                      //       final year = 2020 + index;
                      //       return Center(
                      //         child: Row(
                      //           mainAxisAlignment: MainAxisAlignment.center,
                      //           children: [
                      //             IconButton(
                      //               onPressed: () {
                      //                 _yearPageController.previousPage(
                      //                   duration: Duration(milliseconds: 300),
                      //                   curve: Curves.easeInOut,
                      //                 );
                      //               },
                      //               icon: Icon(Icons.chevron_left),
                      //             ),
                      //             Text(
                      //               '$year',
                      //               style: TextStyle(
                      //                 fontSize: ResponsiveHelper.fontSize(
                      //                   context,
                      //                   base: 20,
                      //                 ),
                      //                 fontWeight: FontWeight.w600,
                      //               ),
                      //             ),
                      //             IconButton(
                      //               onPressed: () {
                      //                 _yearPageController.nextPage(
                      //                   duration: Duration(milliseconds: 300),
                      //                   curve: Curves.easeInOut,
                      //                 );
                      //               },
                      //               icon: Icon(Icons.chevron_right),
                      //             ),
                      //           ],
                      //         ),
                      //       );
                      //     },
                      //   ),
                      // ),

                      // Divider(height: 1),

                      // Scrollable months (vertical)
                      Expanded(
                        child: ListView.separated(
                          controller: _yearScrollController,
                          padding: ResponsiveHelper.padding(
                            context,
                            vertical: 20,
                          ),
                          itemCount: 12,
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 30),
                          itemBuilder: (context, index) {
                            final month = index + 1;
                            return _buildCalendar(
                              DateTime(_currentYear, month, 1),
                            );
                          },
                        ),
                      ),

                      // Add button
                      Padding(
                        padding: ResponsiveHelper.padding(
                          context,
                          horizontal: 20,
                          bottom: 40,
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: _handleAdd,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              disabledBackgroundColor: Colors.grey[300],
                              padding: ResponsiveHelper.padding(
                                context,
                                vertical: 10,
                                horizontal: 20,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: ResponsiveHelper.borderRadius(
                                  context,
                                  all: 14,
                                ),
                              ),
                              elevation: ResponsiveHelper.adaptive(
                                context,
                                mobile: 1,
                                tablet: 2,
                                desktop: 3,
                              ),
                            ),
                            child: Text(
                              'Add',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: ResponsiveHelper.fontSize(
                                  context,
                                  base: 16,
                                ),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
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

  Widget _buildCalendar(DateTime month) {
    final daysInMonth = DateTime(month.year, month.month + 1, 0).day;
    final firstDayOfMonth = DateTime(month.year, month.month, 1);
    final firstWeekday = firstDayOfMonth.weekday % 7; // 0 = Sunday

    return Padding(
      padding: ResponsiveHelper.padding(context, horizontal: 20),
      child: Column(
        children: [
          // Month header
          Padding(
            padding: ResponsiveHelper.padding(context, bottom: 16),
            child: Text(
              DateFormat('MMMM yyyy').format(month),
              style: TextStyle(
                fontSize: ResponsiveHelper.fontSize(context, base: 18),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          SizedBox(height: 10),

          // Weekday headers
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'].map((day) {
              return SizedBox(
                width: 40,
                child: Center(
                  child: Text(
                    day,
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 12),
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),

          SizedBox(height: 12),

          // Calendar grid
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: firstWeekday + daysInMonth,
            itemBuilder: (context, index) {
              if (index < firstWeekday) {
                // Empty cell before month starts
                return SizedBox.shrink();
              }

              final day = index - firstWeekday + 1;
              final date = DateTime(month.year, month.month, day);
              final isStart =
                  _startDate != null &&
                  date.year == _startDate!.year &&
                  date.month == _startDate!.month &&
                  date.day == _startDate!.day;
              final isEnd =
                  _endDate != null &&
                  date.year == _endDate!.year &&
                  date.month == _endDate!.month &&
                  date.day == _endDate!.day;
              final isInRange =
                  _startDate != null &&
                  _endDate != null &&
                  date.isAfter(_startDate!) &&
                  date.isBefore(_endDate!);

              return GestureDetector(
                onTap: () => _handleDateTap(date),
                child: Container(
                  decoration: BoxDecoration(
                    color: isStart || isEnd
                        ? primaryColor
                        : isInRange
                        ? primaryColor.withOpacity(0.2)
                        : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '$day',
                      style: TextStyle(
                        fontSize: ResponsiveHelper.fontSize(context, base: 14),
                        color: isStart || isEnd ? Colors.white : Colors.black87,
                        fontWeight: isStart || isEnd
                            ? FontWeight.w600
                            : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
