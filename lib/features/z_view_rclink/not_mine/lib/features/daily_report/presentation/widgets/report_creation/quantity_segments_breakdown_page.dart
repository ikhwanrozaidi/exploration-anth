import 'package:flutter/material.dart';
import 'package:rclink_app/features/work_scope/domain/entities/quantity_field.dart';
import '../../../../../shared/utils/responsive_helper.dart';
import '../../../../../shared/utils/theme.dart';

class QuantitySegmentBreakdownPage extends StatefulWidget {
  final String quantityName;
  final Map<String, dynamic>? existingData;
  final int segmentSize;
  final int maxSegmentLength;
  final List<QuantityField> segmentFields;
  final List<QuantityField> allQuantityFields;

  const QuantitySegmentBreakdownPage({
    Key? key,
    required this.quantityName,
    this.existingData,
    required this.segmentSize,
    required this.maxSegmentLength,
    required this.segmentFields,
    required this.allQuantityFields,
  }) : super(key: key);

  @override
  State<QuantitySegmentBreakdownPage> createState() =>
      _QuantitySegmentBreakdownPageState();
}

class _QuantitySegmentBreakdownPageState
    extends State<QuantitySegmentBreakdownPage> {
  List<Map<String, dynamic>> segments = [];
  double totalLength = 0;

  @override
  void initState() {
    super.initState();
    _initializeSegments();
  }

  void _initializeSegments() {
    final fieldValues =
        widget.existingData?['fieldValues'] as Map<String, dynamic>? ?? {};

    final totalLengthField = widget.allQuantityFields.firstWhere(
      (field) => field.code.toLowerCase() == 'total_length',
      orElse: () => widget.allQuantityFields.first,
    );

    final totalLengthValue = fieldValues[totalLengthField.uid];
    totalLength = double.tryParse(totalLengthValue?.toString() ?? '0') ?? 0;

    if (totalLength > 0) {
      _generateSegments();
    }
  }

  void _generateSegments() {
    segments.clear();

    int numberOfSegments = (totalLength / widget.segmentSize).ceil();

    for (int i = 0; i <= numberOfSegments; i++) {
      double startDistance = i * widget.segmentSize.toDouble();
      double endDistance = ((i + 1) * widget.segmentSize).toDouble();

      if (endDistance > totalLength) {
        endDistance = totalLength;
      }

      Map<String, dynamic> segmentValues = {};
      for (var field in widget.segmentFields) {
        segmentValues[field.uid] = null;
      }

      segments.add({
        'segmentNumber': i + 1,
        'startDistance': startDistance,
        'endDistance': endDistance,
        'segmentValues': segmentValues,
      });

      if (endDistance >= totalLength) {
        break;
      }
    }

    setState(() {});
  }

  void _saveData() {
    final segmentsData = segments.map((segment) {
      return {
        'segmentNumber': segment['segmentNumber'],
        'startDistance': segment['startDistance'],
        'endDistance': segment['endDistance'],
        'segmentValues': (segment['segmentValues'] as Map<String, dynamic>)
            .entries
            .map((entry) {
              return {'quantityFieldUID': entry.key, 'value': entry.value};
            })
            .toList(),
      };
    }).toList();

    final completeData = {...?widget.existingData, 'segments': segmentsData};

    Navigator.pop(context, completeData);
  }

  @override
  Widget build(BuildContext context) {
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
                'Segment Breakdown',
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
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            // Segments List
            Expanded(
              child: segments.isEmpty
                  ? Center(
                      child: Text(
                        'No total length entered',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: segments.length,
                      itemBuilder: (context, index) {
                        return _buildSegmentCard(segments[index], index);
                      },
                    ),
            ),

            // Save Button
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: segments.isEmpty ? null : () => _saveData(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                  padding: ResponsiveHelper.padding(context, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Save',
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

  Widget _buildSegmentCard(Map<String, dynamic> segment, int index) {
    final startDistance = segment['startDistance'] as double;
    final endDistance = segment['endDistance'] as double;
    final segmentValues = segment['segmentValues'] as Map<String, dynamic>;

    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Segment Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Segment ${segment['segmentNumber']}',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: primaryColor,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  '${startDistance.toStringAsFixed(0)}m - ${endDistance.toStringAsFixed(0)}m',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 15),

          // Input Fields
          ...widget.segmentFields.map((field) {
            return _buildSegmentField(field, segmentValues, index);
          }).toList(),
        ],
      ),
    );
  }

  Widget _buildSegmentField(
    QuantityField field,
    Map<String, dynamic> segmentValues,
    int segmentIndex,
  ) {
    final currentValue = segmentValues[field.uid];

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            field.name,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 8),
          TextField(
            keyboardType:
                field.fieldType == 'DECIMAL' || field.fieldType == 'INTEGER'
                ? TextInputType.numberWithOptions(decimal: true)
                : TextInputType.text,
            decoration: InputDecoration(
              hintText:
                  field.placeholder ?? 'Enter ${field.name.toLowerCase()}',
              suffixText: field.unit,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey.shade400),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: primaryColor, width: 2),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 12,
              ),
            ),
            onChanged: (value) {
              setState(() {
                segments[segmentIndex]['segmentValues'][field.uid] = value;
              });
            },
            controller: TextEditingController(
              text: currentValue?.toString() ?? '',
            ),
          ),
        ],
      ),
    );
  }
}
