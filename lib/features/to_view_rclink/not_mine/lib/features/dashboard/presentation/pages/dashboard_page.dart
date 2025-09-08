import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../company/presentation/bloc/company_bloc.dart';
import '../../../company/presentation/bloc/company_event.dart';
import '../../../daily_report/presentation/pages/daily_report_page.dart';
import 'widgets/listingitem_widget.dart';
import 'widgets/reportitem_widget.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool showActionRequired = true;
  int actionCount = 108;

  void toggleActionRequired() {
    setState(() {
      showActionRequired = !showActionRequired;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 135, 167, 247), primaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: ResponsiveHelper.padding(context, horizontal: 30),
                child: Column(
                  children: [
                    // Header with logo and toggle
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/rclink_logo.png',
                          height: ResponsiveHelper.getHeight(context, 0.04),
                          fit: BoxFit.contain,
                        ),
                        IconButton(
                          onPressed: toggleActionRequired,
                          icon: Icon(
                            showActionRequired
                                ? Icons.toggle_on
                                : Icons.toggle_off,
                            color: Colors.white,
                            size: ResponsiveHelper.iconSize(context, base: 30),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: ResponsiveHelper.spacing(context, 20)),

                    // Search Button
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: ResponsiveHelper.borderRadius(
                            context,
                            all: 50,
                          ),
                        ),
                        backgroundColor: Colors.white.withOpacity(0.6),
                      ),
                      onPressed: () {},
                      // context.read<AuthBloc>().add(const LogoutRequested()),
                      // context.read<CompanyBloc>().add(
                      //   const ClearCompanyCache(),
                      // ),
                      child: Padding(
                        padding: ResponsiveHelper.padding(
                          context,
                          horizontal: 20,
                          vertical: 13,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              size: ResponsiveHelper.iconSize(
                                context,
                                base: 25,
                              ),
                              color: Colors.black.withOpacity(0.6),
                            ),
                            SizedBox(
                              width: ResponsiveHelper.spacing(context, 15),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Search Report',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 14,
                                    ),
                                  ),
                                ),
                                Text(
                                  'By district or contractor',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: ResponsiveHelper.spacing(context, 10)),

                    // Listing Section
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: ResponsiveHelper.padding(context, left: 10),
                          child: Text(
                            'Listing',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: ResponsiveHelper.fontSize(
                                context,
                                base: 15,
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: ResponsiveHelper.spacing(context, 10)),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListingItem(
                                isBlack: false,
                                image: 'assets/images/icons/daily_report.png',
                                label: 'Daily\nReport',
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DailyReportPage(),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Expanded(
                              child: ListingItem(
                                isBlack: false,
                                image: 'assets/images/icons/inspection.png',
                                label: 'Inspection',
                                onTap: () {
                                  print('Inspection tapped');
                                },
                              ),
                            ),
                            Expanded(
                              child: ListingItem(
                                isBlack: false,
                                image: 'assets/images/icons/site_warning.png',
                                label: 'Site\nWarning',
                                onTap: () {
                                  print('Site Warning tapped');
                                },
                              ),
                            ),
                            Expanded(
                              child: ListingItem(
                                isBlack: false,
                                image: 'assets/images/icons/program.png',
                                label: 'Program',
                                onTap: () {
                                  print('Program tapped');
                                },
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: ResponsiveHelper.spacing(context, 15)),

                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: ListingItem(
                                isBlack: false,
                                image: 'assets/images/icons/toolbox.png',
                                label: 'Toolbox',
                                onTap: () {
                                  print('Toolbox tapped');
                                },
                              ),
                            ),
                            Expanded(
                              child: ListingItem(
                                isBlack: false,
                                image: 'assets/images/icons/disaster.png',
                                label: 'Disaster',
                                onTap: () {
                                  print('Disaster tapped');
                                },
                              ),
                            ),
                            Expanded(
                              child: ListingItem(
                                isBlack: false,
                                image: 'assets/images/icons/periodic.png',
                                label: 'Periodic',
                                onTap: () {
                                  print('Periodic tapped');
                                },
                              ),
                            ),
                            Expanded(
                              child: ListingItem(
                                isBlack: false,
                                image: 'assets/images/icons/others.png',
                                label: 'Others',
                                onTap: () {
                                  print('Others tapped');
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: ResponsiveHelper.spacing(context, 25)),

                    // Action Required Section
                    AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      height: showActionRequired ? null : 0,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: showActionRequired ? 1.0 : 0.0,
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: showActionRequired
                                ? ResponsiveHelper.spacing(context, 10)
                                : 0,
                          ),
                          padding: ResponsiveHelper.padding(
                            context,
                            vertical: 15,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: ResponsiveHelper.borderRadius(
                              context,
                              all: 15,
                            ),
                            color: Colors.white.withOpacity(0.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Container(
                                      padding: ResponsiveHelper.padding(
                                        context,
                                        vertical: 10,
                                        horizontal: 15,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            ResponsiveHelper.borderRadius(
                                              context,
                                              all: 15,
                                            ),
                                      ),
                                      child: Center(
                                        child: AnimatedSwitcher(
                                          duration: Duration(milliseconds: 300),
                                          child: Text(
                                            '$actionCount',
                                            key: ValueKey(actionCount),
                                            style: TextStyle(
                                              fontSize:
                                                  ResponsiveHelper.fontSize(
                                                    context,
                                                    base: 20,
                                                  ),
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: ResponsiveHelper.spacing(
                                        context,
                                        15,
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Action Required',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize:
                                                  ResponsiveHelper.fontSize(
                                                    context,
                                                    base: 16,
                                                  ),
                                            ),
                                          ),
                                          Text(
                                            'Please complete it promptly',
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w500,
                                              fontSize:
                                                  ResponsiveHelper.fontSize(
                                                    context,
                                                    base: 12,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.white,
                                size: ResponsiveHelper.iconSize(
                                  context,
                                  base: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: ResponsiveHelper.spacing(context, 10)),
                  ],
                ),
              ),

              // Report Section - Now with Expanded for flexible height
              Expanded(
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOutCubic,
                  width: double.infinity,
                  // Removed height: double.infinity - Expanded handles this now
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: ResponsiveHelper.borderRadius(
                      context,
                      topLeft: 24,
                      topRight: 24,
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
                    padding: ResponsiveHelper.padding(context, all: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Report',
                          style: TextStyle(
                            fontSize: ResponsiveHelper.fontSize(
                              context,
                              base: 15,
                            ),
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: ResponsiveHelper.spacing(context, 10)),
                        Expanded(
                          child: GridView.count(
                            padding: EdgeInsets.zero,
                            crossAxisCount: ResponsiveHelper.adaptive(
                              context,
                              mobile: 3,
                              tablet: 4,
                              desktop: 6,
                            ),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            mainAxisSpacing: ResponsiveHelper.spacing(
                              context,
                              5,
                            ),
                            crossAxisSpacing: ResponsiveHelper.spacing(
                              context,
                              5,
                            ),
                            childAspectRatio: ResponsiveHelper.adaptive(
                              context,
                              mobile: 1.4,
                              tablet: 1.3,
                              desktop: 1.2,
                            ),
                            children: [
                              ListingItem(
                                isBlack: true,
                                image: 'assets/images/icons/jkr.png',
                                label: 'JKR Report',
                                onTap: () {
                                  print('JKR Report tapped');
                                },
                              ),
                              ListingItem(
                                isBlack: true,
                                image: 'assets/images/icons/monthly_report.png',
                                label: 'Monthly Report',
                                onTap: () {
                                  print('Monthly Report tapped');
                                },
                              ),
                              ListingItem(
                                isBlack: true,
                                image: 'assets/images/icons/statistic.png',
                                label: 'Statistic',
                                onTap: () {
                                  print('Statistic tapped');
                                },
                              ),
                              ListingItem(
                                isBlack: true,
                                image: 'assets/images/icons/hotmix_request.png',
                                label: 'Hotmix Request',
                                onTap: () {
                                  print('Hotmix Request tapped');
                                },
                              ),
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
}
