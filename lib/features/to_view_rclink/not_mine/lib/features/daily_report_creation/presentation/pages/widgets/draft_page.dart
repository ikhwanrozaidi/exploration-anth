import 'package:flutter/material.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/divider_config.dart';
import '../../constant/report_model.dart';
import '../../constant/scope_configurations.dart';
import 'shared/custom_fields_tile_widget.dart';
import 'quantity_selection_page.dart';

class DraftDailyReportPage extends StatefulWidget {
  final String scopeOfWork;
  final String weather;
  final String location;
  final String section;

  const DraftDailyReportPage({
    Key? key,
    required this.scopeOfWork,
    required this.weather,
    required this.location,
    required this.section,
  }) : super(key: key);

  @override
  State<DraftDailyReportPage> createState() => _DraftDailyReportPageState();
}

class _DraftDailyReportPageState extends State<DraftDailyReportPage> {
  String notes = '';
  List<Map<String, dynamic>> addedQuantities = [];

  String? worker;
  String? equipment;
  String? conditionSnapshot;
  String? quantity;

  @override
  Widget build(BuildContext context) {
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
              // Header
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          style: IconButton.styleFrom(
                            shape: const CircleBorder(),
                            backgroundColor: Colors.white,
                            padding: const EdgeInsets.all(5),
                          ),
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            color: primaryColor,
                            size: 25,
                          ),
                        ),

                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                print('Tips button pressed');
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: primaryColor,
                                side: BorderSide(
                                  color: primaryColor,
                                  width: 1.5,
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text('Tips'),
                            ),

                            SizedBox(width: 6),

                            TextButton(
                              onPressed: () {
                                print('Remove button pressed');
                              },
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.red,
                                side: BorderSide(color: Colors.red, width: 1.5),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: Text(
                                'Remove',
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SizedBox(height: 13),

                    Text(
                      'Draft Report',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),

                    Text(
                      'Please fill in the information listed below',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),

                    SizedBox(height: 30),
                  ],
                ),
              ),

              // Content
              Expanded(
                child: Container(
                  padding: ResponsiveHelper.padding(context, all: 30),
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
                      SizedBox(height: 10),

                      // Scope of Work
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 214, 226, 255),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(Icons.abc, color: primaryColor),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Scope of Work'),

                                  Text(
                                    widget.scopeOfWork.toUpperCase(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: ResponsiveHelper.fontSize(
                                        context,
                                        base: 14,
                                      ),
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      dividerConfig(),

                      // Location
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 214, 226, 255),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(Icons.abc, color: primaryColor),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Location'),

                                  Text(
                                    widget.location.toUpperCase(),
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: ResponsiveHelper.fontSize(
                                        context,
                                        base: 14,
                                      ),
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      dividerConfig(),

                      // Sections
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 214, 226, 255),
                                shape: BoxShape.circle,
                              ),
                              child: Center(
                                child: Icon(Icons.abc, color: primaryColor),
                              ),
                            ),
                            const SizedBox(width: 20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Section'),

                                Text(
                                  widget.section,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.fontSize(
                                      context,
                                      base: 14,
                                    ),
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      dividerConfig(),

                      // Worker
                      CustomFieldTile(
                        icon: Icons.abc,
                        title: 'Worker',
                        titleDetails: 'Take picture of worker',
                        controller: worker,
                        onTap: () {
                          print('Worker selection tapped');
                        },
                        isRequired: true,
                      ),

                      // Equipment
                      CustomFieldTile(
                        icon: Icons.abc,
                        title: 'Equipment',
                        titleDetails: 'Choose tools',
                        controller: equipment,
                        onTap: () {
                          print('Equipment selection tapped');
                        },
                        isRequired: true,
                      ),

                      // Condition Snapshot
                      CustomFieldTile(
                        icon: Icons.abc,
                        title: 'Condition Snapshot',
                        titleDetails: "Please take a 'before' photo",
                        controller: conditionSnapshot,
                        onTap: () {
                          print('Condition selection tapped');
                        },
                        isRequired: true,
                      ),

                      // Quantity
                      CustomFieldTile(
                        icon: Icons.abc,
                        title: 'Quantity',
                        titleDetails: addedQuantities.isEmpty
                            ? 'Work-related quantity info'
                            : '${addedQuantities.length} added',
                        // controller: addedQuantities.toString(),
                        onTap: () async {
                          final scopeConfig = _findScopeConfig();
                          if (scopeConfig != null) {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuantitySelectionPage(
                                  scopeOfWork: widget.scopeOfWork,
                                  weather: widget.weather,
                                  location: widget.location,
                                  section: widget.section,
                                  scopeConfig: scopeConfig,
                                  addedQuantities: addedQuantities,
                                ),
                              ),
                            );

                            if (result != null) {
                              setState(() {
                                addedQuantities = result;
                              });
                            }
                          }
                        },
                        isRequired: true,
                      ),

                      // Notes
                      CustomFieldTile(
                        icon: Icons.abc,
                        title: 'Notes',
                        titleDetails: 'Notes or photos if addtional',
                        // controller: selectedScopeOfWork,
                        onTap: () {
                          print('Notes selection tapped');
                        },
                        isRequired: true,
                      ),

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       'Added Quantities',
                      //       style: TextStyle(
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.bold,
                      //         color: Colors.grey.shade700,
                      //       ),
                      //     ),
                      //     Text(
                      //       '${addedQuantities.length} item(s)',
                      //       style: TextStyle(
                      //         fontSize: 14,
                      //         color: Colors.grey.shade600,
                      //       ),
                      //     ),
                      //   ],
                      // ),

                      // SizedBox(height: 10),

                      // // Show added quantities
                      // if (addedQuantities.isNotEmpty) ...[
                      //   Container(
                      //     height: 120,
                      //     child: ListView.builder(
                      //       itemCount: addedQuantities.length,
                      //       itemBuilder: (context, index) {
                      //         final quantity = addedQuantities[index];
                      //         return Container(
                      //           margin: EdgeInsets.only(bottom: 8),
                      //           padding: EdgeInsets.all(12),
                      //           decoration: BoxDecoration(
                      //             color: Colors.green.shade50,
                      //             border: Border.all(
                      //               color: Colors.green.shade200,
                      //             ),
                      //             borderRadius: BorderRadius.circular(8),
                      //           ),
                      //           child: Row(
                      //             children: [
                      //               Icon(
                      //                 Icons.check_circle,
                      //                 color: Colors.green,
                      //                 size: 20,
                      //               ),
                      //               SizedBox(width: 12),
                      //               Expanded(
                      //                 child: Text(
                      //                   quantity['name'],
                      //                   style: TextStyle(
                      //                     fontWeight: FontWeight.w500,
                      //                   ),
                      //                 ),
                      //               ),
                      //               Text(
                      //                 '${quantity['fieldsCount']} fields',
                      //                 style: TextStyle(
                      //                   fontSize: 12,
                      //                   color: Colors.grey.shade600,
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //         );
                      //       },
                      //     ),
                      //   ),
                      //   SizedBox(height: 15),
                      // ],

                      // // Add Quantity Button
                      // Material(
                      //   color: Colors.transparent,
                      //   child: InkWell(
                      //     onTap: () async {
                      //       final scopeConfig = _findScopeConfig();
                      //       if (scopeConfig != null) {
                      //         final result = await Navigator.push(
                      //           context,
                      //           MaterialPageRoute(
                      //             builder: (context) => QuantitySelectionPage(
                      //               scopeOfWork: widget.scopeOfWork,
                      //               weather: widget.weather,
                      //               location: widget.location,
                      //               section: widget.section,
                      //               scopeConfig: scopeConfig,
                      //               addedQuantities: addedQuantities,
                      //             ),
                      //           ),
                      //         );

                      //         if (result != null) {
                      //           setState(() {
                      //             addedQuantities = result;
                      //           });
                      //         }
                      //       }
                      //     },
                      //     borderRadius: BorderRadius.circular(10),
                      //     child: Container(
                      //       padding: EdgeInsets.all(16),
                      //       decoration: BoxDecoration(
                      //         border: Border.all(color: Colors.grey.shade300),
                      //         borderRadius: BorderRadius.circular(10),
                      //       ),
                      //       child: Row(
                      //         children: [
                      //           Icon(
                      //             Icons.add_circle_outline,
                      //             color: primaryColor,
                      //           ),
                      //           SizedBox(width: 16),
                      //           Text(
                      //             addedQuantities.isEmpty
                      //                 ? 'Select quantity types to fill'
                      //                 : 'Add more quantities',
                      //             style: TextStyle(
                      //               fontSize: 16,
                      //               fontWeight: FontWeight.w500,
                      //             ),
                      //           ),
                      //           Spacer(),
                      //           Icon(
                      //             Icons.arrow_forward_ios,
                      //             color: Colors.grey,
                      //             size: 16,
                      //           ),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 20),

                      // Submit Button
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: addedQuantities.isNotEmpty
                              ? () => _submitReport()
                              : null,
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
                            'Next',
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

  Widget _buildParameterSummary() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Report Information',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade800,
            ),
          ),
          SizedBox(height: 12),
          _buildInfoRow('Scope of Work', widget.scopeOfWork, Icons.abc),
          _buildInfoRow('Weather', widget.weather, Icons.sunny),
          _buildInfoRow('Location', widget.location, Icons.location_on),
          _buildInfoRow('Section', widget.section, Icons.swap_calls),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blue.shade600),
          SizedBox(width: 12),
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: Colors.grey.shade800,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  ScopeConfig? _findScopeConfig() {
    for (final entry in ScopeConfigurations.all.entries) {
      if (entry.value.name == widget.scopeOfWork) {
        return entry.value;
      }
    }
    return null;
  }

  void _submitReport() {
    final jsonData = {
      'basicInfo': {
        'scopeOfWork': widget.scopeOfWork,
        'weather': widget.weather,
        'location': widget.location,
        'section': widget.section,
      },
      'notes': notes,
      'quantities': addedQuantities,
    };

    print('Final Report JSON:');
    print(jsonData);

    _showSuccessDialog();
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Success'),
        content: Text(
          'Report submitted successfully! Check console for JSON output.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
