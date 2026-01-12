import 'package:flutter/material.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../domain/entities/quantity_field_nested_entity.dart';
import '../../domain/entities/quantity_type_nested_entity.dart';

class ProgramQuantityDetailPage extends StatefulWidget {
  final QuantityTypeNested quantityType;
  final Map<String, dynamic>? existingData;

  const ProgramQuantityDetailPage({
    super.key,
    required this.quantityType,
    this.existingData,
  });

  @override
  State<ProgramQuantityDetailPage> createState() =>
      _ProgramQuantityDetailPageState();
}

class _ProgramQuantityDetailPageState extends State<ProgramQuantityDetailPage> {
  final Map<String, dynamic> _fieldValues = {};
  final Map<String, TextEditingController> _controllers = {};
  List<Map<String, dynamic>> _segments = [];

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
      if (widget.existingData!['segments'] != null) {
        _segments = List<Map<String, dynamic>>.from(
          widget.existingData!['segments'],
        );
      }
    }
  }

  void _initializeControllers() {
    final fields = widget.quantityType.quantityFields ?? [];
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

  void _handleFieldChange(String fieldCode, dynamic value) {
    setState(() {
      _fieldValues[fieldCode] = value;
    });

    // Auto-calculate segments if total_length changes
    if (fieldCode == 'total_length' &&
        widget.quantityType.hasSegmentBreakdown == true) {
      _calculateSegments();
    }
  }

  void _calculateSegments() {
    final totalLengthStr = _fieldValues['total_length'];
    if (totalLengthStr == null || totalLengthStr.toString().isEmpty) {
      setState(() {
        _segments = [];
      });
      return;
    }

    final totalLength = double.tryParse(totalLengthStr.toString());
    if (totalLength == null || totalLength <= 0) {
      setState(() {
        _segments = [];
      });
      return;
    }

    final segmentSize = widget.quantityType.segmentSize ?? 25;
    final segmentCount = (totalLength / segmentSize).ceil();

    setState(() {
      _segments = List.generate(segmentCount, (index) {
        final startDistance = index * segmentSize.toDouble();
        final endDistance = ((index + 1) * segmentSize.toDouble()).clamp(
          0,
          totalLength.toDouble(),
        );
        final segmentLength = endDistance - startDistance;

        // Preserve existing segment data if available
        final existingSegment = index < _segments.length
            ? _segments[index]
            : null;

        return {
          'segmentNumber': index + 1,
          'startDistance': startDistance,
          'endDistance': endDistance,
          'segment_length': existingSegment?['segment_length'] ?? segmentLength,
          'segment_width': existingSegment?['segment_width'],
          'segment_depth': existingSegment?['segment_depth'],
        };
      });
    });

    print('📐 Calculated ${_segments.length} segments for $totalLength m');
  }

  void _handleSegmentFieldChange(
    int segmentIndex,
    String fieldCode,
    dynamic value,
  ) {
    setState(() {
      _segments[segmentIndex][fieldCode] = value;
    });
  }

  bool _validateForm() {
    final fields = widget.quantityType.quantityFields ?? [];

    // Check required non-segment fields
    for (var field in fields) {
      if (field.isRequired == true && field.isForSegment == false) {
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

    // Check segments if applicable
    if (widget.quantityType.hasSegmentBreakdown == true) {
      if (_segments.isEmpty) {
        CustomSnackBar.show(
          context,
          'Please enter total length to generate segments',
          type: SnackBarType.error,
        );
        return false;
      }

      // Check required segment fields
      final segmentFields = fields.where(
        (f) => f.isForSegment == true && f.isRequired == true,
      );
      for (var i = 0; i < _segments.length; i++) {
        for (var field in segmentFields) {
          final value = _segments[i][field.code];
          if (value == null || value.toString().isEmpty) {
            CustomSnackBar.show(
              context,
              'Segment ${i + 1}: ${field.name} is required',
              type: SnackBarType.error,
            );
            return false;
          }
        }
      }
    }

    return true;
  }

  void _handleSave() {
    if (!_validateForm()) return;

    final result = {
      'quantityTypeUID': widget.quantityType.uid,
      'name': widget.quantityType.name,
      'code': widget.quantityType.code,
      'fields': _fieldValues,
      'segments': _segments,
      'hasSegmentBreakdown': widget.quantityType.hasSegmentBreakdown,
    };

    Navigator.pop(context, result);
  }

  @override
  Widget build(BuildContext context) {
    final nonSegmentFields =
        widget.quantityType.quantityFields
            ?.where((f) => f.isForSegment == false)
            .toList() ??
        [];
    final segmentFields =
        widget.quantityType.quantityFields
            ?.where((f) => f.isForSegment == true)
            .toList() ??
        [];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.quantityType.name ?? 'Quantity Details',
          style: TextStyle(
            fontSize: ResponsiveHelper.fontSize(context, base: 18),
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: ResponsiveHelper.padding(context, all: 20),
              children: [
                // Description
                if (widget.quantityType.description != null &&
                    widget.quantityType.description!.isNotEmpty) ...[
                  Container(
                    padding: ResponsiveHelper.padding(context, all: 12),
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
                  SizedBox(height: 20),
                ],

                // Non-segment fields
                Text(
                  'General Information',
                  style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(context, base: 16),
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 12),

                ...nonSegmentFields.map((field) => _buildFieldWidget(field)),

                // Segments section
                if (widget.quantityType.hasSegmentBreakdown == true &&
                    _segments.isNotEmpty) ...[
                  SizedBox(height: 30),
                  Text(
                    'Segment Breakdown (${_segments.length} segments)',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 16),
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 12),

                  ...List.generate(_segments.length, (index) {
                    return _buildSegmentCard(index, segmentFields);
                  }),
                ],

                SizedBox(height: 80),
              ],
            ),
          ),

          // Save button
          Container(
            padding: ResponsiveHelper.padding(
              context,
              horizontal: 20,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _handleSave,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    padding: ResponsiveHelper.padding(context, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: Text(
                    'Save',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveHelper.fontSize(context, base: 16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFieldWidget(QuantityFieldNested field) {
    return Padding(
      padding: ResponsiveHelper.padding(context, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                field.name ?? '',
                style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(context, base: 14),
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              if (field.isRequired == true)
                Text(' *', style: TextStyle(color: Colors.red, fontSize: 14)),
            ],
          ),
          SizedBox(height: 8),
          if (field.fieldType == 'DROPDOWN')
            _buildDropdownField(field)
          else if (field.fieldType == 'DECIMAL')
            _buildDecimalField(field)
          else if (field.fieldType == 'TEXT')
            _buildTextField(field),
        ],
      ),
    );
  }

  Widget _buildDropdownField(QuantityFieldNested field) {
    final options = field.dropdownOptions ?? [];

    return DropdownButtonFormField<String>(
      value: _fieldValues[field.code],
      decoration: InputDecoration(
        hintText: field.placeholder ?? 'Select ${field.name}',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
      items: options.map((option) {
        return DropdownMenuItem<String>(
          value: option.value,
          child: Text(option.value ?? ''),
        );
      }).toList(),
      onChanged: (value) => _handleFieldChange(field.code!, value),
    );
  }

  Widget _buildDecimalField(QuantityFieldNested field) {
    return TextFormField(
      controller: _controllers[field.code],
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        hintText: field.placeholder ?? 'Enter ${field.name}',
        suffixText: field.unit,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
      onChanged: (value) => _handleFieldChange(field.code!, value),
    );
  }

  Widget _buildTextField(QuantityFieldNested field) {
    return TextFormField(
      controller: _controllers[field.code],
      decoration: InputDecoration(
        hintText: field.placeholder ?? 'Enter ${field.name}',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      ),
      onChanged: (value) => _handleFieldChange(field.code!, value),
    );
  }

  Widget _buildSegmentCard(int index, List<QuantityFieldNested> segmentFields) {
    final segment = _segments[index];

    return Card(
      margin: ResponsiveHelper.padding(context, bottom: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: ResponsiveHelper.padding(context, all: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Segment ${segment['segmentNumber']}',
                  style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(context, base: 15),
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                Text(
                  '${segment['startDistance'].toStringAsFixed(1)}m - ${segment['endDistance'].toStringAsFixed(1)}m',
                  style: TextStyle(
                    fontSize: ResponsiveHelper.fontSize(context, base: 13),
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            ...segmentFields.map(
              (field) => _buildSegmentFieldWidget(index, field),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSegmentFieldWidget(int segmentIndex, QuantityFieldNested field) {
    final segment = _segments[segmentIndex];
    final value = segment[field.code];

    return Padding(
      padding: ResponsiveHelper.padding(context, bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                field.name ?? '',
                style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(context, base: 13),
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              if (field.isRequired == true)
                Text(' *', style: TextStyle(color: Colors.red, fontSize: 13)),
            ],
          ),
          SizedBox(height: 6),
          TextFormField(
            initialValue: value?.toString() ?? '',
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: field.placeholder ?? 'Enter ${field.name}',
              suffixText: field.unit,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              isDense: true,
            ),
            onChanged: (newValue) =>
                _handleSegmentFieldChange(segmentIndex, field.code!, newValue),
          ),
        ],
      ),
    );
  }
}
