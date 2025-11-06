import 'package:flutter/material.dart';
import 'package:rclink_app/shared/widgets/coming_soon_overlay.dart';

import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/month_filter_widget.dart';
import '../../../../shared/widgets/custom_tab_widget.dart';
import '../widgets/warning_list_widget.dart';

class WarningPage extends StatefulWidget {
  const WarningPage({Key? key}) : super(key: key);

  @override
  State<WarningPage> createState() => _WarningPageState();
}

class _WarningPageState extends State<WarningPage> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  String _currentTab = 'Programs';

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
      body: ComingSoonOverlay(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 135, 167, 247), primaryColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.2],
            ),
          ),
          child: Stack(
            children: [
              SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        'Warning',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubic,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.76,
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
                      right: 20.0,
                      left: 20.0,
                      top: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MonthFilter(
                          onMonthSelected: onMonthSelected,
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
                            tabs: const ['Reports', 'Programs', 'Inspection'],
                            initialIndex: 1,
                            onTabChanged: (index, tabLabel) {
                              setState(() {
                                _currentTab = tabLabel;
                              });
                              print(
                                'Tab changed to: $tabLabel (index: $index)',
                              );
                            },
                            tabContents: [
                              _buildReportsContent(),
                              _buildProgramsContent(),
                              _buildInspectionContent(),
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

  Widget _buildReportsContent() {
    return Center(
      child: Text('Reports Content', style: TextStyle(fontSize: 12)),
    );
  }

  Widget _buildProgramsContent() {
    return SingleChildScrollView(child: WarningProgramListWidget());
  }

  Widget _buildInspectionContent() {
    return Center(
      child: Text('Inspection Content', style: TextStyle(fontSize: 12)),
    );
  }
}
