import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/utils/theme.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
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
    double bottomContainerHeight = showActionRequired
        ? MediaQuery.of(context).size.height * 0.29
        : MediaQuery.of(context).size.height * 0.40;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 135, 167, 247), primaryColor],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/images/rclink_logo.png',
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                        IconButton(
                          onPressed: toggleActionRequired,
                          icon: Icon(
                            showActionRequired
                                ? Icons.toggle_on
                                : Icons.toggle_off,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Search Button
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        backgroundColor: Colors.white.withOpacity(0.6),
                      ),
                      onPressed: () =>
                          context.read<AuthBloc>().add(const LogoutRequested()),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 25,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.black.withOpacity(0.6),
                            ),
                            SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Search Report',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  'By district or contractor',
                                  style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // Listing Section
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Listing',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 10),
                          GridView.count(
                            crossAxisCount: 4,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio: 0.7,
                            children: [
                              ListingItem(
                                isBlack: false,
                                image: 'assets/images/icons/daily_report.png',
                                label: 'Daily\nReport',
                                onTap: () {
                                  print('Daily Report tapped');
                                },
                              ),
                              ListingItem(
                                isBlack: false,
                                image: 'assets/images/icons/inspection.png',
                                label: 'Inspection',
                                onTap: () {
                                  print('Inspection tapped');
                                },
                              ),
                              ListingItem(
                                isBlack: false,
                                image: 'assets/images/icons/site_warning.png',
                                label: 'Site\nWarning',
                                onTap: () {
                                  print('Site Warning tapped');
                                },
                              ),
                              ListingItem(
                                isBlack: false,
                                image: 'assets/images/icons/program.png',
                                label: 'Program',
                                onTap: () {
                                  print('Program tapped');
                                },
                              ),
                              ListingItem(
                                isBlack: false,
                                image: 'assets/images/icons/toolbox.png',
                                label: 'Toolbox',
                                onTap: () {
                                  print('Toolbox tapped');
                                },
                              ),
                              ListingItem(
                                isBlack: false,
                                image: 'assets/images/icons/disaster.png',
                                label: 'Disaster',
                                onTap: () {
                                  print('Disaster tapped');
                                },
                              ),
                              ListingItem(
                                isBlack: false,
                                image: 'assets/images/icons/periodic.png',
                                label: 'Periodic',
                                onTap: () {
                                  print('Periodic tapped');
                                },
                              ),
                              ListingItem(
                                isBlack: false,
                                image: 'assets/images/icons/others.png',
                                label: 'Others',
                                onTap: () {
                                  print('Others tapped');
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),

                    AnimatedContainer(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                      height: showActionRequired ? null : 0,
                      child: AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: showActionRequired ? 1.0 : 0.0,
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: showActionRequired ? 10 : 0,
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(0.5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 10,
                                      horizontal: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Center(
                                      child: AnimatedSwitcher(
                                        duration: Duration(milliseconds: 300),
                                        child: Text(
                                          '$actionCount',
                                          key: ValueKey(actionCount),
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Action Required',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'Please complete it promptly',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.white,
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

            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOutCubic,
                width: double.infinity,
                height: bottomContainerHeight,
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
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Report',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 10),
                      Expanded(
                        child: GridView.count(
                          padding: EdgeInsets.zero,
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: 1.4,
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
    );
  }
}
