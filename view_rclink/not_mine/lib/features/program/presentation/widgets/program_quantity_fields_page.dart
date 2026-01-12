import 'package:flutter/material.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../../../shared/widgets/flexible_bottomsheet.dart';
import '../../../daily_report/presentation/widgets/report_creation/shared/creation_fields_widget.dart';
import '../../domain/entities/quantity_field_nested_entity.dart';
import '../../domain/entities/quantity_type_nested_entity.dart';
import 'program_quantity_segment_breakdown_page.dart';

class ProgramQuantityFieldsPage extends StatefulWidget {
  final QuantityTypeNested quantityType;
  final Map<String, dynamic>? existingData;

  const ProgramQuantityFieldsPage({
    super.key,
    required this.quantityType,
    this.existingData,
  });

  @override
  State<ProgramQuantityFieldsPage> createState() =>
      _ProgramQuantityFieldsPageState();
}

class _ProgramQuantityFieldsPageState extends State<ProgramQuantityFieldsPage> {
  final Map<String, dynamic> _fieldValues = {};
  final Map<String, TextEditingController> _controllers = {};

  @override
  void initState() {
    super.initState();
    _loadExistingData();
    _initializeControllers();
  }

  void _loadExistingData() {
    if (widget.existingData != null) {
      _fieldValues.addAll(
        Map<String, dynamic>.from(widget.existingData!['fields'] ?? {}),
      );
    }
  }

  void _initializeControllers() {
    final fields = _getNonSegmentFields();
    for (var field in fields) {
      if (field.fieldType == 'DECIMAL' || field.fieldType == 'TEXT') {
        final controller = TextEditingController(
          text: _fieldValues[field.code]?.toString() ?? '',
        );
        _controllers[field.code!] = controller;
      }
    }
  }

