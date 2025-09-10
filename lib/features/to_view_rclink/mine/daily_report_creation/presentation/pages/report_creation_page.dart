import 'package:flutter/material.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import 'widgets/tips_page.dart';

class DailyReportCreationPage extends StatefulWidget {
  const DailyReportCreationPage({Key? key}) : super(key: key);

  @override
  State<DailyReportCreationPage> createState() =>
      _DailyReportCreationPageState();
}

class _DailyReportCreationPageState extends State<DailyReportCreationPage> {
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  void onMonthSelected(int month, int year) {
    setState(() {
      selectedMonth = month;
      selectedYear = year;
    });
    print('Selected month: $month, year: $year');
  }

  final FocusNode _focusNode = FocusNode();
  final TextEditingController _sectionController = TextEditingController();

  String? selectedScopeOfWork;
  String selectedWeather = 'Sunny';
  String? selectedLocation;

  @override
  void dispose() {
    _focusNode.dispose();
    _sectionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color defaultPrimaryColor =
        primaryColor ?? Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                                'Add Daily Report',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 30),
                    ],
                  ),
                ),

                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),

                            // Scope of work
                            GestureDetector(
                              onTap: () {
                                showFlexibleBottomsheet(
                                  context: context,
                                  title: "Scope of Work",
                                  attributes: [
                                    "R01 - PAVEMENT / PATCHING POTHOLES",
                                    "R02 - ROAD SHOULDER",
                                    "R03 - GRASS CUTTING",
                                    "R04 - CLEANING ROAD FURNITURES",
                                    "R05 - CLEANING CULVERTS & BRIDGES",
                                    "R07 - CLEANING DRAINS",
                                    "General Work",
                                    "Ujian Tempalan",
                                  ],
                                  isRadio: true,
                                  onSelectionChanged: (selectedValue) {
                                    setState(() {
                                      selectedScopeOfWork = selectedValue;
                                    });
                                  },
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 15),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: Color.fromARGB(
                                                255,
                                                214,
                                                226,
                                                255,
                                              ),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.restaurant_menu,
                                                color: defaultPrimaryColor,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 20),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text('Scope of Work'),
                                                Text(
                                                  selectedScopeOfWork ??
                                                      'Choose scope of work',
                                                  style: TextStyle(
                                                    fontSize:
                                                        ResponsiveHelper.fontSize(
                                                          context,
                                                          base: 14,
                                                        ),
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        selectedScopeOfWork ==
                                                            null
                                                        ? Colors.red
                                                        : Colors.black,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Color.fromARGB(
                                          255,
                                          214,
                                          226,
                                          255,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.chevron_right_rounded,
                                        color: defaultPrimaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Weather
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.only(bottom: 15),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                              255,
                                              214,
                                              226,
                                              255,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.sunny,
                                              color: defaultPrimaryColor,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Weather'),
                                            Text(
                                              selectedWeather,
                                              style: TextStyle(
                                                fontSize:
                                                    ResponsiveHelper.fontSize(
                                                      context,
                                                      base: 14,
                                                    ),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Color.fromARGB(
                                          255,
                                          214,
                                          226,
                                          255,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.chevron_right_rounded,
                                        color: defaultPrimaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Location
                            GestureDetector(
                              onTap: () {
                                showFlexibleBottomsheet(
                                  context: context,
                                  title: "Choose State",
                                  attributes: [
                                    "KELANTAN",
                                    "PAHANG",
                                    "SELANGOR",
                                    "TERENGGANU",
                                  ],
                                  isRadio: true,
                                  onSelectionChanged: (selectedValue) {
                                    setState(() {
                                      selectedLocation = selectedValue;
                                    });
                                  },
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(bottom: 15),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 15,
                                ),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                    width: 0.5,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                              255,
                                              214,
                                              226,
                                              255,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.location_on,
                                              color: defaultPrimaryColor,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Location'),
                                            Text(
                                              selectedLocation ??
                                                  'Choose location',
                                              style: TextStyle(
                                                fontSize:
                                                    ResponsiveHelper.fontSize(
                                                      context,
                                                      base: 14,
                                                    ),
                                                fontWeight: FontWeight.w700,
                                                color: selectedLocation == null
                                                    ? Colors.red
                                                    : Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(7),
                                        color: Color.fromARGB(
                                          255,
                                          214,
                                          226,
                                          255,
                                        ),
                                      ),
                                      child: Icon(
                                        Icons.chevron_right_rounded,
                                        color: defaultPrimaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Section
                            Container(
                              margin: EdgeInsets.only(bottom: 15),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 15,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey.shade400,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(12),
                                          decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                              255,
                                              214,
                                              226,
                                              255,
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Center(
                                            child: Icon(
                                              Icons.swap_calls,
                                              color: defaultPrimaryColor,
                                            ),
                                          ),
                                        ),

                                        const SizedBox(width: 20),

                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Section'),

                                              SizedBox(height: 5),

                                              SizedBox(
                                                child: TextField(
                                                  controller:
                                                      _sectionController,
                                                  keyboardType:
                                                      TextInputType.numberWithOptions(
                                                        decimal: true,
                                                      ),
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    hintText: "Type section",
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 12,
                                                          vertical: 8,
                                                        ),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8.0,
                                                          ),
                                                      borderSide: BorderSide(
                                                        color: Colors
                                                            .grey
                                                            .shade300,
                                                        width: 1,
                                                      ),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8.0,
                                                              ),
                                                          borderSide:
                                                              BorderSide(
                                                                color: Colors
                                                                    .grey
                                                                    .shade300,
                                                                width: 1,
                                                              ),
                                                        ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8.0,
                                                              ),
                                                          borderSide: BorderSide(
                                                            color: primaryColor,
                                                            width: 1.5,
                                                          ),
                                                        ),
                                                  ),
                                                ),
                                              ),

                                              SizedBox(height: 5),

                                              Text(
                                                'Range from 0.00 to 1.28',
                                                style: TextStyle(
                                                  fontSize:
                                                      ResponsiveHelper.fontSize(
                                                        context,
                                                        base: 10,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  // Validation
                                  if (selectedScopeOfWork == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Please select Scope of Work',
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                    return;
                                  }

                                  if (selectedLocation == null) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Please select Location'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                    return;
                                  }

                                  if (_sectionController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('Please enter Section'),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                    return;
                                  }

                                  // Validate section range
                                  final sectionValue = double.tryParse(
                                    _sectionController.text,
                                  );
                                  if (sectionValue == null ||
                                      sectionValue < 0 ||
                                      sectionValue > 1.28) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Section must be between 0.00 and 1.28',
                                        ),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                    return;
                                  }

                                  // Navigate to Tips page first
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => TipsOnboardingPage(
                                        scopeOfWork: selectedScopeOfWork!,
                                        weather: selectedWeather,
                                        location: selectedLocation!,
                                        section: _sectionController.text,
                                      ),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  padding: ResponsiveHelper.padding(
                                    context,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  elevation: 2,
                                ),
                                child: Text(
                                  'Add',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 30),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
