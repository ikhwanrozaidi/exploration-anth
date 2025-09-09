import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../bloc/report_creation_bloc.dart';
import '../../bloc/report_creation_event.dart';
import '../../bloc/report_creation_state.dart';
import '../../constant/report_model.dart';
import '../../constant/scope_configurations.dart';
import 'report_creation_fields.dart';

// Dynamic Report Fields Widget (Main Integration)
class DynamicReportFields extends StatelessWidget {
  final String? selectedScopeId;
  final Function(String) onScopeSelected;

  const DynamicReportFields({
    Key? key,
    this.selectedScopeId,
    required this.onScopeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportCreationBloc(ScopeConfigurations.all),
      child: BlocBuilder<ReportCreationBloc, ReportCreationState>(
        builder: (context, state) {
          return Column(
            children: [
              // Scope Selection
              _buildScopeSelector(context, state),

              // Dynamic Fields based on selected scope
              if (state.selectedScopeId != null) ...[
                SizedBox(height: 20),
                _buildDynamicFields(context, state),
              ],
            ],
          );
        },
      ),
    );
  }

  Widget _buildScopeSelector(BuildContext context, ReportCreationState state) {
    final scopeConfig = state.selectedScopeId != null
        ? ScopeConfigurations.all[state.selectedScopeId!]
        : null;

    return DailyReportCreationFields(
      focus: false,
      title: 'Scope of Work',
      description: 'Choose scope of work',
      icon: Icons.restaurant_menu,
      isTextField: false,
      isBottomSheet: true,
      isTextNumber: false,
      currentValue: scopeConfig?.name,
      onTap: () {
        showFlexibleBottomsheet(
          context: context,
          title: "Scope of Work",
          attributes: ScopeConfigurations.all.values
              .map((s) => s.name)
              .toList(),
          isRadio: true,
          onSelectionChanged: (selectedName) {
            final selectedScope = ScopeConfigurations.all.values.firstWhere(
              (scope) => scope.name == selectedName,
            );
            context.read<ReportCreationBloc>().add(
              ScopeSelectedEvent(selectedScope.id),
            );
          },
        );
      },
    );
  }

  Widget _buildDynamicFields(BuildContext context, ReportCreationState state) {
    final scopeConfig = ScopeConfigurations.all[state.selectedScopeId!]!;

    return Column(
      children: [
        // Common Fields
        Text(
          'Common Fields',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        ...scopeConfig.commonFields.map(
          (field) => _buildField(context, state, field, null),
        ),

        SizedBox(height: 20),

        // Quantity Selection
        _buildQuantitySelector(context, state, scopeConfig),

        // Quantity Fields
        if (state.selectedQuantityIds.isNotEmpty) ...[
          SizedBox(height: 20),
          ...state.selectedQuantityIds.map((quantityId) {
            final quantityOption = scopeConfig.quantityOptions.firstWhere(
              (q) => q.id == quantityId,
            );
            return _buildQuantitySection(context, state, quantityOption);
          }),
        ],

        SizedBox(height: 20),

        // Submit Button
        _buildSubmitButton(context, state),
      ],
    );
  }

  Widget _buildQuantitySelector(
    BuildContext context,
    ReportCreationState state,
    ScopeConfig scopeConfig,
  ) {
    String displayText = 'Choose quantity types';
    if (state.selectedQuantityIds.isNotEmpty) {
      displayText = state.selectedQuantityIds
          .map(
            (id) =>
                scopeConfig.quantityOptions.firstWhere((q) => q.id == id).name,
          )
          .join(', ');
    }

    return DailyReportCreationFields(
      focus: false,
      title: 'Quantity Types',
      description: 'Select quantity types',
      icon: Icons.format_list_numbered,
      isTextField: false,
      isBottomSheet: true,
      isTextNumber: false,
      currentValue: state.selectedQuantityIds.isNotEmpty ? displayText : null,
      onTap: () {
        _showQuantityBottomSheet(
          context,
          scopeConfig,
          state.selectedQuantityIds,
        );
      },
    );
  }

  void _showQuantityBottomSheet(
    BuildContext context,
    ScopeConfig scopeConfig,
    List<String> currentSelections,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Choose Quantity Types',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 15),
            StatefulBuilder(
              builder: (context, setModalState) {
                List<String> selectedQuantities = List.from(currentSelections);

                return Column(
                  children: [
                    ...scopeConfig.quantityOptions.map((option) {
                      return CheckboxListTile(
                        dense: true,
                        title: Text(
                          option.name,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        value: selectedQuantities.contains(option.id),
                        onChanged: (bool? value) {
                          setModalState(() {
                            if (value == true) {
                              selectedQuantities.add(option.id);
                            } else {
                              selectedQuantities.remove(option.id);
                            }
                          });
                        },
                        activeColor: Colors.blue,
                        controlAffinity: ListTileControlAffinity.leading,
                      );
                    }),
                    SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context.read<ReportCreationBloc>().add(
                            QuantitySelectedEvent(selectedQuantities),
                          );
                          Navigator.pop(bottomSheetContext);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text(
                          'Done',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantitySection(
    BuildContext context,
    ReportCreationState state,
    QuantityOption quantityOption,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(bottom: 10),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.blue.shade200),
          ),
          child: Row(
            children: [
              Icon(Icons.category, color: Colors.blue),
              SizedBox(width: 10),
              Text(
                quantityOption.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue.shade800,
                ),
              ),
            ],
          ),
        ),
        ...quantityOption.fields.map(
          (field) => _buildField(context, state, field, quantityOption.id),
        ),
        SizedBox(height: 15),
      ],
    );
  }

  Widget _buildField(
    BuildContext context,
    ReportCreationState state,
    FieldConfig field,
    String? quantityId,
  ) {
    final fieldId = quantityId != null ? '${quantityId}_${field.id}' : field.id;
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

  Widget _buildSubmitButton(BuildContext context, ReportCreationState state) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: state.isValid
            ? () {
                final jsonData = state.toJson(ScopeConfigurations.all);
                print('Report Data: ${jsonData}');
                _showSuccessDialog(context, jsonData);
              }
            : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: Text(
          'Submit Report',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
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
              child: Text(
                data.toString(),
                style: TextStyle(fontSize: 12, fontFamily: 'monospace'),
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
