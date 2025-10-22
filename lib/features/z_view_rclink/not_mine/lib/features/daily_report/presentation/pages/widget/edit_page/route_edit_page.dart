import 'package:flutter/material.dart';
import '../../../../../../shared/utils/responsive_helper.dart';
import '../../../../../../shared/utils/theme.dart';
import '../../../../domain/entities/daily_report.dart';

class RouteEditPage extends StatefulWidget {
  final DailyReport report;

  const RouteEditPage({Key? key, required this.report}) : super(key: key);

  @override
  State<RouteEditPage> createState() => _RouteEditPageState();
}

class _RouteEditPageState extends State<RouteEditPage> {
  final TextEditingController _sectionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ResponsiveHelper.getHeight(context, 0.03)),

              IconButton(
                style: IconButton.styleFrom(
                  elevation: 2,
                  shadowColor: Colors.black,
                  shape: const CircleBorder(),
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(10),
                ),
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 25,
                ),
              ),
              SizedBox(height: 13),
              Text(
                'Update Route',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              Text(
                'Update the information below if required.',
                style: TextStyle(fontSize: 13),
              ),

              SizedBox(height: 30),

              GestureDetector(
                onTap: () {
                  // _showLocationSelection(context, state);
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 15),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 214, 226, 255),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.location_on,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.report.road!.districtName.toString(),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 12.0),
                                    child: Text(
                                      '${widget.report.road!.roadNo} - ${widget.report.road!.name}',
                                      style: TextStyle(
                                        fontSize: ResponsiveHelper.fontSize(
                                          context,
                                          base: 14,
                                        ),
                                        fontWeight: FontWeight.w700,
                                        color: greenAccent,
                                        // overflow:
                                        //     TextOverflow
                                        //         .ellipsis,
                                      ),
                                    ),
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
                          color: Color.fromARGB(255, 214, 226, 255),
                        ),
                        child: Icon(
                          Icons.chevron_right_rounded,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                margin: EdgeInsets.only(bottom: 15),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                decoration: BoxDecoration(
                  border: Border.all(
                    // color: hasError && errorMessage != null
                    //     ? Colors.red
                    //     : Colors.grey.shade400,
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              // color: hasError && errorMessage != null
                              //     ? Colors.red.shade50
                              //     : Color.fromARGB(255, 214, 226, 255),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.swap_calls,
                                // color: hasError && errorMessage != null
                                //     ? Colors.red
                                //     : primaryColor,
                              ),
                            ),
                          ),

                          const SizedBox(width: 20),

                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Section',
                                  style: TextStyle(
                                    // color: hasError
                                    //     ? Colors.red.shade600
                                    //     : Colors.black,
                                  ),
                                ),

                                SizedBox(height: 5),

                                SizedBox(
                                  child: TextField(
                                    controller: _sectionController,

                                    onChanged: (value) {
                                      // context.read<ReportCreationBloc>().add(
                                      //   UpdateSection(value),
                                      // );
                                    },
                                    keyboardType:
                                        TextInputType.numberWithOptions(
                                          decimal: true,
                                        ),
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: "Type section",
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 12,
                                        vertical: 8,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                        borderSide: BorderSide(
                                          color: Colors.grey.shade300,
                                          width: 1,
                                        ),
                                      ),
                                      // focusedBorder: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(
                                      //     8.0,
                                      //   ),
                                      //   borderSide: BorderSide(
                                      //     color:
                                      //         hasError && errorMessage != null
                                      //         ? Colors.red
                                      //         : primaryColor,
                                      //     width: 1.5,
                                      //   ),
                                      // ),
                                    ),
                                  ),
                                ),

                                SizedBox(height: 5),

                                // Builder(
                                //   builder: (context) {
                                //     final selectedRoad = state.maybeWhen(
                                //       page1Ready: (apiData, selections) =>
                                //           selections.selectedRoad,
                                //       page1Error:
                                //           (apiData, selections, errorMessage) =>
                                //               selections.selectedRoad,
                                //       orElse: () => null,
                                //     );

                                //     if (selectedRoad?.sectionStart != null &&
                                //         selectedRoad?.sectionFinish != null) {
                                //       return Text(
                                //         'Range from ${selectedRoad!.sectionStart} - ${selectedRoad!.sectionFinish}',
                                //         style: TextStyle(
                                //           // fontWeight:
                                //           //     hasError && errorMessage != null
                                //           //     ? FontWeight.bold
                                //           //     : FontWeight.normal,
                                //           fontSize: ResponsiveHelper.fontSize(
                                //             context,
                                //             base: 10,
                                //           ),
                                //           // color:
                                //           //     hasError && errorMessage != null
                                //           //     ? Colors.red
                                //           //     : Colors.black,
                                //         ),
                                //       );
                                //     }
                                //     return const SizedBox.shrink();
                                //   },
                                // ),
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
        ),
      ),
    );
  }
}
