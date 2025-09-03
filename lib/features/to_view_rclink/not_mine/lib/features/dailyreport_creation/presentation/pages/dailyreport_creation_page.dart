import 'package:flutter/material.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';

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

  @override
  Widget build(BuildContext context) {
    final Color defaultPrimaryColor =
        primaryColor ?? Theme.of(context).primaryColor;

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
                              ' Add Daily Report',
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
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          Icons.abc,
                                          color: defaultPrimaryColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Scope of Work'),

                                        Text(
                                          'Choose scope of work',
                                          style: TextStyle(
                                            fontSize: ResponsiveHelper.fontSize(
                                              context,
                                              base: 14,
                                            ),
                                            fontWeight: FontWeight.w700,
                                            color: Colors.red,
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
                                    color: Color.fromARGB(255, 214, 226, 255),
                                  ),
                                  // Chevron icon
                                  child: Icon(
                                    Icons.chevron_right_rounded,
                                    color: defaultPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Weather
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          Icons.abc,
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
                                          'Sunny',
                                          style: TextStyle(
                                            fontSize: ResponsiveHelper.fontSize(
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
                                    color: Color.fromARGB(255, 214, 226, 255),
                                  ),
                                  // Chevron icon
                                  child: Icon(
                                    Icons.chevron_right_rounded,
                                    color: defaultPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Location
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          Icons.abc,
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
                                          'Choose location',
                                          style: TextStyle(
                                            fontSize: ResponsiveHelper.fontSize(
                                              context,
                                              base: 14,
                                            ),
                                            fontWeight: FontWeight.w700,
                                            color: Colors.red,
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
                                    color: Color.fromARGB(255, 214, 226, 255),
                                  ),
                                  // Chevron icon
                                  child: Icon(
                                    Icons.chevron_right_rounded,
                                    color: defaultPrimaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Section
                          Container(
                            margin: EdgeInsets.only(bottom: 15),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                          Icons.abc,
                                          color: defaultPrimaryColor,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Section'),

                                        // TextField(
                                        //   // controller: controller,
                                        //   // onChanged: onChanged,
                                        //   // onSubmitted: onSubmitted,
                                        //   decoration: InputDecoration(
                                        //     hintText: 'Type Section',
                                        //     hintStyle: TextStyle(
                                        //       color: Colors.grey.shade500,
                                        //       fontSize: 14,
                                        //       fontWeight: FontWeight.w400,
                                        //     ),
                                        //     filled: true,
                                        //     fillColor: Colors.white,
                                        //     contentPadding: EdgeInsets.symmetric(
                                        //       horizontal: 20,
                                        //       vertical: 15,
                                        //     ),
                                        //     border: OutlineInputBorder(
                                        //       borderRadius: BorderRadius.circular(
                                        //         8,
                                        //       ),
                                        //       borderSide: BorderSide(
                                        //         color: Colors.grey.shade300,
                                        //         width: 1,
                                        //       ),
                                        //     ),
                                        //     enabledBorder: OutlineInputBorder(
                                        //       borderRadius: BorderRadius.circular(
                                        //         8,
                                        //       ),
                                        //       borderSide: BorderSide(
                                        //         color: Colors.grey.shade300,
                                        //         width: 1,
                                        //       ),
                                        //     ),
                                        //     focusedBorder: OutlineInputBorder(
                                        //       borderRadius: BorderRadius.circular(
                                        //         8,
                                        //       ),
                                        //       borderSide: BorderSide(
                                        //         color: Colors.blue.shade400,
                                        //         width: 2,
                                        //       ),
                                        //     ),
                                        //   ),
                                        //   style: TextStyle(
                                        //     color: Colors.black,
                                        //     fontSize: 14,
                                        //     fontWeight: FontWeight.w400,
                                        //   ),
                                        // ),
                                        Text(
                                          'Range from 0.00 to 1.28',
                                          style: TextStyle(
                                            fontSize: ResponsiveHelper.fontSize(
                                              context,
                                              base: 10,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
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
                              onPressed: () {},
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
    );
  }
}
