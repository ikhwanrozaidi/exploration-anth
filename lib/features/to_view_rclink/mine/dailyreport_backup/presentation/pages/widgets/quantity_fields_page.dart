import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';
import '../../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../bloc/report_creation_bloc.dart';
import '../../bloc/report_creation_event.dart';
import '../../bloc/report_creation_state.dart';
import '../../constant/report_model.dart';
import '../../constant/scope_configurations.dart';
import 'report_creation_fields.dart';

class QuantityFieldsPage extends StatefulWidget {
  final String scopeOfWork;
  final String weather;
  final String location;
  final String section;
  final QuantityOption quantityOption;
  final ScopeConfig scopeConfig;

  const QuantityFieldsPage({
    Key? key,
    required this.scopeOfWork,
    required this.weather,
    required this.location,
    required this.section,
    required this.quantityOption,
    required this.scopeConfig,
  }) : super(key: key);

  @override
  State<QuantityFieldsPage> createState() => _QuantityFieldsPageState();
}

class _QuantityFieldsPageState extends State<QuantityFieldsPage> {
  late ReportCreationBloc _reportBloc;

  @override
  void initState() {
    super.initState();
    _reportBloc = ReportCreationBloc(ScopeConfigurations.all);
    _reportBloc.add(ScopeSelectedEvent(widget.scopeConfig.id));
  }

  @override
  void dispose() {
    _reportBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                  // Header Section
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
                                Expanded(
                                  child: Text(
                                    widget.quantityOption.name,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                    ),
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
                          return Column(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10),

                                      // Quantity Info
                                      Container(
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: primaryColor.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: primaryColor.withOpacity(
                                              0.3,
                                            ),
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.category,
                                              color: primaryColor,
                                            ),
                                            SizedBox(width: 12),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    widget.quantityOption.name,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                  Text(
                                                    'Fill in the required fields below',
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color:
                                                          Colors.grey.shade600,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),

                                      SizedBox(height: 20),

                                      // Fields
                                      ...widget.quantityOption.fields.map(
                                        (field) =>
                                            _buildField(context, state, field),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // Save Button
                              SizedBox(height: 20),
                              _buildSaveButton(context, state),
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

  Widget _buildField(
    BuildContext context,
    ReportCreationState state,
    FieldConfig field,
  ) {
    final fieldId = '${widget.quantityOption.id}_${field.id}';
    final currentValue = state.fieldValues[fieldId];
    final currentImages = state.imageFields[fieldId];
    final errorText = state.fieldErrors[fieldId];

    switch (field.type) {
      case FieldType.multipleImages:
        return DailyReportCreationFields(
          focus: false,
          title: field.title,
          description: field.description,
          icon: field.icon,
          isTextField: false,
          isBottomSheet: false,
          isTextNumber: false,
          currentImages: currentImages,
          errorText: errorText,
          onImageAdded: (imagePath) {
            context.read<ReportCreationBloc>().add(
              ImageAddedEvent(fieldId, imagePath),
            );
          },
          onImageRemoved: (imagePath) {
            context.read<ReportCreationBloc>().add(
              ImageRemovedEvent(fieldId, imagePath),
            );
          },
        );

      case FieldType.dropdown:
        return DailyReportCreationFields(
          focus: false,
          title: field.title,
          description: field.description,
          icon: field.icon,
          isTextField: false,
          isBottomSheet: true,
          isTextNumber: false,
          currentValue: currentValue,
          errorText: errorText,
          onTap: () {
            showFlexibleBottomsheet(
              context: context,
              title: field.title,
              attributes: field.dropdownOptions ?? [],
              isRadio: true,
              onSelectionChanged: (selectedValue) {
                context.read<ReportCreationBloc>().add(
                  FieldUpdatedEvent(fieldId, selectedValue),
                );
              },
            );
          },
        );

      case FieldType.numericField:
        return DailyReportCreationFields(
          focus: false,
          title: field.title,
          description: field.description,
          icon: field.icon,
          isTextField: true,
          isBottomSheet: false,
          isTextNumber: true,
          textFieldHintText: field.hintText,
          textFieldRange: field.numericMax,
          textFieldUnits: field.units,
          currentValue: currentValue?.toString(),
          errorText: errorText,
          onTextChanged: (value) {
            context.read<ReportCreationBloc>().add(
              FieldUpdatedEvent(fieldId, value),
            );
          },
        );

      case FieldType.textField:
      case FieldType.notes:
        return DailyReportCreationFields(
          focus: false,
          title: field.title,
          description: field.description,
          icon: field.icon,
          isTextField: true,
          isBottomSheet: false,
          isTextNumber: false,
          textFieldHintText: field.hintText,
          currentValue: currentValue?.toString(),
          errorText: errorText,
          onTextChanged: (value) {
            context.read<ReportCreationBloc>().add(
              FieldUpdatedEvent(fieldId, value),
            );
          },
        );
    }
  }

  Widget _buildSaveButton(BuildContext context, ReportCreationState state) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Save the current quantity data and go back
          _showSaveDialog(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: Text(
          'Save ${widget.quantityOption.name}',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _showSaveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Saved Successfully'),
        content: Text('${widget.quantityOption.name} data has been saved.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to quantity selection
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
