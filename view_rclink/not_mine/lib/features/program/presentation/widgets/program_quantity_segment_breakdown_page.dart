import 'package:flutter/material.dart';

import '../../../../shared/utils/responsive_helper.dart';
import '../../../../shared/utils/theme.dart';
import '../../../../shared/widgets/custom_snackbar.dart';
import '../../domain/entities/quantity_field_nested_entity.dart';
import '../../domain/entities/quantity_type_nested_entity.dart';

class ProgramQuantitySegmentBreakdownPage extends StatefulWidget {
  final QuantityTypeNested quantityType;
  final Map<String, dynamic> fieldValues;
  final List<dynamic>? existingSegments;

  const ProgramQuantitySegmentBreakdownPage({
    super.key,
    required this.quantityType,
    required this.fieldValues,
    this.existingSegments,
  });

  @override
  State<ProgramQuantitySegmentBreakdownPage> createState() =>
      _ProgramQuantitySegmentBreakdownPageState();
}

class _ProgramQuantitySegmentBreakdownPageState
    extends State<ProgramQuantitySegmentBreakdownPage> {
  List<Map<String, dynamic>> _segments = [];

  @override
  void initState() {
    super.initState();
    _calculateSegments();
  }

  void _calculateSegments() {
    final totalLengthStr = widget.fieldValues['total_length'];
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
        final existingSegment =
            widget.existingSegments != null &&
                index < widget.existingSegments!.length
            ? widget.existingSegments![index] as Map<String, dynamic>
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

  List<QuantityFieldNested> _getSegmentFields() {
    return widget.quantityType.quantityFields
            ?.where((f) => f.isForSegment == true)
            .toList() ??
        [];
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

  bool _validateSegments() {
    if (_segments.isEmpty) {
      CustomSnackBar.show(
        context,
        'No segments to save',
        type: SnackBarType.error,
      );
      return false;
    }

    final segmentFields = _getSegmentFields();
    final requiredFields = segmentFields.where((f) => f.isRequired == true);

    for (var i = 0; i < _segments.length; i++) {
      for (var field in requiredFields) {
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

    return true;
  }

  void _handleSave() {
    if (!_validateSegments()) return;

    Navigator.pop(context, _segments);
  }

  @override
  Widget build(BuildContext context) {
    final segmentFields = _getSegmentFields();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Segment Breakdown',
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
          // Info banner
          Container(
            width: double.infinity,
            padding: ResponsiveHelper.padding(context, all: 12),
            color: Colors.orange.shade50,
            child: Row(
              children: [
                Icon(Icons.space_dashboard, color: Colors.orange, size: 20),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '${_segments.length} segment${_segments.length > 1 ? 's' : ''} (${widget.quantityType.segmentSize}m each)',
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(context, base: 13),
                      color: Colors.orange.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: ListView.separated(
              padding: ResponsiveHelper.padding(context, all: 20),
              itemCount: _segments.length,
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemBuilder: (context, index) {
                return _buildSegmentCard(index, segmentFields);
              },
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

  Widget _buildSegmentCard(int index, List<QuantityFieldNested> segmentFields) {
    final segment = _segments[index];

    return Card(
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