  @override
  void dispose() {
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  List<QuantityFieldNested> _getNonSegmentFields() {
    return widget.quantityType.quantityFields
            ?.where((f) => f.isForSegment == false)
            .toList() ??
        [];
  }

  void _handleFieldChange(String fieldCode, dynamic value) {
    setState(() {
      _fieldValues[fieldCode] = value;
    });
  }

  bool _validateFields() {
    final fields = _getNonSegmentFields();

    for (var field in fields) {
      if (field.isRequired == true) {
        final value = _fieldValues[field.code];
        if (value == null || value.toString().isEmpty) {
          CustomSnackBar.show(
            context,
            '${field.name} is required',
            type: SnackBarType.error,
          );
          return false;
        }
      }
    }

    return true;
  }

  void _handleNext() async {
    if (!_validateFields()) return;

    if (widget.quantityType.hasSegmentBreakdown == true) {
      // Navigate to segment breakdown
      final result = await Navigator.push<List<Map<String, dynamic>>>(
        context,
        MaterialPageRoute(
          builder: (context) => ProgramQuantitySegmentBreakdownPage(
            quantityType: widget.quantityType,
            fieldValues: _fieldValues,
            existingSegments: widget.existingData?['segments'],
          ),
        ),
      );

      if (result != null) {
        _returnResult(result);
      }
    } else {
      // No segments, return directly
      _returnResult([]);
    }
  }

  void _returnResult(List<Map<String, dynamic>> segments) {
    final result = {
      'quantityTypeUID': widget.quantityType.uid,
      'name': widget.quantityType.name,
      'code': widget.quantityType.code,
      'fields': _fieldValues,
      'segments': segments,
      'hasSegmentBreakdown': widget.quantityType.hasSegmentBreakdown,
    };

    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    final fields = _getNonSegmentFields();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        titleSpacing: 20,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(0.1),
                      blurRadius: 5,
                      offset: Offset(-2, 6),
                    ),
                  ],
                ),
                child: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.black,
                  size: 25,
                ),
              ),
            ),
            SizedBox(width: ResponsiveHelper.spacing(context, 15)),
            Expanded(
              child: Text(
                widget.quantityType.name ?? 'Quantity Fields',
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: ResponsiveHelper.padding(
          context,
          vertical: 25,
          horizontal: 20,
        ),
        child: Column(
          children: [
            // Description banner
            if (widget.quantityType.description != null &&
                widget.quantityType.description!.isNotEmpty)
              Container(
                width: double.infinity,
                padding: ResponsiveHelper.padding(context, all: 12),
                margin: ResponsiveHelper.padding(context, bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, color: Colors.blue, size: 20),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        widget.quantityType.description!,
                        style: TextStyle(
                          fontSize: ResponsiveHelper.fontSize(
                            context,
                            base: 13,
                          ),
                          color: Colors.blue.shade900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: fields.map((field) => _buildField(field)).toList(),
                ),
              ),
            ),

            // Validation message
            if (!_isFormValid())
              Text(
                'Please fill in all required fields before continuing',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: ResponsiveHelper.fontSize(context, base: 12),
                ),
                textAlign: TextAlign.center,
              ),

            // Continue Button
            Container(
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isFormValid() ? _handleNext : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: _isFormValid() ? primaryColor : Colors.grey,
                  padding: ResponsiveHelper.padding(context, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                  disabledBackgroundColor: Colors.grey,
                ),
                child: Text(
                  widget.quantityType.hasSegmentBreakdown == true
                      ? 'Continue'
                      : 'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: ResponsiveHelper.fontSize(context, base: 14),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  bool _isFormValid() {
    final fields = _getNonSegmentFields();
    for (var field in fields) {
      if (field.isRequired == true) {
        final value = _fieldValues[field.code];
        if (value == null || value.toString().isEmpty) {
          return false;
        }
      }
    }
    return true;
  }

  Widget _buildField(QuantityFieldNested field) {
    final fieldCode = field.code!;
    final currentValue = _fieldValues[fieldCode];

    print(
      '🔑 [FIELD DEBUG] Building field: "${field.name}" with code: $fieldCode',
    );
    print('   - Current value: $currentValue');
    print('   - Field type: ${field.fieldType}');

    // DROPDOWN field
    if (field.fieldType == 'DROPDOWN') {
      return DailyReportCreationFields(
        focus: false,
        title: field.name ?? '',
        description: field.placeholder ?? 'Choose ${field.name?.toLowerCase()}',
        icon: _getFieldIcon(field),
        isTextField: false,
        isBottomSheet: true,
        isTextNumber: false,
        currentValue: currentValue,
        onTap: () {
          final options = field.dropdownOptions ?? [];

          if (options.isEmpty) {
            CustomSnackBar.show(
              context,
              'No options available',
              type: SnackBarType.warning,
            );
            return;
          }

          showFlexibleBottomsheet(
            context: context,
            title: field.name ?? 'Select Option',
            attributes: options.map((opt) => opt.value ?? '').toList(),
            isRadio: true,
            onSelectionChanged: (selectedValue) {
              setState(() {
                _fieldValues[fieldCode] = selectedValue;
              });
              print('✅ ${field.name} selected: $selectedValue');
            },
          );
        },
      );
    }

    // DECIMAL field
    if (field.fieldType == 'DECIMAL') {
      return DailyReportCreationFields(
        focus: false,
        title: field.name ?? '',
        description: field.placeholder ?? 'Enter ${field.name?.toLowerCase()}',
        icon: _getFieldIcon(field),
        isTextField: true,
        isBottomSheet: false,
        isTextNumber: true,
        textFieldHintText:
            field.placeholder ?? 'Type ${field.name?.toLowerCase()}',
        textFieldUnits: field.unit,
        textFieldRange: field.maxValue?.toDouble(),
        currentValue: currentValue?.toString(),
        onTextChanged: (value) {
          setState(() {
            _fieldValues[fieldCode] = value;
          });
          print('✅ ${field.name} changed: $value');
        },
      );
    }

    // TEXT field
    if (field.fieldType == 'TEXT') {
      return DailyReportCreationFields(
        focus: false,
        title: field.name ?? '',
        description: field.placeholder ?? 'Enter ${field.name?.toLowerCase()}',
        icon: _getFieldIcon(field),
        isTextField: true,
        isBottomSheet: false,
        isTextNumber: false,
        textFieldHintText:
            field.placeholder ?? 'Type ${field.name?.toLowerCase()}',
        currentValue: currentValue?.toString(),
        onTextChanged: (value) {
          setState(() {
            _fieldValues[fieldCode] = value;
          });
          print('✅ ${field.name} changed: $value');
        },
      );
    }

    return SizedBox.shrink();
  }

  IconData _getFieldIcon(QuantityFieldNested field) {
    final code = field.code?.toLowerCase() ?? '';

    if (code.contains('direction')) {
      return Icons.route;
    } else if (code.contains('length')) {
      return Icons.straighten;
    } else if (code.contains('width')) {
      return Icons.width_normal;
    } else if (code.contains('depth')) {
      return Icons.vertical_align_center;
    } else if (code.contains('total')) {
      return Icons.calculate;
    } else if (field.fieldType == 'DROPDOWN') {
      return Icons.list;
    } else if (field.fieldType == 'DECIMAL') {
      return Icons.pin;
    } else {
      return Icons.text_fields;
    }
  }
}
