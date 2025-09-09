import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../bloc/report_creation_bloc.dart';
import '../../bloc/report_creation_event.dart';
import '../../bloc/report_creation_state.dart';
import '../../constant/report_model.dart';
import '../../constant/scope_configurations.dart';

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
  late ReportCreationBloc _reportBloc;
  String? selectedScopeId;

  @override
  void initState() {
    super.initState();
    _reportBloc = ReportCreationBloc(ScopeConfigurations.all);

    // Find scope ID from scope name
    selectedScopeId = _findScopeIdByName(widget.scopeOfWork);
    if (selectedScopeId != null) {
      _reportBloc.add(ScopeSelectedEvent(selectedScopeId!));
    }
  }

  String? _findScopeIdByName(String scopeName) {
    for (final entry in ScopeConfigurations.all.entries) {
      if (entry.value.name == scopeName) {
        return entry.key;
      }
    }
    return null;
  }

  @override
  void dispose() {
    _reportBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color defaultPrimaryColor =
        primaryColor ?? Theme.of(context).primaryColor;

    return BlocProvider(
      create: (context) => _reportBloc,
      child: GestureDetector(
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
                  // Top
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
                                  'Draft Daily Report',
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

                  // Main Content
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
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
                      child: BlocBuilder<ReportCreationBloc, ReportCreationState>(
                        builder: (context, state) {
                          if (state.selectedScopeId == null) {
                            return Center(
                              child: Text(
                                'Scope not found. Please go back and select a valid scope.',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),

                              _buildParameterSummary(),

                              SizedBox(height: 20),
                              Divider(
                                thickness: 1,
                                color: Colors.grey.shade300,
                              ),
                              SizedBox(height: 20),

                              Text(
                                'Notes',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              SizedBox(height: 10),

                              Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: TextField(
                                  onChanged: (value) {
                                    context.read<ReportCreationBloc>().add(
                                      FieldUpdatedEvent('notes', value),
                                    );
                                  },
                                  maxLines: 3,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Enter additional notes',
                                  ),
                                ),
                              ),

                              SizedBox(height: 25),

                              Text(
                                'Quantity Types',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              SizedBox(height: 10),

                              Material(
                                color: Colors.transparent,
                                child: GestureDetector(
                                  onTap: () {
                                    final scopeConfig = ScopeConfigurations
                                        .all[state.selectedScopeId!]!;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            QuantitySelectionPage(
                                              scopeOfWork: widget.scopeOfWork,
                                              weather: widget.weather,
                                              location: widget.location,
                                              section: widget.section,
                                              scopeConfig: scopeConfig,
                                            ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.format_list_numbered,
                                          color: primaryColor,
                                        ),
                                        SizedBox(width: 16),
                                        Text(
                                          'Select quantity types to fill',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.arrow_forward_ios,
                                          color: Colors.grey,
                                          size: 16,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              SizedBox(height: 30),

                              // Submit Button
                              //
                              //
                              // Container(
                              //   width: double.infinity,
                              //   child: ElevatedButton(
                              //     onPressed: () {
                              //       _showSuccessDialog(context, {
                              //         'test': 'data',
                              //       });
                              //     },
                              //     style: ElevatedButton.styleFrom(
                              //       backgroundColor: primaryColor,
                              //       padding: EdgeInsets.symmetric(vertical: 15),
                              //       shape: RoundedRectangleBorder(
                              //         borderRadius: BorderRadius.circular(12),
                              //       ),
                              //       elevation: 2,
                              //     ),
                              //     child: Text(
                              //       'Submit Report',
                              //       style: TextStyle(
                              //         color: Colors.white,
                              //         fontSize: 16,
                              //         fontWeight: FontWeight.bold,
                              //       ),
                              //     ),
                              //   ),
                              // ),
                              SizedBox(height: 20),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
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
          _buildInfoRow(
            'Scope of Work',
            widget.scopeOfWork,
            Icons.restaurant_menu,
          ),
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

  Map<String, dynamic> _buildFinalJson(ReportCreationState state) {
    final baseJson = state.toJson(ScopeConfigurations.all);

    // Add the parameters from the previous page
    return {
      ...baseJson,
      'basicInfo': {
        'scopeOfWork': widget.scopeOfWork,
        'weather': widget.weather,
        'location': widget.location,
        'section': widget.section,
      },
    };
  }

  void _showSuccessDialog(BuildContext context, Map<String, dynamic> data) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Success'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Report submitted successfully!'),
            SizedBox(height: 10),
            Text('Data to be sent to API:'),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(4),
              ),
              child: SingleChildScrollView(
                child: Text(
                  data.toString(),
                  style: TextStyle(fontSize: 12, fontFamily: 'monospace'),
                ),
              ),
            ),
          ],
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
