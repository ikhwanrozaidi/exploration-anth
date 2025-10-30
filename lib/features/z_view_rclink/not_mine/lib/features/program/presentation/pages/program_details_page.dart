import 'package:flutter/material.dart';
import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/divider_config.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../../shared/widgets/theme_listtile_widget.dart';
import '../widgets/program_details_overview_widget.dart';

class ProgramDetailsPage extends StatefulWidget {
  final String programId;
  final String? from;

  const ProgramDetailsPage({Key? key, required this.programId, this.from})
    : super(key: key);

  @override
  State<ProgramDetailsPage> createState() => _ProgramDetailsPageState();
}

class _ProgramDetailsPageState extends State<ProgramDetailsPage> {
  @override
  void initState() {
    super.initState();

    print('Program ID: ${widget.programId}');
    print('Came from: ${widget.from}');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
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
                SizedBox(height: ResponsiveHelper.getHeight(context, 0.02)),

                // Header
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                'Program',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            style: IconButton.styleFrom(
                              shape: const CircleBorder(),
                              backgroundColor: Colors.white,
                              padding: const EdgeInsets.all(5),
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share_sharp,
                              color: primaryColor,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),

                // Body
                Expanded(
                  child: Container(
                    padding: ResponsiveHelper.padding(
                      context,
                      horizontal: 25,
                      vertical: 20,
                    ),
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
                    child: ListView(
                      children: [
                        SizedBox(height: ResponsiveHelper.spacing(context, 10)),

                        // Progress
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                            vertical: 20,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Color.fromARGB(255, 238, 242, 254),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                              color: primaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'code',
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                          ),

                                          SizedBox(width: 10),

                                          Expanded(
                                            child: Text(
                                              'workscope name',
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize:
                                                    ResponsiveHelper.fontSize(
                                                      context,
                                                      base: 14,
                                                    ),
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              dividerConfig(),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Progress',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        '10/50 Report',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w600,
                                          color: primaryColor,
                                        ),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 8),

                                  Container(
                                    height: 12,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: FractionallySizedBox(
                                      alignment: Alignment.centerLeft,
                                      widthFactor: 0.2, // 10/50 = 0.2 (20%)
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: ResponsiveHelper.spacing(context, 20)),

                        ProgramDetailsOverviewWidget(),

                        SizedBox(height: ResponsiveHelper.spacing(context, 20)),

                        // Others
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                              colors: [
                                Colors.white,
                                Color.fromARGB(255, 238, 242, 254),
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Others',
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(
                                    context,
                                    base: 14,
                                  ),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              dividerConfig(),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0,
                                ),
                                child: Column(
                                  children: [
                                    ThemeListTileWidget(
                                      title: 'Update Program',
                                      titleDetails:
                                          'For updating work information',
                                      icon: Icons.edit_square,
                                      isInverseBold: true,
                                      onTap: () {
                                        showFlexibleBottomsheet(
                                          context: context,
                                          title: 'Update Program',
                                          attributes: [
                                            'Details of Work',
                                            'Note',
                                          ],
                                          isRadio: false,
                                          isNavigate: true,
                                          onTap: (selectedOption) {
                                            switch (selectedOption) {
                                              case 'Details of Work':
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) =>
                                                //         RouteEditPage(
                                                //           report: widget
                                                //               .report,
                                                //         ),
                                                //   ),
                                                // );
                                                break;
                                              case 'Note':
                                                // Navigator.push(
                                                //   context,
                                                //   MaterialPageRoute(
                                                //     builder: (context) =>
                                                //         QuantityEditPage(
                                                //           report: widget
                                                //               .report,
                                                //         ),
                                                //   ),
                                                // );
                                                break;
                                            }
                                          },
                                        );
                                      },
                                    ),
                                    dividerConfig(),

                                    ThemeListTileWidget(
                                      title: 'Summary Program',
                                      titleDetails:
                                          'List of payment suggestion',
                                      icon: Icons.calendar_today_rounded,
                                      isInverseBold: true,
                                    ),

                                    dividerConfig(),

                                    ThemeListTileWidget(
                                      title: 'Monthly Summary',
                                      titleDetails: 'List of overall report',
                                      icon: Icons.history,
                                      isInverseBold: true,
                                    ),

                                    dividerConfig(),

                                    // Remove Program
                                    GestureDetector(
                                      onTap: () {},
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                padding: const EdgeInsets.all(
                                                  12,
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.red.shade100,
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Center(
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: Colors.red.shade400,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Remove Program',
                                                    style: TextStyle(
                                                      fontSize:
                                                          ResponsiveHelper.fontSize(
                                                            context,
                                                            base: 14,
                                                          ),
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color:
                                                          Colors.red.shade400,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Delete work program',
                                                    style: TextStyle(
                                                      fontSize:
                                                          ResponsiveHelper.fontSize(
                                                            context,
                                                            base: 12,
                                                          ),
                                                      color:
                                                          Colors.red.shade400,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),

                                          Container(
                                            padding: const EdgeInsets.all(2),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                              color: Colors.red.shade100,
                                            ),
                                            // Chevron icon
                                            child: Icon(
                                              Icons.chevron_right_rounded,
                                              color: Colors.red.shade400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),

                                    SizedBox(height: 10),
                                  ],
                                ),
                              ),
                            ],
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
      ),
    );
  }
}
